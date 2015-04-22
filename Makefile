help:
	@echo "make build       -- build the binary[x86_64,armhf]"
	@echo "make get         -- get the source"
	@echo "make build-amd64 -- build the x86_64 binary"
	@echo "make build-armhf -- build the armhf binary"
	@echo "make package     -- snappy package"
	@echo "make clean       -- clean"
	@echo "make help        -- print help"

build: get build-amd64 build-armhf

get:
	go get -v github.com/Lupino/periodic/cmd/periodic

build-amd64:
	cd magic-bin/x86_64-linux-gnu; GOOS=linux GOARCH=amd64 go build github.com/Lupino/periodic/cmd/periodic

build-armhf:
	cd magic-bin/arm-linux-gnueabihf; GOOS=linux GOARCH=arm go build github.com/Lupino/periodic/cmd/periodic

package:
	snappy build .

clean:
	rm -f magic-bin/arm-linux-gnueabihf/periodic
	rm -f magic-bin/x86_64-linux-gnu/periodic
