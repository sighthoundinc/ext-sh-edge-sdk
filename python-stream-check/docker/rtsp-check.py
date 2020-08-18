import cv2
try:
    cap=cv2.VideoCapture("rtsp://127.0.0.1:8554/test")

    ret,frame = cap.read()
    while ret:
        ret,frame = cap.read()
        print("Stream is up")
        break
    cv2.destroyAllWindows()
    cap.release()
    exit(0)
except:
    print("Stream is down")
    exit(1)
