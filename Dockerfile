FROM docker:dind

COPY dind-isolated-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["dind-isolated-entrypoint.sh"]
CMD []
