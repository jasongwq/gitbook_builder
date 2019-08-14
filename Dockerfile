FROM jimmysong/gitbook-builder:2019-07-31

MAINTAINER jasongwq <jasongwq@126.com>

RUN npm config set registry http://registry.npm.taobao.org
ADD phantomjs-2.1.1-linux-x86_64.tar.bz2 /usr/local/        
ENV PATH $PATH:/usr/local/phantomjs-2.1.1-linux-x86_64/bin

RUN apt-get update -y &&\
       apt-get install fontconfig -y &&\
       apt-get clean && \
       rm -rf /tmp/* /var/lib/{apt,dpkg,cache,log}/*
RUN npm install svgexport -g --unsafe-perm=true --allow-root &&\
	npm cache verify &&\
	npm cache clear -force &&\
	rm -rf /tmp/*

WORKDIR /srv/gitbook

RUN git clone https://github.com/feiskyer/kubernetes-handbook.git
WORKDIR /src/gitbook/kubernetes-handbook
RUN gitbook install
RUN gitbook mobi . kubernetes-handbook.mobi

CMD /usr/local/bin/gitbook serve
