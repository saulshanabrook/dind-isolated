FROM docker:1.9-dind
RUN apk add --update bash py-pip git perl && rm -rf /var/cache/apk/*
RUN pip install docker-compose

# RUN apk add --update xfsprogs e2fsprogs iptables ca-certificates lxc
COPY dind-isolated-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["dind-isolated-entrypoint.sh"]
CMD []
