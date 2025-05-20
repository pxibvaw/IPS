import tensorflow as tf
import os
import numpy as np
import matplotlib.pyplot as plt
from sklearn.metrics import classification_report, confusion_matrix
import collections

# 설정값
img_size = (128, 128)
batch_size = 32
num_classes = 4

# 경로 설정
train_dir = './train'
valid_dir = './valid'
test_dir  = './test'

model_dir = './model'
os.makedirs(model_dir, exist_ok=True)

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
train_ds = create_dataset_from_folder(train_dir, is_train=True)
valid_ds = create_dataset_from_folder(valid_dir, is_train=False)
test_ds = create_dataset_from_folder(test_dir, is_train=False)

# 레이블 분포 출력
label_counts = collections.Counter()
for _, label in train_ds.unbatch():
    label_counts[int(label.numpy())] += 1
print("Label Distribution in train_ds:")
for k, v in sorted(label_counts.items()):
    print(f"Class {k}: {v} samples")

# EfficientNetB0 기반 모델
def build_efficientnet_b0(input_shape=(128,128,3), num_classes=4, dropout_rate=0.5):
    base_model = tf.keras.applications.EfficientNetB0(
        include_top=False,
        weights='imagenet',
        input_shape=input_shape
    )
    base_model.trainable = True  # 전체 학습

    inputs = tf.keras.Input(shape=input_shape)
    x = base_model(inputs, training=True)
    x = tf.keras.layers.GlobalAveragePooling2D()(x)
    x = tf.keras.layers.Dense(256, activation='relu')(x)
    x = tf.keras.layers.Dropout(dropout_rate)(x)
    outputs = tf.keras.layers.Dense(num_classes, activation='softmax')(x)
    model = tf.keras.Model(inputs, outputs)
    return model, base_model

# 콜백
callbacks = [
    tf.keras.callbacks.ModelCheckpoint(
        filepath=os.path.join(model_dir, "best_model.keras"),
        monitor='val_loss',
        save_best_only=True,
        save_weights_only=False,
        mode='min',
        verbose=2
    ),
    tf.keras.callbacks.EarlyStopping(
        monitor='val_loss',
        patience=5,
        restore_best_weights=True
    ),
    tf.keras.callbacks.ReduceLROnPlateau(
        monitor='val_loss',
        factor=0.5,
        patience=3,
        verbose=1
    ),
]

# 모델 구성 및 학습
model, base_model = build_efficientnet_b0(input_shape=img_size+(3,), num_classes=num_classes)
model.compile(
    optimizer=tf.keras.optimizers.Adam(1e-5),  # 낮은 학습률
    loss='sparse_categorical_crossentropy',
    metrics=['accuracy']
)
model.fit(train_ds, validation_data=valid_ds, epochs=30, callbacks=callbacks)

# 테스트 성능 평가
test_loss, test_acc = model.evaluate(test_ds)
print(f"\nTest Accuracy: {test_acc:.2f}")

# 정밀 성능 분석
y_true, y_pred = [], []
for images, labels in test_ds:
    preds = model.predict(images)
    y_true.extend(labels.numpy())
    y_pred.extend(np.argmax(preds, axis=1))

print(confusion_matrix(y_true, y_pred))
print(classification_report(y_true, y_pred, target_names=['Diarrhea','Lack of Water','Normal','Soft Poop']))


# 학습 완료 후 best_model 로딩
best_model = tf.keras.models.load_model(os.path.join(model_dir, "best_model.keras"))

# 평가
test_loss, test_acc = best_model.evaluate(test_ds)
print(f"\nBest Model Test Accuracy: {test_acc:.2f}")

# 저장
best_model.save(os.path.join(model_dir, "final_model.keras"))


import os
import tensorflow as tf

def verify_model_saved_and_loadable(model_path, min_size_kb=100):
    print(f"\n [모델 확인 중] {model_path}")

    # 1. 파일 존재 여부
    if not os.path.exists(model_path):
        print(" 저장 실패: 파일이 존재하지 않습니다.")
        return False

    # 2. 용량 확인
    file_size = os.path.getsize(model_path)
    file_size_mb = round(file_size / (1024 * 1024), 2)
    if file_size < min_size_kb * 1024:
        print(f" 파일 존재하지만 너무 작음: {file_size_mb} MB (의심됨)")
    else:
        print(f" 파일 크기 확인됨: {file_size_mb} MB")

    # 3. 로딩 가능 여부 확인
    try:
        _ = tf.keras.models.load_model(model_path)
        print(" 모델 로딩 성공 (사용 가능)")
        return True
    except Exception as e:
        print(f" 모델 로딩 실패: {e}")
        return False


verify_model_saved_and_loadable(os.path.join(model_dir, "best_model.keras"))
verify_model_saved_and_loadable(os.path.join(model_dir, "final_model.keras"))
