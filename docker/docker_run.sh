#!/bin/bash

xhost +si:localuser:$USER

docker run --gpus '"device=1","capabilities=compute,graphics,display,utility"' -it --rm \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /home/martin/development/github/martasbee/darknet:/tmp/repo \
  -v /media/nvme0/__data__:/tmp/data \
  yolov4:0.2 bash
