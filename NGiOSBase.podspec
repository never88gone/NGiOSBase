Pod::Spec.new do |s|

  s.name         = "NGiOSBase"
  s.version      = "0.0.7"
  s.summary      = "This is base lib of NGiOSBase."

  s.description  = <<-DESC
                    This is base lib of iOS (Objective-c).
                    Owned by NG.
                   DESC

  s.homepage     = "http://www.never88gone.cn"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "never88gone" => "86278708@qq.com" }
  s.platform     = :ios, "8.0"

  s.ios.deployment_target = "8.0"

  s.source       = { :git => "git@www.never88gone.cn:NGiOS/NGiOSBase.git", :tag => "#{s.version}" }

  s.source_files  = "NGiOSBase/**/*.{h,m}"

  s.public_header_files = "NGiOSBase/**/*.h"

  s.prefix_header_file = "NGiOSBase/NGiOSBase.pch"

  s.frameworks = "Foundation", "UIKit", "MobileCoreServices"
  s.library = 'sqlite3'
  s.user_target_xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }
  s.xcconfig = {"OHTER_LINKER_FLAGS" => "-OjbC"}
  s.dependency "BlocksKit","2.2.5"
  s.dependency "CSStickyHeaderFlowLayout","0.2.11"
  s.dependency "CocoaLumberjack","3.1.0"
  s.dependency "FLAnimatedImage","1.0.12"
  s.dependency "JSONModel","1.7.0"
  s.dependency "MBProgressHUD","1.0.0"
  s.dependency "MagicalRecord","2.3.2"
  s.dependency "PureLayout","3.0.2"
  s.dependency "SDWebImage","3.7.6"
  s.dependency "UIView+FDCollapsibleConstraints","1.1"


  s.requires_arc = true
  non_arc_files = 'NGiOSBase/DataCache/Keychain/KeychainItemWrapper/KeychainItemWrapper.{h,m}'
  s.exclude_files = non_arc_files
  s.subspec 'no-arc' do |sp|
    sp.source_files = non_arc_files
    sp.requires_arc = false
  end

  non_arc_files_nkdbarcode = 'NGiOSBase/Tools/NKDBarcode/*.{h,m}'
  s.exclude_files = non_arc_files_nkdbarcode
  s.subspec 'NKDBarcode' do |nkdbarcode|
    nkdbarcode.source_files = non_arc_files_nkdbarcode
    nkdbarcode.requires_arc = false
  end

end
