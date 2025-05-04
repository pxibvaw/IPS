import tensorflow as tf
import os

# 설정값
img_size = (128, 128)
batch_size = 32
num_classes = 4

# 경로 설정 (필요에 맞게 바꿔줘!)
train_dir = './train'
valid_dir = './valid'
test_dir  = './test'

# 접두어 → 클래스 매핑
def get_label_from_filename(filename):
    basename = tf.strings.split(filename, os.sep)[-1]
    prefix = tf.strings.split(basename, '-')[0]

    label = tf.case([
        (tf.equal(prefix, 'D'), lambda: tf.constant(0)),
        (tf.equal(prefix, 'LW'), lambda: tf.constant(1)),
        (tf.equal(prefix, 'N'), lambda: tf.constant(2)),
        (tf.equal(prefix, 'SP'), lambda: tf.constant(3)),
    ], default=lambda: tf.constant(-1))  # 예외 처리용
    return tf.one_hot(label, depth=num_classes)

# 이미지 전처리
def preprocess_image(filename):
    image = tf.io.read_file(filename)
    image = tf.image.decode_image(image, channels=3)  # 자동 감지: JPEG, PNG, etc.
    image.set_shape([*img_size, 3])                  
    image = tf.image.resize(image, img_size)
    image = image / 255.0
    label = get_label_from_filename(filename)
    return image, label

def create_dataset_from_folder(folder_path):
    # 이미지 확장자 필터링
    file_types = ['*.jpg', '*.jpeg', '*.png']
    filenames = []
    for ext in file_types:
        filenames += tf.io.gfile.glob(os.path.join(folder_path, ext))

    # 깨진 파일 제외
    valid_filenames = []
    for f in filenames:
        try:
            img = tf.io.read_file(f)
            tf.image.decode_image(img, channels=3)
            valid_filenames.append(f)
        except:
            print(f" Invalid image skipped: {f}")

    # Dataset 만들기
    dataset = tf.data.Dataset.from_tensor_slices(valid_filenames)
    dataset = dataset.map(preprocess_image, num_parallel_calls=tf.data.AUTOTUNE)
    return dataset.batch(batch_size).prefetch(tf.data.AUTOTUNE)

# 데이터셋 로딩
train_ds = create_dataset_from_folder(train_dir)
valid_ds = create_dataset_from_folder(valid_dir)
test_ds = create_dataset_from_folder(test_dir)

# 모델 구성
model = tf.keras.Sequential([
    tf.keras.layers.Conv2D(32, (3,3), activation='relu', input_shape=(128,128,3)),
    tf.keras.layers.MaxPooling2D(2,2),
    tf.keras.layers.Conv2D(64, (3,3), activation='relu'),
    tf.keras.layers.MaxPooling2D(2,2),
    tf.keras.layers.Conv2D(128, (3,3), activation='relu'),
    tf.keras.layers.MaxPooling2D(2,2),
    tf.keras.layers.Flatten(),
    tf.keras.layers.Dense(128, activation='relu'),
    tf.keras.layers.Dense(num_classes, activation='softmax')
])

model.compile(optimizer='adam',
              loss='categorical_crossentropy',
              metrics=['accuracy'])

# 학습
model.fit(train_ds, validation_data=valid_ds, epochs=10)

# 평가
test_loss, test_acc = model.evaluate(test_ds)
print(f"\nTest Accuracy: {test_acc:.2f}")