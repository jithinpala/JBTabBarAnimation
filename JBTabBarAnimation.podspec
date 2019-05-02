#
# Be sure to run `pod lib lint JBTabBarAnimation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JBTabBarAnimation'
  s.version          = '0.1.0'
  s.summary          = 'A custom animation for TabBarController'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
JBTabBarAnimation is a custom animation library for TabBarController developed in Swift
                       DESC

  s.homepage         = 'https://github.com/jithinpala/JBTabBarAnimation'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jithin Balan' => 'jithinpala@gmail.com' }
  s.source           = { :git => 'https://github.com/jithinpala/JBTabBarAnimation.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'
  s.swift_version   = '4.2'

  s.source_files = 'JBTabBarAnimation/Classes/*.swift'
  
  # s.resource_bundles = {
  #   'JBTabBarAnimation' => ['JBTabBarAnimation/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
