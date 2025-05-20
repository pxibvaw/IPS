# IPS

ips 대회 진행관련 repository 입니다.
강아지똥으로 건강상태 분석하는 주제입니다.

## 📦 Pretrained Model

Download the model here:  
[bestmodel.keras (Google Drive)](https://drive.google.com/uc?id=1ebS8pQxgxWxnnaH0hPeqTmMaiFPfnzql&export=download)

```python
import tensorflow as tf

# 다운로드한 파일 경로를 지정하세요
model = tf.keras.models.load_model('bestmodel.keras')
