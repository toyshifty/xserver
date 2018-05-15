all:
	docker build -t xserver .
	docker run --rm -it -p 9000:9000 -p 8900:8900 xserver
