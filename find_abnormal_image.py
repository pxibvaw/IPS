from PIL import Image
import os

def verify_images(folder):
    for root, dirs, files in os.walk(folder):
        for fname in files:
            if fname.startswith('.'):  # 숨김 파일 무시
                continue
            try:
                img_path = os.path.join(root, fname)
                with Image.open(img_path) as img:
                    img.verify()
            except Exception as e:
                print(f"❌ {img_path} is not valid: {e}")

# 사용 예시
verify_images('./train')
verify_images('./valid')
verify_images('./test')
