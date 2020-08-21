FROM ubuntu:latest
RUN apt-get update && \
      apt-get -y install sudo
RUN sudo apt --assume-yes install python3
RUN python -m pip install --upgrade pip setuptools wheel
RUN pip install pymsteams
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
