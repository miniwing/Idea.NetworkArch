Pod::Spec.new do |spec|
  spec.name         = "APPDATA"
  spec.version      = "1.0.0"
  spec.summary      = "APPDATA"
  spec.description  = "APPDATA"
  spec.homepage     = "https://github.com/miniwing"
  spec.license      = "MIT"
  spec.author       = { "Harry" => "miniwing.hz@gmail.com" }
  spec.platform     = :ios, "10.0"
  spec.source       = { :path => "." }

  spec.ios.deployment_target        = '10.0'
  spec.watchos.deployment_target    = '4.3'
    
  spec.osx.deployment_target        = '10.10'
  spec.tvos.deployment_target       = '10.0'

  spec.ios.pod_target_xcconfig      = {
                                        'PRODUCT_BUNDLE_IDENTIFIER' => 'com.idea.APPDATA',
                                        'ENABLE_BITCODE'            => 'NO',
                                        'SWIFT_VERSION'             => '5.0',
                                        'EMBEDDED_CONTENT_CONTAINS_SWIFT'       => 'NO',
                                        'ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES' => 'NO',
                                        'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
                                      }
  spec.osx.pod_target_xcconfig      = { 'PRODUCT_BUNDLE_IDENTIFIER' => 'com.idea.APPDATA' }
  spec.watchos.pod_target_xcconfig  = { 'PRODUCT_BUNDLE_IDENTIFIER' => 'com.idea.APPDATA-watchOS' }
  spec.tvos.pod_target_xcconfig     = { 'PRODUCT_BUNDLE_IDENTIFIER' => 'com.idea.APPDATA' }
  
  spec.frameworks                   = ['Foundation', 'UIKit', 'CoreGraphics', 'QuartzCore', 'CoreFoundation']
    
  spec.xcconfig                     = {
    'HEADER_SEARCH_PATHS'               => [
                                            "${PODS_TARGET_SRCROOT}/",
                                            "${PODS_TARGET_SRCROOT}/../",
                                            "${PODS_ROOT}/Headers/Public/YYKit/"
                                            ]
                                      }

  spec.pod_target_xcconfig          = {
    'GCC_PREPROCESSOR_DEFINITIONS'      => [ ' MODULE=\"APPDATA\" ' ]
                                      }

  if ENV['IDEA_YYKIT'] == 'YES'
    spec.dependency 'YYKit'
  end # IDEA_YYKIT
  
  spec.dependency 'IDEAKit'

  spec.public_header_files  = 'APPDATA/*.h'
  spec.source_files         = 'APPDATA/*.{h,m}'

  spec.resource_bundles     = {
                                'APPDATA' => [
                                              'PLISTs/*.plist',
                                              'JSONs/*.json',
#                                              'DATA/*.png',
                                              'HTMLs/*.html'
                                             ]
                              }
  pch_app_kit = <<-EOS
  
/******************************************************************************************************/

#ifdef DEBUG
#  pragma clang diagnostic ignored                 "-Wgnu"
#  pragma clang diagnostic ignored                 "-Wcomma"
#  pragma clang diagnostic ignored                 "-Wformat"
#  pragma clang diagnostic ignored                 "-Wswitch"
#  pragma clang diagnostic ignored                 "-Wvarargs"
#  pragma clang diagnostic ignored                 "-Wnonnull"
#  pragma clang diagnostic ignored                 "-Wpointer-sign"
#  pragma clang diagnostic ignored                 "-Wdangling-else"
#  pragma clang diagnostic ignored                 "-Wunused-result"
#  pragma clang diagnostic ignored                 "-Wuninitialized"
#  pragma clang diagnostic ignored                 "-Wdocumentation"
#  pragma clang diagnostic ignored                 "-Wpch-date-time"
#  pragma clang diagnostic ignored                 "-Wenum-conversion"
#  pragma clang diagnostic ignored                 "-Wunused-variable"
#  pragma clang diagnostic ignored                 "-Wunused-function"
#  pragma clang diagnostic ignored                 "-Wmissing-noescape"
#  pragma clang diagnostic ignored                 "-Wwritable-strings"
#  pragma clang diagnostic ignored                 "-Wunreachable-code"
#  pragma clang diagnostic ignored                 "-Wshorten-64-to-32"
#  pragma clang diagnostic ignored                 "-Wwritable-strings"
#  pragma clang diagnostic ignored                 "-Wstrict-prototypes"
#  pragma clang diagnostic ignored                 "-Wdocumentation-html"
#  pragma clang diagnostic ignored                 "-Wobjc-method-access"
#  pragma clang diagnostic ignored                 "-Wundeclared-selector"
#  pragma clang diagnostic ignored                 "-Wimplicit-retain-self"
#  pragma clang diagnostic ignored                 "-Wunguarded-availability"
#  pragma clang diagnostic ignored                 "-Wunknown-warning-option"
#  pragma clang diagnostic ignored                 "-Wlogical-op-parentheses"
#  pragma clang diagnostic ignored                 "-Wlogical-not-parentheses"
#  pragma clang diagnostic ignored                 "-Wdeprecated-declarations"
#  pragma clang diagnostic ignored                 "-Wnullability-completeness"
#  pragma clang diagnostic ignored                 "-Wobjc-missing-super-calls"
#  pragma clang diagnostic ignored                 "-Wnonportable-include-path"
#  pragma clang diagnostic ignored                 "-Wconditional-uninitialized"
#  pragma clang diagnostic ignored                 "-Wincompatible-pointer-types"
#  pragma clang diagnostic ignored                 "-Wdeprecated-implementations"
#  pragma clang diagnostic ignored                 "-Wmismatched-parameter-types"
#  pragma clang diagnostic ignored                 "-Wobjc-redundant-literal-use"
#  pragma clang diagnostic ignored                 "-Wno-nullability-completeness"
#  pragma clang diagnostic ignored                 "-Wblock-capture-autoreleasing"
#  pragma clang diagnostic ignored                 "-Wtautological-pointer-compare"
#  pragma clang diagnostic ignored                 "-Wimplicit-function-declaration"
#  pragma clang diagnostic ignored                 "-Wquoted-include-in-framework-header"
#  pragma clang diagnostic ignored                 "-Wnullability-completeness-on-arrays"
#endif /* DEBUG */

/******************************************************************************************************/

#import <Availability.h>

#ifndef __IPHONE_10_0
#  warning "This project uses features only available in iOS SDK 10.0 and later."
#endif

#import <objc/message.h>
#import <objc/runtime.h>

#ifdef __OBJC__

#  import <UIKit/UIKit.h>
#  import <Foundation/Foundation.h>
#  import <QuartzCore/QuartzCore.h>
#  import <QuartzCore/CAAnimation.h>
#  import <MessageUI/MessageUI.h>

#endif /* __OBJC__ */

#import <objc/message.h>
#import <objc/runtime.h>

#ifdef __OBJC__

#  import <UIKit/UIKit.h>
#  import <Foundation/Foundation.h>

#  if __has_include(<YYKit/YYKit.h>)
#     import <YYKit/YYKit.h>
#     define YY_KIT                                                        (1)
#  elif __has_include("YYKit/YYKit.h")
#     import "YYKit/YYKit.h"
#     define YY_KIT                                                        (1)
#  elif __has_include("YYKit.h")
#     import "YYKit.h"
#     define YY_KIT                                                        (1)
#  else
#     define YY_KIT                                                        (0)
#  endif

#endif /* __OBJC__ */

/******************************************************************************************************/

#import <IDEAKit/IDEAKit.h>

/******************************************************************************************************/

 EOS
 spec.prefix_header_contents = pch_app_kit

end
