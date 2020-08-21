FROM ubuntu:latest
RUN apt-get update && \
      apt-get -y install sudo
RUN sudo apt --assume-yes install python3
RUN sudo apt install python3-pip
RUN pip3 install pymsteams
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
