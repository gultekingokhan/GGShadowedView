#
# Be sure to run `pod lib lint GGShadowedView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GGShadowedView'
  s.version          = '0.1.1'
  s.summary          = 'Lightweight pretty shadow library.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/gultekingokhan/GGShadowedView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gultekingokhan' => 'ismailgokhangultekin@gmail.com' }
  s.source           = { :git => 'https://github.com/gultekingokhan/GGShadowedView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/gultekingokhan'
  
  s.ios.deployment_target = '10.0'
  s.swift_version = '4.2'
  s.source_files = 'GGShadowedView/Classes/**/*'
  
  s.resource_bundles = {
      'GGShadowedView' => ['GGShadowedView/**/*']
  }
  
  # s.resource_bundles = {
  #   'GGShadowedView' => ['GGShadowedView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
