NAME = lemonemail/dovecot
VERSION = 0.1.1
REGISTRY = registry.limun.email:5000

.PHONY: all build tag_latest release

all: build

build:
	docker build --no-cache -t $(NAME):$(VERSION) --rm .

tag_latest:
	docker tag $(NAME):$(VERSION) $(REGISTRY)/$(NAME):latest

release: tag_latest
	@if ! docker images $(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME) version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	docker push $(REGISTRY)/$(NAME)
