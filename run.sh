#!/bin/bash

APT_PACKAGES="apt-utils ffmpeg libav-tools x264 x265"
apt-install() {
	export DEBIAN_FRONTEND=noninteractive
	apt-get update -q
	apt-get install -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" $APT_PACKAGES
	return $?
}

mkdir data
cd data
python urlmat = 'http://www.vlfeat.org/matconvnet/models/beta16/imagenet-vgg-verydeep-19.mat'  
python urlzip = 'http://msvocds.blob.core.windows.net/coco2014/train2014.zip'  
python wget.download(urlmat)  
mkdir bin
cd bin
python wget.download(urlzip)
tar -xzvf train2014.zip


# #install ffmpeg to container
# add-apt-repository -y ppa:jonathonf/ffmpeg-3 2>&1
# apt-install || exit 1

#create folders
# mkdir data
# mkdir data/bin

#run style transfer on video
# python transform_video.py --in-path examples/content/fox.mp4 \
#   --checkpoint ./scream.ckpt \
#   --out-path /artifacts/out.mp4 \
#   --device /gpu:0 \
#   --batch-size 4 2>&1
cd 
python style.py --style examples/style/renoirP.jpg \
  --checkpoint-dir examples/style \
  --test ./examples/content/ry2.jpg \
  --test-dir  /artifacts/  \
  --content-weight 1.5e1 \
  --checkpoint-iterations 1000 \
  --batch-size 20