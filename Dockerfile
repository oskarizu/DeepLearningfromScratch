FROM tensorflow/tensorflow
MAINTAINER Francesc Danti <fdanti@ub.edu>

#Install packages
RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -qqy install \
	wget \
	libopencv-dev \
	python-pip \
	python-opencv \
	timidity \
	unzip \
	git
RUN DEBIAN_FRONTEND=noninteractive pip install --upgrade pip
RUN DEBIAN_FRONTEND=noninteractive pip install \
	tqdm \
	pandas \
	seaborn \
	bokeh \
	scikit-image \
	sklearn
RUN pip install git+https://github.com/tflearn/tflearn.git
RUN pip install --upgrade numpy
RUN pip install --upgrade scikit-image

#Remove examples
RUN rm -Rf *

#Guillem File
#OLD#RUN wget https://dl.dropboxusercontent.com/u/50333326/vgg16.npy
RUN wget https://www.dropbox.com/s/krru5xkt298jegp/color-model-40000.ckpt

#Axel File
#https://drive.google.com/file/d/0B2Zb1664IYLIS1ZFUmV2RUI0Z2M/view?usp=sharing
COPY imagenet-vgg-verydeep-19.mat .
 
#Notebooks
RUN git clone https://github.com/DataScienceUB/DeepLearningfromScratch
