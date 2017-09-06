FROM arm32v7/redis:latest

ENV TERM=XTERM

RUN apt-get -y update  
RUN apt-get install -y ca-certificates wget unzip gcc libc6-dev make

RUN cd /tmp \  
    && wget https://github.com/RedisLabsModules/redex/archive/master.zip \
    && unzip master.zip -d /redis-redex \  
    && cd /redis-redex/redex-master \ 
    && make

RUN apt-get purge -y ca-certificates wget unzip gcc libc6-dev make \  
    && apt-get autoremove -y \
    && apt-get autoclean -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

CMD ["redis-server"]  
