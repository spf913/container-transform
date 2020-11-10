FROM phusion/baseimage:master
MAINTAINER Me Myself "myself@example.com"
RUN apt-get update -y
RUN apt-get install -y python3-pip git
RUN pip3 install git+git://github.com/spf913/container-transform.git

WORKDIR /data
ENTRYPOINT ["/usr/local/bin/container-transform"]
