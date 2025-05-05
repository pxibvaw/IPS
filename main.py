from fastapi import FastAPI, UploadFile, File
from fastapi.responses import JSONResponse
from PIL import Image
import os
import shutil
import time
import numpy as np
import tensorflow as tf
# TensorFlow 모델 불러오기

MODEL_PATH = "model/model.h5"

try:
    model = tf.keras.models.load_model(MODEL_PATH)
    print("✅ 모델 불러오기 성공!")
except Exception as e:
    print(f"⚠️ 모델 불러오기 실패: {e}")
    model = None


app = FastAPI()

# 업로드 폴더 만들기
UPLOAD_DIR = "uploads"
os.makedirs(UPLOAD_DIR, exist_ok=True)

# 기본 확인 API
@app.get("/")
def root():
    return {"message": "Hello FastAPI!"}

# 이미지 업로드 API
@app.post("/upload")
async def upload_file(file: UploadFile = File(...)):
    file_path = os.path.join(UPLOAD_DIR, file.filename)
    with open(file_path, "wb") as buffer:
        shutil.copyfileobj(file.file, buffer)
    return {"filename": file.filename, "status": "success"}

# 이미지 예측 API (모델 없이 mock 결과)
@app.post("/predict")
async def predict_image(file: UploadFile = File(...)):
    filename = f"{int(time.time())}_{file.filename}"
    file_path = os.path.join(UPLOAD_DIR, filename)

    # 1. 파일 저장
    with open(file_path, "wb") as buffer:
        shutil.copyfileobj(file.file, buffer)

    # 2. 모델 없을 때 처리
    if model is None:
        return {"filename": filename, "prediction": "모델 없음", "status": "error"}

    # 3. 이미지 전처리
    try:
        img = Image.open(file_path).convert("RGB")
        img = img.resize((224, 224))  # 더미 모델 입력 사이즈에 맞춤
        img_array = np.array(img) / 255.0  # 정규화
        img_array = np.expand_dims(img_array, axis=0)  # (1, 224, 224, 3)

        # 4. 예측
        preds = model.predict(img_array)
        class_idx = np.argmax(preds)
        class_labels = ["cat", "dog"]  # 클래스 이름은 임의 지정
        prediction = class_labels[class_idx]

        return {"filename": filename, "prediction": prediction, "status": "success"}

    except Exception as e:
        return {"filename": filename, "prediction": "예측 실패", "error": str(e), "status": "error"}

