import cv2
import numpy as np
from keras.models import load_model
from ML.utils.datasets import get_labels
from ML.utils.inference import detect_faces
from ML.utils.inference import draw_text
from ML.utils.inference import draw_bounding_box
from ML.utils.inference import apply_offsets
from ML.utils.preprocessor import preprocess_input
import statistics
from keras import backend as K

def predict_emotion(image_path):
    # parameters for loading data and images
    emotion_model_path = './ML/models/emotion_model.hdf5'
    emotion_labels = get_labels('fer2013')

    # hyper-parameters for bounding boxes shape
    emotion_offsets = (20, 40)

    # loading models
    face_cascade = cv2.CascadeClassifier('./ML/models/haarcascade_frontalface_default.xml')
    emotion_classifier = load_model(emotion_model_path)

    # getting input model shapes for inference
    emotion_target_size = emotion_classifier.input_shape[1:3]

    # Load the image
    bgr_image = cv2.imread(image_path)
    gray_image = cv2.cvtColor(bgr_image, cv2.COLOR_BGR2GRAY)
    rgb_image = cv2.cvtColor(bgr_image, cv2.COLOR_BGR2RGB)

    faces = face_cascade.detectMultiScale(gray_image, scaleFactor=1.1, minNeighbors=5,
                                            minSize=(30, 30), flags=cv2.CASCADE_SCALE_IMAGE)

    for face_coordinates in faces:
        x1, x2, y1, y2 = apply_offsets(face_coordinates, emotion_offsets)
        gray_face = gray_image[y1:y2, x1:x2]
        
        try:
            gray_face = cv2.resize(gray_face, (emotion_target_size))
        except:
            continue
            
        gray_face = preprocess_input(gray_face, True)
        gray_face = np.expand_dims(gray_face, 0)
        gray_face = np.expand_dims(gray_face, -1)
        emotion_prediction = emotion_classifier.predict(gray_face)
        emotion_probability = np.max(emotion_prediction)
        emotion_label_arg = np.argmax(emotion_prediction)
        emotion_text = emotion_labels[emotion_label_arg]

        print(emotion_text)

        color = (255, 0, 0)  # Red color for bounding box
        if emotion_text == 'angry':
            color = emotion_probability * np.asarray((255, 0, 0))
        elif emotion_text == 'sad':
            color = emotion_probability * np.asarray((0, 0, 255))
        elif emotion_text == 'happy':
            color = emotion_probability * np.asarray((255, 255, 0))
        elif emotion_text == 'surprise':
            color = emotion_probability * np.asarray((0, 255, 255))
        elif emotion_text == 'fear':
            color = emotion_probability * np.asarray((238,130,238))
        elif emotion_text == 'disgust':
            color = emotion_probability * np.asarray((255,20,147))
        else:
            color = emotion_probability * np.asarray((0, 255, 0))

        color = color.astype(int)
        color = color.tolist()

        draw_bounding_box(face_coordinates, rgb_image, color)
        draw_text(face_coordinates, rgb_image, emotion_text, color, 0, -45, 1, 1)
        #print(emotion_text)

    cv2.imshow('Emotion Detection', cv2.cvtColor(rgb_image, cv2.COLOR_RGB2BGR))
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    K.clear_session()
   
    

    return emotion_text # Return value removed since it's not clear what it should be

# Example usage:
# image_path = 'path/to/your/image.jpg'
# emotion = predict_emotion(image_path)
# print("Dominant Emotion:", emotion)


# Example usage:
# image_path = 'path/to/your/image.jpg'
# emotion = predict_emotion(image_path)
# print("Dominant Emotion:", emotion)
