require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name            = "rtn-aarand"
  s.version         = package["version"]
  s.summary         = package["description"]
  s.description     = package["description"]
  s.homepage        = package["homepage"]
  s.license         = package["license"]
  s.platforms       = { :ios => "11.0" }
  s.author          = package["author"]
  s.source          = { :git => package["repository"], :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,m,mm,cpp,hpp, swift}"

  # Specify header search paths for all dependencies
  s.pod_target_xcconfig = {
    "CLANG_CXX_LANGUAGE_STANDARD" => "c++17",  # Specify C++ version
    "HEADER_SEARCH_PATHS" => [
      "$(PODS_TARGET_SRCROOT)/ios/deps/aarand/include",
    ].join(' '),
  }
  
  install_modules_dependencies(s)
end