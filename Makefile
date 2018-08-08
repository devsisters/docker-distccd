IMAGES = ubuntu-18.04 ubuntu-18.10 ubuntu-16.04 ubuntu-14.04 debian-9 debian-8 debian-7
BUILD_TARGETS = $(IMAGES:%=build-%)
PUSH_TARGETS = $(IMAGES:%=push-%)

define parse-args
	$(eval ARGS := $(subst -, ,$@))
	$(eval DISTRO := $(word 2, $(ARGS)))
	$(eval VERSION := $(word 3, $(ARGS)))
endef

#
# Build images
#
.PHONY: all
all: $(BUILD_TARGETS)

.PHONY: $(BUILD_TARGETS)
$(BUILD_TARGETS): Dockerfile
	$(call parse-args)
	docker build --quiet --tag devsisters/distccd:$(DISTRO)-$(VERSION) --build-arg distro=$(DISTRO) --build-arg version=$(VERSION) .

#
# Push to repository
#
.PHONY: push
push: $(PUSH_TARGETS)

.PHONY: $(PUSH_TARGETS)
$(PUSH_TARGETS):
	$(call parse-args)
	docker push devsisters/distccd:$(DISTRO)-$(VERSION) | cat
	# Note: We don't have https://github.com/docker/cli/pull/882 yet, so
	# we're using `docker push ... | cat` instead.
