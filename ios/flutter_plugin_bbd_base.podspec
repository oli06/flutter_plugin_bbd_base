#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_plugin_bbd_base'
  s.version          = '0.0.1'
  s.summary          = 'Base plugin for Blackberry Dynamics Flutter integration'
  s.description      = <<-DESC
This is the Base plugin. It adds all required configuration to enable using Blackberry Dynamics in your Flutter application. 
All the other flutter_plugin_bbd_* plugins require Base plugin to be installed and work correctly.
                       DESC
  s.homepage         = 'https://www.oliverzernikow.de'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Softwaredevelopment Oliver Zernikow' => 'contact@oliverzernikow.de' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.resource_bundles = { 'GDAssets' => ['Assets/GDAssets.bundle']}
  #s.resources = 'Assets/*.bundle'
  s.dependency 'Flutter'

  s.preserve_paths = 'GD.framework', 'WebKit.framework', 'LocalAuthentication.framework', 'DeviceCheck.framework', 'CFNetwork.framework', 'CoreData.framework', 'CoreTelephony.framework', 'QuartzCore.framework', 'Security.framework', 'MessageUI.framework', 'SystemConfiguration.framework', 'MobileCoreServices.framework', 'CoreGraphics.framework', 'AssetsLibrary.framework', 'libz.tbd'
  s.xcconfig = { 'OTHER_LDFLAGS' => '-framework GD -framework WebKit -framework LocalAuthentication -framework DeviceCheck -framework CFNetwork -framework CoreData -framework CoreTelephony -framework QuartzCore -framework Security -framework MessageUI -framework SystemConfiguration -framework MobileCoreServices -framework CoreGraphics -framework AssetsLibrary' }
  s.vendored_frameworks = 'GD.framework', 'WebKit.framework', 'LocalAuthentication.framework', 'DeviceCheck.framework', 'CFNetwork.framework', 'CoreData.framework', 'CoreTelephony.framework', 'QuartzCore.framework', 'Security.framework', 'MessageUI.framework', 'SystemConfiguration.framework', 'MobileCoreServices.framework', 'CoreGraphics.framework', 'AssetsLibrary.framework', 'libz.tbd'

  s.ios.deployment_target = '8.0'
  s.libraries = 'z', 'c++'
end
