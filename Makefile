ifeq ($(OS),Windows_NT)
  PLATFORM="Windows"
else
  ifeq ($(shell uname),Darwin)
    PLATFORM="MacOS"
  else
    PLATFORM="Linux"
  endif
endif

all: build 
export GO111MODULE=on
export GOFLAGS=-mod=vendor
XCHAIN_ROOT := ${PWD}/core
export XCHAIN_ROOT
PATH := ${PWD}/core/xvm/compile/wabt/build:$(PATH)

build:
	PLATFORM=$(PLATFORM) ./build.sh

test:
	go test -coverprofile=coverage.txt -covermode=atomic ./...
	# test wasm sdk
	GOOS=js GOARCH=wasm go build github.com/xuperchain/xuperchain/core/contractsdk/go/driver
	cd core/xvm/spectest && go run main.go core

contractsdk:
	make -C core/contractsdk/cpp build
	make -C core/contractsdk/cpp test

clean:
	rm -rf output
	rm -f xchain-cli
	rm -f xchain
	rm -f dump_chain
	rm -f event_client
	rm -rf core/xvm/compile/wabt/build
	rm -rf core/contractsdk/cpp/build
	rm -f core/crypto/client/gm/gmsm/sm2/cert.pem
	rm -f core/crypto/client/gm/gmsm/sm2/ifile
	rm -f core/crypto/client/gm/gmsm/sm2/ofile
	rm -f core/crypto/client/gm/gmsm/sm2/priv.pem
	rm -f core/crypto/client/gm/gmsm/sm2/pub.pem
	rm -f core/crypto/client/gm/gmsm/sm2/req.pem
	rm -f core/crypto/client/gm/gmsm/sm3/ifile
	rm -f core/crypto/client/gm/gmsm/sm4/key.pem
	rm -f coverage.txt
	rm -rf core/core/logs
	rm -rf core/logs
	rm -rf core/plugins

.PHONY: all test clean

cli:
	PLATFORM=$(PLATFORM) ./build-cli.sh
export GO111MODULE=on
export GOFLAGS=-mod=vendor
XCHAIN_ROOT := ${PWD}/core
export XCHAIN_ROOT
PATH := ${PWD}/core/xvm/compile/wabt/build:$(PATH)

http:
	PLATFORM=$(PLATFORM) ./build-gateway.sh
export GO111MODULE=on
export GOFLAGS=-mod=vendor
XCHAIN_ROOT := ${PWD}/core
export XCHAIN_ROOT
PATH := ${PWD}/core/xvm/compile/wabt/build:$(PATH)

plugin:
	PLATFORM=$(PLATFORM) ./build-plugin.sh
export GO111MODULE=on
export GOFLAGS=-mod=vendor
XCHAIN_ROOT := ${PWD}/core
export XCHAIN_ROOT
PATH := ${PWD}/core/xvm/compile/wabt/build:$(PATH)
