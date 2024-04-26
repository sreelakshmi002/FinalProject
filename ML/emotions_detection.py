import cv2
import numpy as np
import h5py
from keras.models import load_model
from statistics import mode

from ML.utils.datasets import get_labels
from ML.utils.inference import detect_faces
from ML.utils.inference import draw_text
from ML.utils.inference import draw_bounding_box
from ML.utils.inference import apply_offsets
from ML.utils.inference import load_detection_model
from ML.utils.preprocessor import preprocess_input
import statistics
from keras import backend as K

def predict():
    # parameters for loading data and images
    emotion_model_path = './ML/models/emotion_model.hdf5'
    emotion_labels = get_labels('fer2013')

    # hyper-parameters for bounding boxes shape
    frame_window = 10
    emotion_offsets = (20, 40)

    # loading models
    face_cascade = cv2.CascadeClassifier('./ML/models/haarcascade_frontalface_default.xml')
    emotion_classifier = load_model(emotion_model_path)

    # getting input model shapes for inference
    emotion_target_size = emotion_classifier.input_shape[1:3]

    # starting lists for calculating modes
    emotion_window = []

    # starting video streaming
    cv2.namedWindow('window_frame')
    cap = cv2.VideoCapture(0) # Webcam source

    i=0

    while cap.isOpened(): # True:
        ret, bgr_image = cap.read()

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
            #print(emotion_text)
            emotion_window.append(emotion_text)

            if len(emotion_window) > frame_window:
                emotion_window.pop(0)
            try:
                emotion_mode = mode(emotion_window)
            except:
                continue

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
            draw_text(face_coordinates, rgb_image, emotion_mode,
                      color, 0, -45, 1, 1)

        bgr_image = cv2.cvtColor(rgb_image, cv2.COLOR_RGB2BGR)

        cv2.imshow('window_frame', bgr_image)		
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
        i+=1
        if cv2.waitKey(1) & i>60:
            break
            
    print(emotion_window)
    out=statistics.mode(emotion_window)
    #print(out)
    if out in ['happy','surprise']:
            stress="low"
    elif out in ['sad','fear','neutral']:
            stress="medium"
    else:
            stress="high"

    cap.release()
    cv2.destroyAllWindows()
    K.clear_session()
    return out,stress
    
#out=predict()
#print(out)
    



