# protoc-go

[higebu/protoc-go](https://hub.docker.com/r/higebu/protoc-go/)

protoc docker image with some plugins.

- github.com/golang/protobuf/protoc-gen-go
- github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
- github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
- github.com/mwitkow/go-proto-validators/protoc-gen-govalidators

```
docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp higebu/protoc:latest protoc \
  --go_out=. --grpc-gateway_out=:. --swagger_out=:. \
  -I=.:/go/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
  *.proto
```
