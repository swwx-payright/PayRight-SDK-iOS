Pod::Spec.new do |s|  
  s.name             = “PayRight”  
  s.version          = "1.0.0"  
  s.summary          = "PayRightSDK iOS”  
  s.description      = <<-DESC
                       Payright为您提供一站式集成化支付接入解决方案，
			通过Payright的SDK，您可轻松连接任意Payright支持的支付渠道，
			并通过交易管理平台监控、管理已开通渠道的所有交易。
                       DESC
  s.homepage         = "http://www.payright.cn/"    
  s.license          = 'MIT'  
  s.author           = { “Xiaoqiang Wang" => "codeingwang@163.com" }  
  s.source           = { :git => "https://github.com/swwx-payright/PayRight-SDK-iOS.git", :tag => s.version}  
  # s.social_media_url = 'https://twitter.com/NAME'  
  
  s.platform     = :ios, ‘8.1’  
  s.requires_arc = true  
  # s.resources = 'Assets'  
  
  # s.ios.exclude_files = 'Classes/osx'  
  # s.osx.exclude_files = 'Classes/ios'  
  # s.public_header_files = 'Classes/**/*.h'  
  s.frameworks = 'Foundation', 'UIKit', 'Security', 'CoreTelephony', 'SystemConfiguration' 

  s.default_subspec = 'Base', 'Alipay', 'WX'

  s.subspec ‘Base’ do |base|
    core.source_files = 'PayRight/*.h'
    core.public_header_files = 'PayRight/*.h'
    core.vendored_libraries = 'PayRight/*.a'
    core.frameworks = 'CFNetwork', 'SystemConfiguration', 'Security','CoreTelephony'
    core.ios.library = 'libc++', 'libz', 'libsqlite3.0'
    core.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end

  s.subspec 'Alipay' do |alipay|
    alipay.vendored_libraries = 'PayRight/alipay/*.a'
    alipay.ios.vendored_frameworks = 'PayRight/alipay/AlipaySDK.framework'
    alipay.resource = 'PayRight/alipay/AlipaySDK.bundle'
    alipay.dependency 'PayRight/Base’
  end
  s.subspec ‘Wx’ do |wx|
    alipay.vendored_libraries = 'PayRight/wx/*.a'
    wx.public_header_files = 'PayRight/wx/*.h'
    alipay.dependency 'PayRight/Base'
  end
end
