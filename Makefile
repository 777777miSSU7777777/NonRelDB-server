CURRENT_DIR = $(shell pwd)

check:
	go vet ./...

	goimports ./

	golint ./...

clean:
	sudo docker system prune

build: clean
	sudo docker build -t "nonreldb" .

run: clean
	sudo docker run -d --net=host nonreldb

test: 
	echo "Running unit & integration tests"

	go test ./... -coverprofile coverage.out

	go tool cover -html=coverage.out
