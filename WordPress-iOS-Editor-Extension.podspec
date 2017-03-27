#
#  Be sure to run `pod spec lint WordPress-iOS-Editor-Extension.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "WordPress-iOS-Editor-Extension"
  s.version      = "0.1.3"
  s.summary      = "Reusable component rich text editor for WordPress.com in an iOS application."

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description  = "Reusable component rich text editor for WordPress.com in an iOS application.And can allow users to customize the editor toolbar."


  s.homepage         = "https://github.com/Jvaeyhcd/WordPress-iOS-Editor-Extension"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "chedahuang" => "1191591250@qq.com" }
  s.source           = { :git => "https://github.com/Jvaeyhcd/WordPress-iOS-Editor-Extension.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.requires_arc = true

  s.source_files = 'WordPress-iOS-Editor-Extension/Classes/**/*'

  s.resources = 'WordPress-iOS-Editor-Extension/Assets/*'

  s.prefix_header_file = 'WordPress-iOS-Editor-Extension/Classes/WordPress-iOS-Editor-Extension.pch'

  s.resource_bundles = {
    'WordPress-iOS-Editor-Extension' => ['WordPress-iOS-Editor-Extension/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  #  s.frameworks = 'UIKit', 'Foundation'
  s.dependency 'WordPress-iOS-Shared', '~> 0.5.9'
  s.dependency 'WordPressCom-Analytics-iOS', '~> 0.1.13'
  s.dependency 'NSObject-SafeExpectations', '~> 0.0.2'
  s.dependency 'WYPopoverController', '~> 0.3.9'
  s.dependency 'UIAlertView+Blocks', '~> 0.9.0'
  s.dependency 'Qiniu', '~> 7.1.4'

end
