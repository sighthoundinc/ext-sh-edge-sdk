ARG L4TBASE_VERSION="r32.4.3"
FROM nvcr.io/nvidia/l4t-base:${L4TBASE_VERSION}

RUN apt-get update && \
    apt-get install -y \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    git \
    gtk-doc-tools \
    ca-certificates \
    iproute2

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN git clone -b 1.14.5 https://github.com/GStreamer/gst-rtsp-server.git && \
    cd gst-rtsp-server && \
    ./autogen.sh && \
    make

ADD rtsp-stream.sh /usr/src/app

CMD [ "./rtsp-stream.sh" ]
