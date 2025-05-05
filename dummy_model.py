import tensorflow as tf
from tensorflow.keras import layers, models

# 아주 간단한 모델: 이미지 분류 흉내
model = models.Sequential([
    layers.Input(shape=(224, 224, 3)),  # 입력 이미지 크기
    layers.Conv2D(16, (3, 3), activation='relu'),
    layers.Flatten(),
    layers.Dense(2, activation='softmax')  # 클래스가 2개 있다고 가정
])

# 컴파일
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# 모델 저장 (model/ 폴더가 있어야 함)
model.save("model/model.h5")
print("✅ 더미 모델 저장 완료!")
