ARG L4TBASE_VERSION=""
FROM nvcr.io/nvidia/l4t-base:${L4TBASE_VERSION}

RUN apt-get update && \
    apt-get install -y \
    build-essential

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ADD samples .
WORKDIR /usr/src/app/1_Utilities/deviceQuery
