#
# Be sure to run `pod lib lint mbtile-ios-reader.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'mbtile-ios-reader'
  s.version          = '1.0.4'
  s.summary          = 'mbtile-ios-reader is a framework for integrating mbtile map-files for offline mapping'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'mbtile-ios-reader is a framework that helps to easily integrate mbtile map data into MapKit for offline usage.'

  s.homepage         = 'https://github.com/s1m-0n/mbtile-ios-reader'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 's1m-0n' => 'simon.wicha@nomis-development.net' }
  s.source           = { :git => 'https://github.com/s1m-0n/mbtile-ios-reader.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.swift_version = '5.0'

  s.source_files = 'mbtile-ios-reader/Classes/**/*.{swift,h,m}'
  
  # s.resource_bundles = {
  #   'mbtile-ios-reader' => ['mbtile-ios-reader/Assets/*.png']
  # }
  s.static_framework = true
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.library = 'sqlite3'
  s.dependency 'GCDWebServer', '~> 3.0'
  s.dependency 'SQLite.swift', '~> 0.12.0'
  s.dependency 'GoogleMaps', '~> 4.0.0'
  s.dependency 'Google-Maps-iOS-Utils', '~> 3.4.1'
end
