conan-install:
	conan install . --output-folder=build --build=missing

run:
	cd ./build && \
		cmake .. -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Release cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON && \
		cmake --build . && \
	cd ../
	./build/main

protoc-gen:
	./bin/protoc -I ./protos \
		--plugin=protoc-gen-grpc=./bin/grpc_cpp_plugin --grpc_out=./src/generated/proto \
		--cpp_out=./src/generated/proto \
		./protos/hello.proto