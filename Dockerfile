FROM arm32v7/redis:latest

ENV TERM=XTERM

RUN apt-get -y update \
    && apt-get -y install ca-certificates wget unzip gcc libc6-dev make

RUN cd /tmp \
    && wget https://github.com/RedisLabsModules/redex/archive/master.zip \
    && unzip master.zip -d /redis-redex \
    && rm master.zip \
    && cd /redis-redex/redex-master \
    && make

RUN cd /tmp \
    && wget https://github.com/RedisLabsModules/rejson/archive/master.zip \
    && unzip master.zip -d /rejson \
    && rm master.zip \
    && cd /rejson/rejson-master \
    && make

CMD ["redis-server"]  
