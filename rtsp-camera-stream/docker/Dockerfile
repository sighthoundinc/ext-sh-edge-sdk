ARG L4TBASE_VERSION=""
ARG BAICAMERASRC_VERSION=""
ARG BAICAMERASRC_NAME=""

FROM nvcr.io/nvidia/l4t-base:${L4TBASE_VERSION} as build

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

# you can't do a "COPY from=image:{ARGUMENT}", so you have to create a layer using "FROM image:{ARGUMENT} as layer", then copy from the layer
FROM gcr.io/external-bai/${BAICAMERASRC_NAME}:${BAICAMERASRC_VERSION} as baicamerasrc
FROM build

COPY --from=baicamerasrc /baicamerasrc.deb /tmp/baicamerasrc.deb
RUN dpkg -i /tmp/baicamerasrc.deb

ADD rtsp-stream.sh /usr/src/app

ENTRYPOINT [ "./rtsp-stream.sh" ]
