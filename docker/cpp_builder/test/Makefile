.PHONY: all release debug clean

BUILD_LIBS_IMAGE ?= build-libs:master

all: release

release:
	docker run --rm --network=host --privileged=true\
		-e CMAKE_BUILD_TYPE=Release\
		-v $(CURDIR):/build\
		${BUILD_LIBS_IMAGE}

debug:
	docker run --rm --network=host --privileged=true\
		-e CMAKE_BUILD_TYPE=Debug\
		-v $(CURDIR):/build\

clean:
	-rm -rf build output

test:
	docker run --entrypoint "" --rm -it --network=host --privileged=true \
		-e CMAKE_BUILD_TYPE=Release \
		-v $(CURDIR):/build \
		${BUILD_LIBS_IMAGE} /bin/bash
