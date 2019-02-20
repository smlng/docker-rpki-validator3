FROM centos:7

LABEL maintainer "Sebastian Meiling <s@mlng.net>"

# create group and user with ID 323 first
RUN groupadd -r -g 323 rpki && useradd -r -u 323 -g rpki rpki
# install RIPE RPKI RTR server (v3)
RUN yum-config-manager --add-repo https://ftp.ripe.net/tools/rpki/validator3/prod/centos7/ripencc-rpki-prod.repo
RUN yum install -y rpki-validator rpki-rtr-server

RUN mkdir -p /opt/docker/conf

