Pod::Spec.new do |s|
  s.name             = 'VMGSDK'
  s.version          = '1.0.2'
  s.summary          = 'VMG iOS SDK'

  s.description      = <<-DESC
					The VMG iOS SDK lets you to integrate our SDK in your app.
                       DESC

  s.homepage         = 'https://github.com/videomediagroup/iOS-SDK'
  s.license          = { :type => 'UNLICENSED' }
  s.author           = { 'Tim' => 'tim.wachter@videomediagroup.com' }
  s.source           = { :git => 'https://github.com/videomediagroup/iOS-SDK.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.ios.vendored_frameworks = 'VMGSDK.framework'
  
  s.dependency 'Alamofire', '~> 4.6.0'
  s.dependency 'Observable', '~> 1.3.2'
  s.dependency 'JSQWebViewController', '~> 6.0.0'
end
