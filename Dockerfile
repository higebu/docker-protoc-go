FROM golang:1.11.2-stretch
LABEL maintainer="yuya.kusakabe@gmail.com"

ENV PROTOC_VERSION 3.6.1
ENV PROTOC_GEN_GO_VERSION 1.2.0
ENV PROTOC_GEN_GRPC_GATEWAY_VERSION 1.5.1
ENV PROTOC_GEN_SWAGGER_VERSION 1.5.1
ENV GO111MODULE on

COPY . /usr/src/protoc-go
WORKDIR /usr/src/protoc-go

RUN go get -u github.com/golang/protobuf/protoc-gen-go@v$PROTOC_GEN_GO_VERSION
RUN go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway@v$PROTOC_GEN_GRPC_GATEWAY_VERSION
RUN go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger@v$PROTOC_GEN_SWAGGER_VERSION
RUN go get -u github.com/mwitkow/go-proto-validators/protoc-gen-govalidators@master
RUN apt-get update && apt-get install -y unzip && apt-get clean
RUN wget https://github.com/protocolbuffers/protobuf/releases/download/v$PROTOC_VERSION/protoc-$PROTOC_VERSION-linux-x86_64.zip && \
  unzip protoc-$PROTOC_VERSION-linux-x86_64.zip && \
  rm protoc-$PROTOC_VERSION-linux-x86_64.zip && \
  rm readme.txt
CMD ["protoc"]
