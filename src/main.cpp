#include <grpcpp/grpcpp.h>
#include <grpcpp/ext/proto_server_reflection_plugin.h>
#include "hello.grpc.pb.h"
#include "hello.pb.h"
#include "iostream"

using namespace std;
using namespace grpc;

class HelloServiceImpl final: public hello::HelloService::Service {

  Status SayHello(ServerContext* context, const hello::SayHelloRequest* request, hello::SayHelloResponse* response) {
    response->set_message("hello");

    return Status::OK;
  }
};

int main(void) {
  HelloServiceImpl helloService;

  reflection::InitProtoReflectionServerBuilderPlugin( );

  ServerBuilder serverBuilder;
  serverBuilder.AddListeningPort("0.0.0.0:4000", InsecureServerCredentials( ));

  serverBuilder.RegisterService(&helloService);

  auto server= serverBuilder.BuildAndStart( );
  cout<<"Starting gRPC server at port 4000"<<endl;
  server->Wait( );

  return 0;
}
