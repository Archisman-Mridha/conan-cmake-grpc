conan-install:
	conan install . --output-folder=build --build=missing

run:
	cd ./build && \
		cmake .. -D CMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_EXPORT_COMPILE_COMMANDS=ON && \
		cmake --build . && \
	cd ../
	./build/main

protoc-gen:
	./bin/protoc -I ./protos \
		--plugin=protoc-gen-grpc=./bin/grpc_cpp_plugin --grpc_out=./src/generated/proto \
		--cpp_out=./src/generated/proto \
		./protos/hello.proto
