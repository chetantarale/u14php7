FROM drydock/u14pls:prod

ADD . /u14php7

RUN /u14php7/install.sh
