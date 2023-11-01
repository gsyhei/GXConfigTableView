#
#  Be sure to run `pod spec lint GXConfigTableViewVC.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name          = "GXConfigTableViewVC"
  s.version       = "1.0.0"
  s.swift_version = "5"
  s.summary       = "tableView配置model实现轻量化vc，常用于设置/个人中心等场景。"
  s.homepage      = "https://github.com/gsyhei/GXConfigTableViewVC"
  s.license       = { :type => "MIT", :file => "LICENSE" }
  s.author        = { "Gin" => "279694479@qq.com" }
  s.platform      = :ios, "13.0"
  s.source        = { :git => "https://github.com/gsyhei/GXConfigTableViewVC.git", :tag => "1.0.0" }
  s.requires_arc  = true
  s.source_files  = "GXConfigTableViewVC"
  s.frameworks    = "UIKit"
  s.dependency  'RxCocoaPlus'

end
