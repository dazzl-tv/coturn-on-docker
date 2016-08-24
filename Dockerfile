FROM ubuntu:16.04
MAINTAINER Laurent COGNE <laurent@dazzl.tv>

WORKDIR /root

RUN apt-get update && apt-get upgrade -y

RUN apt-get install --no-install-recommends --no-install-suggests -y libssl-dev sqlite3 libsqlite3-dev libevent-dev libpq-dev mysql-client libmysqlclient-dev libhiredis-dev libmongoc-dev libbson-dev

RUN apt-get install --no-install-recommends --no-install-suggests -y wget

RUN apt-get install --no-install-recommends --no-install-suggests -y libtool build-essential

RUN wget --no-check-certificate https://github.com/coturn/coturn/archive/4.5.0.3.tar.gz && tar xzf 4.5.0.3.tar.gz && rm 4.5.0.3.tar.gz

RUN cd coturn-4.5.0.3 && ./configure && make install && cd ..

RUN rm -rf coturn-4.5.0.3

ENTRYPOINT ["/usr/local/bin/turnserver"]
