FROM ubuntu:xenial
MAINTAINER Nutthaphon Suwanwong

RUN (mv /etc/localtime /etc/localtime.old; ln -s /usr/share/zoneinfo/Asia/Bangkok /etc/localtime)

RUN echo deb http://archive.scrapy.org/ubuntu scrapy main >> /etc/apt/sources.list.d/scrapy.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 627220E7

RUN apt-get update

RUN apt-get install -y scrapyd
RUN apt-get install -y python-pip python-dev build-essential libssl-dev

RUN pip install --upgrade pip 
RUN pip install scrapyd

COPY startup.sh .
RUN chmod +x startup.sh

EXPOSE 6800

CMD "./startup.sh"