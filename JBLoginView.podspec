Pod::Spec.new do |s|
  s.name             = "JBLoginView"
  s.version          = "0.1.16"
  s.summary          = "A simple VISPER based Login Screen."
  s.description      = <<-DESC
                        A simple VISPER based Login Screen.
                        Should be used in composition with other VISPER Components
                       DESC
  s.homepage         = "https://github.com/barteljan/JBLoginView"
  s.license          = 'MIT'
  s.author           = { "Jan Bartel" => "barteljan@yahoo.de" }
  s.source           = { :git => "https://github.com/barteljan/JBLoginView.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/janbartel'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'JBLoginView' => ['Pod/Assets/*.xib']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'VISPER'
  s.dependency 'PureLayout'
  s.dependency 'JBLoginDataCommands'
  s.dependency 'MBProgressHUD'
  s.dependency 'TSMessages'
  s.dependency 'BlocksKit'

end
