#
# Be sure to run `pod lib lint PodChat.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PodChat'
  s.version          = '0.4.8'
  s.summary          = 'Fanap Pod Chat SDK'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = 'Fanap\'s POD Chat SDK, that implements all the necessary thing for bussiness who wants to have chat'

  s.homepage         = 'https://github.com/Mahyar1990/PodChat'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mahyar1990' => 'mahyarjananeh289@gmail.com' }
  s.source           = { :git => 'https://github.com/Mahyar1990/PodChat.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'
  s.swift_version = '4.2'
  
  s.source_files = 'PodChat/Classes/**/*'
  
  # s.resource_bundles = {
  #   'PodChat' => ['PodChat/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'Foundation', 'UIKit', 'Contacts', 'CoreData'
  s.dependency 'PodAsync'
  s.dependency 'Alamofire'
  
end
