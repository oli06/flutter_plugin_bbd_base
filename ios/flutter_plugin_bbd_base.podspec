#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_plugin_bbd_base'
  s.version          = '0.0.1'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
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
  s.info_plist = {
    'GDApplicationID' => 'com.example.gdappid',
     'GDLibraryMode' => 'GDEnterpriseSimulation',
     'GDApplicationVersion' => '1.0.0.0',
     'NSFaceIDUsageDescription' => 'FaceID is used to unlock App without code'
  }

  s.app_spec 'Runner' do |app_spec|
    app_spec.info_plist = {
      'GDApplicationID' => 'com.example.gdappid',
      'GDLibraryMode' => 'GDEnterpriseSimulation',
      'GDApplicationVersion' => '1.0.0.0',
      'NSFaceIDUsageDescription' => 'FaceID is used to unlock App without code'
    }
  end
end
