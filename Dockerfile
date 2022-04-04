FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install vim -y
WORKDIR /net
COPY bash.sh /net
CMD ["sudo", "./bash.sh"]