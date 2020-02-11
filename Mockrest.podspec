#
# Be sure to run `pod lib lint Mockrest.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Mockrest'
  s.version          = '0.1.0'
  s.summary          = 'This library makes mock REST responses'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This library makes mocks from structs previously made, and return as JSON data. Combined with Mockingjay makes application tests easy. It has functions to generate data to fill these structures. Doing that, the test suites are more randomly, like real life.
                       DESC

  s.homepage         = 'https://github.com/digoot/Mockrest'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'digoot' => 'digoot@gmail.com' }
  s.source           = { :git => 'https://github.com/digoot/Mockrest.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.swift_version = '5'

  s.source_files = 'Mockrest/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Mockrest' => ['Mockrest/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'Fakery'
end
