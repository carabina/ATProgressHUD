Pod::Spec.new do |s|

  s.name         = "ATProgressHUD"
  s.version      = "0.0.1"
  s.summary      = "a ATProgressHUD view"

  s.description  = <<-DESC
                   a ATProgressHUD view
                   balabala
                   DESC

  s.homepage     = "https://github.com/AesirTitan/ATProgressHUD"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = "MIT"

  s.author             = { "Aesir" => "ayan.bifrost@gmail.com" }
  # Or just: s.author    = "Aesir"
  # s.authors            = { "Aesir" => "" }
  # s.social_media_url   = "http://twitter.com/Aesir"

  s.platform     = :ios
  s.platform     = :ios, "7.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/AesirTitan/ATProgressHUD.git", :tag => "#{s.version}" }

  s.source_files  = "ATProgressHUD/**/*.{h,m}"
  # s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

  # s.framework  = "SomeFramework"
  s.frameworks = "Foundation", "UIKit"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
