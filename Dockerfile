FROM jasongwq/gitbook_builder:v0.4

MAINTAINER jasongwq <jasongwq@126.com>

WORKDIR /srv/gitbook

RUN git clone https://github.com/feiskyer/kubernetes-handbook.git
WORKDIR /srv/gitbook/kubernetes-handbook
RUN gitbook install
RUN gitbook mobi . kubernetes-handbook.mobi

CMD /usr/local/bin/gitbook serve
