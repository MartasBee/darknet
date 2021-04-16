#!/bin/bash

if [ ! -f yolov4.weights ]; then
    echo "YOLOv4.weights NOT FOUND! Downloading..."
    wget https://github.com/AlexeyAB/darknet/releases/download/darknet_yolo_v3_optimal/yolov4.weights
fi

docker build . -t yolov4:0.3
