#! /bin/bash

mkdir data
cd data
python wget http://www.vlfeat.org/matconvnet/models/beta16/imagenet-vgg-verydeep-19.mat
mkdir bin
python wget http://msvocds.blob.core.windows.net/coco2014/train2014.zip
tar train2014.zip

