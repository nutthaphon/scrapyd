FROM ubuntu:xenial
MAINTAINER Nutthaphon Suwanwong

RUN (mv /etc/localtime /etc/localtime.old; ln -s /usr/share/zoneinfo/Asia/Bangkok /etc/localtime)

RUN apt-get update && apt-get install -y \
	python-dev \
	python-pip \
	libxml2-dev \
	libxslt1-dev \
	zlib1g-dev \
	libffi-dev \
	libssl-dev

RUN pip install scrapyd

COPY /startup.sh .
RUN chmod +x startup.sh

EXPOSE 6800

CMD "./startup.sh"