IMAGE = privatelo/cross-multi

all: Dockerfile
	docker build -t $(IMAGE) .

shell:
	docker run -it --rm $(IMAGE)

clean:
	docker rmi $(IMAGE)

.PHONY: all clean shell
