ARG L4TBASE_VERSION=""
FROM nvcr.io/nvidia/l4t-base:${L4TBASE_VERSION}

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates && rm -rf /var/lib/apt/lists/*

# Include python in container, see https://github.com/dusty-nv/jetson-containers/issues/5#issuecomment-632829664
ENV DEBIAN_FRONTEND=noninteractive

COPY  apt-nvidia/nvidia-l4t-apt-source.list /etc/apt/sources.list.d/nvidia-l4t-apt-source.list
COPY  apt-nvidia/jetson-ota-public.asc /etc/apt/trusted.gpg.d/jetson-ota-public.asc


RUN apt-get update && apt-get install -y libopencv-python && apt-get install -y --no-install-recommends \
          python3-pip \
          python3-dev \
          build-essential \
          zlib1g-dev \
          zip \
          python3-setuptools \
          libjpeg8-dev && rm -rf /var/lib/apt/lists/*

RUN pip3 install setuptools Cython wheel
RUN pip3 install numpy --verbose

RUN mkdir -p /usr/src/app

ADD rtsp-check.py /usr/src/app 

WORKDIR /usr/src/app

CMD [ "python3", "-u", "./rtsp-check.py" ]
