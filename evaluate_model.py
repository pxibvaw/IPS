import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt
from sklearn.metrics import classification_report, confusion_matrix
import os

# 설정값
img_size = (128, 128)
batch_size = 32
num_classes = 4

# 경로 설정
train_dir = './train'
valid_dir = './valid'
test_dir  = './test'

# 접두어 → 클래스 매핑
def get_label_from_filename(filename):
    filename = tf.cast(filename, tf.string)
    basename = tf.strings.split(filename, os.sep)[-1]
    prefix = tf.strings.split(basename, '-')[0]

    label = tf.case([
        (tf.equal(prefix, 'D'), lambda: tf.constant(0)),
        (tf.equal(prefix, 'LW'), lambda: tf.constant(1)),
        (tf.equal(prefix, 'N'), lambda: tf.constant(2)),
        (tf.equal(prefix, 'SP'), lambda: tf.constant(3)),
    ], default=lambda: tf.constant(-1))

    return label

# 데이터 증강 (간소화)
data_augmentation = tf.keras.Sequential([
    tf.keras.layers.RandomFlip("horizontal"),
    tf.keras.layers.RandomRotation(0.05),
])

# 학습용 전처리
def preprocess_image_train(filename):
    image = tf.io.read_file(filename)
    image = tf.image.decode_image(image, channels=3)
    image.set_shape([None, None, 3])
    image = tf.image.resize(image, img_size)
    image = image / 255.0
    image = data_augmentation(image)
    label = get_label_from_filename(filename)
    return image, label

# 평가용 전처리
def preprocess_image_eval(filename):
    image = tf.io.read_file(filename)
    image = tf.image.decode_image(image, channels=3)
    image.set_shape([None, None, 3])
    image = tf.image.resize(image, img_size)
    image = image / 255.0
    label = get_label_from_filename(filename)
    return image, label

# 데이터셋 생성
def create_dataset_from_folder(folder_path, is_train=False):
    file_types = ['*.jpg', '*.jpeg', '*.png']
    filenames = []
    for ext in file_types:
        filenames += tf.io.gfile.glob(os.path.join(folder_path, ext))

    valid_filenames = []
    for f in filenames:
        try:
            img = tf.io.read_file(f)
            tf.image.decode_image(img, channels=3)
            valid_filenames.append(f)
        except:
            print(f" Invalid image skipped: {f}")

    valid_filenames = np.array(valid_filenames, dtype=str)
    dataset = tf.data.Dataset.from_tensor_slices(valid_filenames)
    preprocess_fn = preprocess_image_train if is_train else preprocess_image_eval
    dataset = dataset.map(preprocess_fn, num_parallel_calls=tf.data.AUTOTUNE)
    return dataset.batch(batch_size).prefetch(tf.data.AUTOTUNE)

# 데이터 로딩

test_ds = create_dataset_from_folder(test_dir, is_train=False)



# 모델 로드
model = tf.keras.models.load_model("model/best_model_b0.h5")

test_loss, test_acc = model.evaluate(test_ds)
print(f"\nTest Accuracy: {test_acc:.2f}")

#model.compile(
    #optimizer='adam',  # 평가
    #loss='sparse_categorical_crossentropy',
    #metrics=['accuracy']
#)

# 예측
y_true, y_pred = [], []
for images, labels in test_ds:
    preds = model.predict(images)
    y_true.extend(labels.numpy())
    y_pred.extend(np.argmax(preds, axis=1))
    

# 평가
print(confusion_matrix(y_true, y_pred))
print("\n📊 Classification Report:")
class_names = ['Diarrhea','Lack of Water','Normal','Soft Poop']
print(classification_report(y_true, y_pred, target_names=class_names))


# debug 코드로 클래스별 예측 비율을 출력해보자
import collections
print(collections.Counter(y_pred))