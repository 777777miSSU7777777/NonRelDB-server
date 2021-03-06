FROM golang:1.11-alpine3.8

EXPOSE 9090

# Preparation stage.
RUN apk add build-base

RUN apk update && apk upgrade && apk add git

RUN go get golang.org/x/tools/cmd/goimports

RUN go get -u golang.org/x/lint/golint

RUN go get github.com/stretchr/testify

ADD . /go/src/NonRelDB/

# Check stage.
WORKDIR /go/src/NonRelDB

RUN go vet ./...

RUN goimports ./

RUN golint ./...

# Build stage.
WORKDIR /go/src/NonRelDB/server

RUN go build server.go 

# Entrypoint bind.
ENTRYPOINT [ "/go/src/NonRelDB/server/server" ]
