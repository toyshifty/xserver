FROM alpine
WORKDIR /tmp
RUN wget https://github.com/snail007/goproxy/releases/download/v4.7/proxy-linux-amd64.tar.gz
RUN tar zxf proxy-linux-amd64.tar.gz
RUN chmod +x ./proxy
RUN cp ./proxy /usr/bin
EXPOSE 8900/tcp
EXPOSE 8901/udp
EXPOSE 9000/tcp
EXPOSE 9001/udp
USER 1001
CMD ["/usr/bin/proxy", "http", "-t", "tcp", "-p", "0.0.0.0:8900"]
