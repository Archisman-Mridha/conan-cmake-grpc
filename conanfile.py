from conan import ConanFile
from conan.tools.files import copy

class GrpcConanRecipe(ConanFile):
  settings = "os", "arch", "compiler", "build_type"
  generators = "CMakeDeps", "CMakeToolchain"

  @property
  def _source_dir(self):
    return "./src"

  @property
  def _build_dir(self):
    return "./build"
  
  def requirements(self):
    self.requires("catch2/3.3.2")
    self.requires("grpc/1.50.1")

  def generate(self):
    for dep in self.dependencies.values( ):
      copy(self, "protoc*", dep.cpp_info.bindirs[0], "../bin")
      copy(self, "grpc_cpp_plugin*", dep.cpp_info.bindirs[0], "../bin")