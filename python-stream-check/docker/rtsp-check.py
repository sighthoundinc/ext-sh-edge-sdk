import cv2
try:
    cap=cv2.VideoCapture("rtsp://127.0.0.1:8554/test")
    if cap.isOpened() == False:
        print("VideoCapture failed")
        exit(1)
    ret,frame = cap.read()
    while ret:
        ret,frame = cap.read()
        break
    cv2.destroyAllWindows()
    cap.release()
    print("Stream is up")
except:
    print("Stream is down")
    exit(1)
