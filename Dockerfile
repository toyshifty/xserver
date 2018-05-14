FROM alpine
WORKDIR /tmp
RUN wget https://github.com/snail007/goproxy/releases/download/v4.7/proxy-linux-amd64.tar.gz
RUN tar zxf proxy-linux-amd64.tar.gz
RUN chmod +x ./proxy
RUN cp ./proxy /usr/bin
COPY ./proxy.crt /tmp/
COPY ./proxy.key /tmp/
EXPOSE 8900/tcp
EXPOSE 8901/udp
EXPOSE 9000/tcp
EXPOSE 9001/udp
RUN chown -R 1001:1001 /tmp
USER 1001
CMD ["/usr/bin/proxy", "http", "-t", "tls", "-p", ":8900", "-C", "/tmp/proxy.crt", "-K", "/tmp/proxy.key"]
