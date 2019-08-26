FROM golang:alpine

COPY . /go/src/privy_exam

WORKDIR /go/src/privy_exam
RUN apk apt-get update
RUN apk update && \
    apk upgrade && \
    apk add git
ENV GO111MODULE=on
RUN go mod tidy
RUN go mod vendor
RUN  CGO_ENABLED=0 GOOS=linux go build
ENTRYPOINT [ "/go/src/privy_exam/privy" ]
