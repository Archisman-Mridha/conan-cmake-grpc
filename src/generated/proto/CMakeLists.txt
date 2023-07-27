add_library("protoc_generated" STATIC
  hello.grpc.pb.cc hello.pb.cc)

target_include_directories("protoc_generated" PUBLIC "./")

target_link_libraries("protoc_generated" PRIVATE gRPC::grpc++)