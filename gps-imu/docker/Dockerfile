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
          libjpeg8-dev && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get -y install git
RUN apt-get -y install vim python3-smbus gpsd python3-setuptools
RUN pip3 install gpsd-py3
RUN cd /home && git clone https://github.com/jackw01/l3gd20-python.git && \
        cd l3gd20-python && \
        python3 setup.py install
RUN cd /home && git clone https://github.com/BoulderAI/LSM303DLHC_Python.git

COPY bai-test-accel.py /home/LSM303DLHC_Python 
COPY bai-test-gps.py /home/
COPY start-gpsd.sh /home/

WORKDIR /home
