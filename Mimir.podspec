Pod::Spec.new do |s|
  s.name         = "Mimir"
  s.version      = "1.0.3"
  s.summary      = "Decision making helper in swift"
  s.description  = <<-DESC
    Mimir is designed to help you make decisions. Useful for those of us that are indecisive.
  DESC
  s.homepage     = "https://github.com/dtaylor1701/mimir"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "David Taylor" => "dktaylor1701@gmail.com" }
  s.social_media_url   = ""
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/dtaylor1701/mimir.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
  s.swift_version = '4.0'
end
