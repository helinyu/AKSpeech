Pod::Spec.new do |s|
  s.name         = 'AKSpeech'
  s.version      = '0.0.2'
  s.summary      = '语音播放封装'
  s.ios.deployment_target = '7.0'
  s.homepage     = 'https://github.com/helinyu/YDOpenHardwarePod'
  s.license      = 'MIT'
  s.authors      = { "felix" => "2319979647@qq.com" }
  s.platform     = :ios, '7.0'
  s.source       = {:git => 'https://github.com/helinyu/AKSpeech.git', :tag => s.version}
  s.source_files = 'sources/**/*'
  s.requires_arc = true
  s.description  = <<-DESC
                  AKSpeech is encapsulating the AVSpeech to block for using 
                 DESC
    # s.dependency 'Masonry', '~> 1.0.2'
    # s.vendored_frameworks = 'framework/YDOpenHardwareCore.framework'
    # ,'framework/YDOpenHardwareSDK.framework'

end