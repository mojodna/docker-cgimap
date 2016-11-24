IMAGE_NAME ?= mojodna/cgimap-dev
SOURCE_URL ?= https://github.com/zerebubuth/openstreetmap-cgimap/archive/v0.5.8.tar.gz

default: cgimap.tar.gz
	docker build --build-arg http_proxy=$(http_proxy) -t $(IMAGE_NAME) .

cgimap.tar.gz:
	curl -sfL $(SOURCE_URL) -o $@

clean:
	rm -f cgimap.tar.gz
	docker rmi $(IMAGE_NAME) || true
