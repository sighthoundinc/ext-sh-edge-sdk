ARG CUDA_IMAGE=""
FROM ${CUDA_IMAGE}

RUN apt-get update && \
    apt-get install -y \
    build-essential

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ADD samples .
WORKDIR /usr/src/app/1_Utilities/deviceQuery
