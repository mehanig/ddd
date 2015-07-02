FROM debian

RUN apt-get clean && apt-get update && apt-get install -y \
	bc \
	ca-certificates \
	curl \
	cython \
	g++ \
	git \
	ipython \
	libatlas-base-dev \
	libatlas-dev \
	libboost-all-dev \
	libgflags-dev \
	libgoogle-glog-dev \
	libhdf5-dev \
	libleveldb-dev \
	liblmdb-dev \
	libopencv-dev \
	libprotobuf-dev \
	libsnappy-dev \
	make \
	protobuf-compiler \
	python-dateutil \
	python-gflags \
	python-h5py \
	python-leveldb \
	python-matplotlib \
	python-networkx \
	python-nose \
	python-numpy \
	python-pandas \
	python-pil \
	python-protobuf \
	python-scipy \
	python-skimage-lib \
	python-yaml \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

RUN curl https://bootstrap.pypa.io/get-pip.py | python

RUN pip install scikit-image

RUN cd root && git clone --depth 1 --single-branch https://github.com/BVLC/caffe.git

RUN curl http://dl.caffe.berkeleyvision.org/bvlc_googlenet.caffemodel > /root/caffe/models/bvlc_googlenet/bvlc_googlenet.caffemodel

RUN cd /root/caffe && \
	cp Makefile.config.example Makefile.config && \
	sed -i 's/# CPU_ONLY/CPU_ONLY/g' Makefile.config && \
	echo 'INCLUDE_DIRS += /usr/include/hdf5/serial' >> Makefile.config && \
	echo 'LIBRARY_DIRS += /usr/lib/x86_64-linux-gnu/hdf5/serial' >> Makefile.config && \
	make -j"$(nproc)" all pycaffe

RUN mkdir /ddd && curl 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Appearance_of_sky_for_weather_forecast%2C_Dhaka%2C_Bangladesh.JPG/1024px-Appearance_of_sky_for_weather_forecast%2C_Dhaka%2C_Bangladesh.JPG' > /ddd/sky1024px.jpg

#RUN curl 'http://sstatic.net/stackexchange/img/logos/so/so-logo.png?v=71aa9dd4a5bb' > /ddd/img.png
COPY img.jpg /ddd/

ENV PYTHONPATH=/root/caffe/python
WORKDIR /ddd

COPY start.sh /ddd/
COPY deepdreams.py /ddd/

CMD ["/bin/bash", "/ddd/start.sh"]
