FROM ubuntu:latest
RUN apt-get update && \
      apt-get -y install sudo
RUN sudo apt install python3.8
RUN python --version
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
