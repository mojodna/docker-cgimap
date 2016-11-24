IMAGE_NAME ?= mojodna/cgimap
DEV_IMAGE_NAME ?= mojodna/cgimap-dev

default: cgimap.tar.gz build
	docker build --build-arg http_proxy=$(http_proxy) -t $(IMAGE_NAME) .

.PHONY: build

build:
	make -C $@

cgimap.tar.gz: build
	docker run --rm $(DEV_IMAGE_NAME) tar zcf - /usr/local > $@

clean:
	rm -f cgimap.tar.gz
	docker rmi $(IMAGE_NAME) || true
	make -C build clean
