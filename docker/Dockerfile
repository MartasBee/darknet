#FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04
FROM nvidia/cuda:11.2.2-cudnn8-devel-ubuntu20.04
MAINTAINER MartasBee <draconis.sigma@gmail.com>

ARG GPU=1
ARG CUDNN=1
ARG OPENCV=1
ARG LIBSO=1

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y install git cmake pkg-config libopencv-dev python3-pip

WORKDIR /yolo
RUN git clone https://github.com/AlexeyAB/darknet.git
WORKDIR /yolo/darknet

RUN python3 -m pip install -r docker/requirements.txt

RUN sed -i "s/GPU=.*/GPU=${GPU}/" Makefile && \
	sed -i "s/CUDNN=0/CUDNN=${CUDNN}/" Makefile && \
	sed -i "s/OPENCV=0/OPENCV=${OPENCV}/" Makefile && \
	sed -i "s/LIBSO=0/LIBSO=${LIBSO}/" Makefile && \
    make -j8

COPY yolov4.weights /yolo/darknet/
WORKDIR /yolo/darknet

