FROM jasongwq/gitbook_builder:v0.4

MAINTAINER jasongwq <jasongwq@126.com>

WORKDIR /gitbook

RUN wget https://gitee.com/jasongwq/sdn-handbook/repository/archive/master.zip &&\
    unzip master.zip
WORKDIR /gitbook/sdn-handbook
RUN gitbook install 
RUN gitbook mobi . kubernetes-handbook.mobi

CMD /usr/local/bin/gitbook serve
