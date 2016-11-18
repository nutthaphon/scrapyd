FROM ubuntu:xenial
MAINTAINER Nutthaphon Suwanwong

RUN (mv /etc/localtime /etc/localtime.old; ln -s /usr/share/zoneinfo/Asia/Bangkok /etc/localtime)

RUN apt-get update
RUN apt-get install -y python-pip python-dev build-essential libssl-dev scrapyd
RUN pip install --upgrade pip 
RUN pip install scrapy

COPY startup.sh .
RUN chmod +x startup.sh

EXPOSE 6800

CMD "./startup.sh"