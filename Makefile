build: get amd64 armhf

get:
	go get -v github.com/Lupino/periodic/cmd/periodic

amd64:
	cd magic-bin/x86_64-linux-gnu
	GOOS=linux GOARCH=amd64 go build github.com/Lupino/periodic/cmd/periodic

armhf:
	cd magic-bin/arm-linux-gnueabihf
	GOOS=linux GOARCH=arm go build github.com/Lupino/periodic/cmd/periodic

package:
	snappy build .

clean:
	rm -f magic-bin/arm-linux-gnueabihf/periodic
	rm -f magic-bin/x86_64-linux-gnu/periodic
