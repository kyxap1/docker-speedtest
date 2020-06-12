FROM alpine:3.11

RUN apk add --no-cache bash jq py-pip git && \
    pip install git+https://github.com/du5/speedtest-cli.git && \
    apk del git && \
    echo "*/10 * * * * /data/speedtest.sh -a" | crontab - && \
    mkdir /data /conf

ADD speedtest/servers.txt speedtest/speedtest.sh /data/
ADD speedtest/speedtest.conf /conf/
VOLUME ["/data", "/conf"]
ENTRYPOINT ["crond", "-f", "-l", "8"]
