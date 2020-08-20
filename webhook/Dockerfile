FROM ubuntu:latest
RUN sudo apt-get install python3-pip
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
