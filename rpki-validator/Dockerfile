FROM rpki-base

LABEL maintainer "Sebastian Meiling <s@mlng.net>"

WORKDIR /opt/docker
COPY startup.sh .

RUN chown -R rpki:rpki /opt/docker

USER rpki

ENTRYPOINT ["./startup.sh"]
