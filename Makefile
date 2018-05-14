all:
	docker build -t xserver .
	docker run --rm -it -p 8900:8900 xserver
