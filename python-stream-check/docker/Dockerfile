ARG L4TBASE_VERSION="r32.4.3"
FROM gcr.io/external-bai/bai-jetson-opencv-python:1.0-${L4TBASE_VERSION}

RUN mkdir -p /usr/src/app

ADD rtsp-check.py /usr/src/app 

WORKDIR /usr/src/app

CMD [ "python3", "-u", "./rtsp-check.py" ]
