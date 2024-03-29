Pod::Spec.new do |spec|
  spec.name         = "HOME"
  spec.version      = "1.0.0"
  spec.summary      = "HOME"
  spec.description  = "HOME"
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
                                        'PRODUCT_BUNDLE_IDENTIFIER' => 'com.idea.HOME',
                                        'ENABLE_BITCODE'            => 'NO',
                                        'SWIFT_VERSION'             => '5.0',
                                        'EMBEDDED_CONTENT_CONTAINS_SWIFT'       => 'NO',
                                        'ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES' => 'NO',
                                        'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
                                      }
  spec.osx.pod_target_xcconfig      = { 'PRODUCT_BUNDLE_IDENTIFIER' => 'com.idea.HOME' }
  spec.watchos.pod_target_xcconfig  = { 'PRODUCT_BUNDLE_IDENTIFIER' => 'com.idea.HOME-watchOS' }
  spec.tvos.pod_target_xcconfig     = { 'PRODUCT_BUNDLE_IDENTIFIER' => 'com.idea.HOME' }
  
  spec.frameworks                   = ['Foundation', 'UIKit', 'CoreGraphics', 'QuartzCore', 'CoreFoundation']

  spec.xcconfig                     = {
    'HEADER_SEARCH_PATHS'               => [
#                                            "${PODS_TARGET_SRCROOT}/",
#                                            "${PODS_TARGET_SRCROOT}/../",
#                                            "${PODS_ROOT}/Headers/Public/YYKit/"
                                            ]
                                      }

  spec.pod_target_xcconfig          = {
    'GCC_PREPROCESSOR_DEFINITIONS'      => [
                                              ' MODULE=\"HOME\" ',
                                              ' BUNDLE=\"HOME\" '
                                            ]
                                      }
  
  if ENV['IDEA_YYKIT'] == 'YES'
    spec.dependency 'YYKit'
  end # IDEA_YYKIT
  
  if ENV['IDEA_AFNETWORKING'] == 'YES'
    spec.dependency 'AFNetworking'
  end # if IDEA_AFNETWORKING
  
  if ENV['IDEA_MATERIAL_COMPONENTS'] == 'YES'
    spec.dependency 'MaterialComponents'
    spec.dependency 'MotionInterchange'
  else
    if ENV['IDEA_MATERIAL_NAVIGATION_BAR'] == 'YES'
      spec.dependency 'MaterialComponents/NavigationBar'
      spec.dependency 'MaterialComponents/ActivityIndicator'
      spec.dependency 'MotionInterchange'
    end # IDEA_MATERIAL_NAVIGATION_BAR
  end # IDEA_MATERIAL_COMPONENTS

  if ENV['IDEA_FOUNDATION_EXTENSION'] == 'YES'
    spec.dependency 'FoundationExtension'
  end # IDEA_FOUNDATION_EXTENSION
  
  if ENV['IDEA_UIKIT_EXTENSION'] == 'YES'
    spec.dependency 'UIKitExtension'
  end # IDEA_UIKIT_EXTENSION
  
  if ENV['IDEA_FULLSCREEN_POP_GESTURE'] == 'YES'
    spec.dependency 'IDEAFullscreenPopGesture'
  end # IDEA_FULLSCREEN_POP_GESTURE
  
  #  spec.dependency 'IDEANibBridge'
  
  if ENV['IDEA_PAN_MODAL'] == 'YES'
    spec.dependency 'IDEAPanModal'
  end # IDEA_PAN_MODAL
  
  if ENV['SSZipArchive'] == 'YES'
    spec.dependency 'SSZipArchive'
  end # SSZipArchive
  
#  spec.dependency 'PromisesObjC'
  spec.dependency 'MBProgressHUD'
#  spec.dependency 'SharkORM'
  
#  spec.dependency 'IDEAPhotoPicker'
#  spec.dependency 'IDEARefresh'

  if ENV['ADS_AUDIENCE_NETWORK'] == 'YES'
    if ENV['XCODE_VERSION'] == '12.4'
      spec.dependency 'FBAudienceNetwork',                '6.10.0'
    else
      spec.dependency 'FBAudienceNetwork'
    end
  end # ADS_AUDIENCE_NETWORK

  if ENV['ADS_GOOGLE_MOBILE'] == 'YES'
    if ENV['XCODE_VERSION'] == '12.4'
      spec.dependency 'Google-Mobile-Ads-SDK',            '9.3.0'
      else
      spec.dependency 'Google-Mobile-Ads-SDK'
    end
  end # ADS_GOOGLE_MOBILE

  if ENV['ADS_GOOGLE_MEDIATION_FACEBOOK'] == 'YES'
    if ENV['XCODE_VERSION'] == '12.4'
      spec.dependency 'GoogleMobileAdsMediationFacebook', '6.10.0.0'
    else
      spec.dependency 'GoogleMobileAdsMediationFacebook'
    end
  end # ADS_GOOGLE_MEDIATION_FACEBOOK

  spec.dependency 'IDEAKit'
  spec.dependency 'IDEAUIKit'
  spec.dependency 'IDEAUIVendor'
  spec.dependency 'IDEAColor'
  spec.dependency 'IDEAApplet'
  spec.dependency 'IDEANightVersion'
#  spec.dependency 'IDEACountDownTimer'
  spec.dependency 'IDEAUIRouter'

  spec.dependency 'IDEAStartUp'
  spec.dependency 'IDEAServiceManager'
  
  spec.dependency 'IDEATypeFace'

  spec.dependency 'ImageProvider'
  spec.dependency 'SettingProvider'
  spec.dependency 'NetworkService'
  spec.dependency 'PhoneNetSDK'
  
  spec.dependency 'IDEARouter'
  spec.dependency 'IDEANetUtils'
  spec.dependency 'IDEAPing'
  
  spec.dependency 'ADs'
  spec.dependency 'APPDATA'
  spec.dependency 'APPDriver'
#  spec.dependency 'PRIVACY'
  spec.dependency 'INTRODUCTION'

  spec.public_header_files  = 'HOME/Controllers/**/*{Controller,+Notification}.h'
  spec.source_files         = 'HOME/**/*.{h,hpp,hxx,m,mm,m++,c,cpp,cxx}'
  
  spec.requires_arc         = true

  spec.resources            = 'HOME/**/*.{xib,storyboard}'
  spec.resource_bundles     = {
                                'HOME' => [
                                              '*.lproj/*.strings',
                                              '*.xcassets'
                                          ]
                              }

  pch_app_kit = <<-EOS
  
/******************************************************************************************************/

#if (defined(DEBUG) && (1==DEBUG))
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

#ifndef __IPHONE_12_0
#  warning "This project uses features only available in iOS SDK 12.0 and later."
#endif /* __IPHONE_12_0 */

#import <stdlib.h>
#import <stdio.h>
#import <string.h>

#import <pthread/pthread.h>

#import <objc/message.h>
#import <objc/runtime.h>

#ifdef __OBJC__
#  import <UIKit/UIKit.h>
#  import <Foundation/Foundation.h>
#  import <QuartzCore/QuartzCore.h>
#  import <QuartzCore/CAAnimation.h>
#  import <MessageUI/MessageUI.h>
#  import <Photos/Photos.h>
#  import <PhotosUI/PhotosUI.h>
#  import <AVKit/AVKit.h>
#  import <AVFoundation/AVFoundation.h>
#  import <CoreTelephony/CTCarrier.h>
#  import <CoreTelephony/CTTelephonyNetworkInfo.h>

#  import <AppTrackingTransparency/AppTrackingTransparency.h>
#  import <AdSupport/AdSupport.h>
#else /* __OBJC__ */
#endif /* !__OBJC__ */

/******************************************************************************************************/

#ifdef __OBJC__

#  if __has_include(<FoundationExtension/FoundationExtension.h>)
#     import <FoundationExtension/FoundationExtension.h>
#     define FOUNDATION_EXTENSION                                          (1)
#  elif __has_include("FoundationExtension/FoundationExtension.h")
#     import "FoundationExtension/FoundationExtension.h"
#     define FOUNDATION_EXTENSION                                          (1)
#  else
#     define FOUNDATION_EXTENSION                                          (0)
#  endif

#  if __has_include(<UIKitExtension/UIKitExtension.h>)
#     define UIKIT_EXTENSION                                               (1)
#     import <UIKitExtension/UIKitExtension.h>
#  elif __has_include("UIKitExtension/UIKitExtension.h")
#     define UIKIT_EXTENSION                                               (1)
#     import "UIKitExtension/UIKitExtension.h"
#  else
#     define UIKIT_EXTENSION                                               (0)
#  endif

#  if __has_include(<RTRootNavigationController/RTRootNavigationController.h>)
#     import <RTRootNavigationController/RTRootNavigationController.h>
#     define RT_ROOT_NAVIGATIONCONTROLLER                                  (1)
#  elif __has_include("RTRootNavigationController/RTRootNavigationController.h")
#     import "RTRootNavigationController/RTRootNavigationController.h"
#     define RT_ROOT_NAVIGATIONCONTROLLER                                  (1)
#  else
#     define rt_topViewController                                          topViewController
#     define rt_visibleViewController                                      visibleViewController
#     define rt_viewControllers                                            viewControllers
#     define rt_navigationController                                       navigationController
#     define RT_ROOT_NAVIGATIONCONTROLLER                                  (0)
#  endif

#  if __has_include(<IDEAFullscreenPopGesture/UINavigationController+FullscreenPopGesture.h>)
#     import <IDEAFullscreenPopGesture/UINavigationController+FullscreenPopGesture.h>
#     define FULLSCREEN_POP_GESTURE                                        (1)
#  elif __has_include("IDEAFullscreenPopGesture/UINavigationController+FullscreenPopGesture.h")
#     import "IDEAFullscreenPopGesture/UINavigationController+FullscreenPopGesture.h"
#     define FULLSCREEN_POP_GESTURE                                        (1)
#  else
#     define FULLSCREEN_POP_GESTURE                                        (0)
#  endif

#  if __has_include(<IDEATabBarControllerTransition/IDEATabBarControllerTransition.h>)
#     import <IDEATabBarControllerTransition/IDEATabBarControllerTransition.h>
#     import <IDEATabBarControllerTransition/IDEATabBarControllerTransitionAnimation.h>
#     define IDEA_TABBARCONTROLLER_TRANSITION                              (1)
#  elif __has_include("IDEATabBarControllerTransition/IDEATabBarControllerTransition.h")
#     import "IDEATabBarControllerTransition/IDEATabBarControllerTransition.h"
#     import "IDEATabBarControllerTransition/IDEATabBarControllerTransitionAnimation.h"
#     define IDEA_TABBARCONTROLLER_TRANSITION                              (1)
#  else
#     define IDEA_TABBARCONTROLLER_TRANSITION                              (0)
#  endif

#  if __has_include(<IDEANibBridge/IDEANibBridge.h>)
#     import <IDEANibBridge/IDEANibBridge.h>
#     import <IDEANibBridge/IDEANibConvention.h>
#     define IDEA_NIB_BRIDGE                                               (1)
#  elif __has_include("IDEANibBridge/IDEANibBridge.h")
#     import <IDEANibBridge/IDEANibBridge.h>
#     import <IDEANibBridge/IDEANibConvention.h>
#     define IDEA_NIB_BRIDGE                                               (1)
#  else
#     define IDEA_NIB_BRIDGE                                               (0)
#  endif

#  if __has_include(<IDEAPanModal/HWPanModal.h>)
#     import <IDEAPanModal/HWPanModal.h>
#     define IDEA_PAN_MODAL                                                (1)
#  elif __has_include("IDEAPanModal/HWPanModal.h")
#     import "IDEAPanModal/HWPanModal.h"
#     define IDEA_PAN_MODAL                                                (1)
#  else
#     define IDEA_PAN_MODAL                                                (0)
#  endif

#  if __has_include(<IDEAPhotoPicker/HXPhotoPicker.h>)
#     import <IDEAPhotoPicker/HXPhotoPicker.h>
#     define IDEA_PHOTO_PICKER                                             (1)
#  elif __has_include("IDEAPhotoPicker/HXPhotoPicker.h")
#     import "IDEAPhotoPicker/HXPhotoPicker.h"
#     define IDEA_PHOTO_PICKER                                             (1)
#  else
#     define IDEA_PHOTO_PICKER                                             (0)
#  endif

#  if __has_include(<YYKit/YYKit.h>)
#     import <YYKit/YYKit.h>
#     define YY_KIT                                                        (1)
#  elif __has_include("YYKit/YYKit.h")
#     import "YYKit/YYKit.h"
#     define YY_KIT                                                        (1)
#  else
#     define YY_KIT                                                        (0)
#  endif

#  if __has_include(<PromisesObjC/PromisesObjC.h>)
#     import <PromisesObjC/PromisesObjC.h>
#     define PROMISES_OBJC                                                 (1)
#  elif __has_include("PromisesObjC/PromisesObjC.h")
#     import "PromisesObjC/PromisesObjC.h"
#     define PROMISES_OBJC                                                 (1)
#  else
#     define PROMISES_OBJC                                                 (0)
#  endif

#  if __has_include(<MBProgressHUD/MBProgressHUD.h>)
#     import <MBProgressHUD/MBProgressHUD.h>
#     define MB_PROGRESS_HUD                                               (1)
#  elif __has_include("MBProgressHUD/MBProgressHUD.h")
#     import "MBProgressHUD/MBProgressHUD.h"
#     define MB_PROGRESS_HUD                                               (1)
#  else
#     define MB_PROGRESS_HUD                                               (0)
#  endif

#  if __has_include(<SharkORM/SharkORM.h>)
#     import <SharkORM/SharkORM.h>
#     define SHARK_ORM                                                     (1)
#  elif __has_include("SharkORM/SharkORM.h")
#     import "SharkORM/SharkORM.h"
#     define SHARK_ORM                                                     (1)
#  else
#     define SHARK_ORM                                                     (0)
#  endif

#  if __has_include(<Masonry/Masonry.h>)
#     import <Masonry/Masonry.h>
#     define MASONRY                                                       (1)
#  elif __has_include("Masonry/Masonry.h")
#     import "Masonry/Masonry.h"
#     define MASONRY                                                       (1)
#  else
#     define MASONRY                                                       (0)
#  endif

#  if __has_include(<SSZipArchive/SSZipArchive.h>)
#     import <SSZipArchive/SSZipArchive.h>
#     define SS_ZIP_ARCHIVE                                                (1)
#  elif __has_include("SSZipArchive/SSZipArchive.h")
#     import "SSZipArchive/SSZipArchive.h"
#     define SS_ZIP_ARCHIVE                                                (1)
#  else
#     define SS_ZIP_ARCHIVE                                                (0)
#  endif

#  if __has_include(<MaterialComponents/MaterialNavigationBar.h>)
#     import <MaterialComponents/MaterialNavigationBar.h>
#     define MATERIAL_NAVIGATIONBAR                                        (1)
#  elif __has_include("MaterialComponents/MaterialNavigationBar.h")
#     import "MaterialComponents/MaterialNavigationBar.h"
#     define MATERIAL_NAVIGATIONBAR                                        (1)
#  else
#     define MATERIAL_NAVIGATIONBAR                                        (0)
#  endif

#  if __has_include(<MaterialComponents/MaterialActivityIndicator.h>)
#     import <MaterialComponents/MaterialPalettes.h>
#     import <MaterialComponents/MaterialActivityIndicator.h>
#     define MATERIAL_ACTIVITY_INDICATOR                                   (1)
#  elif __has_include("MaterialComponents/MaterialActivityIndicator.h")
#     import "MaterialComponents/MaterialPalettes.h"
#     import "MaterialComponents/MaterialActivityIndicator.h"
#     define MATERIAL_ACTIVITY_INDICATOR                                   (1)
#  else
#     define MATERIAL_ACTIVITY_INDICATOR                                   (0)
#  endif

#  if __has_include(<IDEARefresh/MJRefresh.h>)
#     import <IDEARefresh/MJRefresh.h>
#     define IDEA_REFRESH                                                  (1)
#  elif __has_include("IDEARefresh/MJRefresh.h")
#     import "IDEARefresh/MJRefresh.h"
#     define IDEA_REFRESH                                                  (1)
#  else
#     define IDEA_REFRESH                                                  (0)
#  endif

#  if __has_include(<IDEANightVersion/DKNightVersion.h>)
#     import <IDEANightVersion/DKNightVersion.h>
#     define IDEA_NIGHT_VERSION_MANAGER                                    (1)
#  elif __has_include("IDEANightVersion/DKNightVersion.h")
#     import "IDEANightVersion/DKNightVersion.h"
#     define IDEA_NIGHT_VERSION_MANAGER                                    (1)
#  else
#     define IDEA_NIGHT_VERSION_MANAGER                                    (0)
#  endif

#  if __has_include(<IDEACountDownTimer/IDEACountDownTimer.h>)
#     import <IDEACountDownTimer/IDEACountDownTimer.h>
#     define IDEA_COUNT_DOWN_TIMER                                         (1)
#  elif __has_include("IDEACountDownTimer/IDEACountDownTimer.h")
#     import "IDEACountDownTimer/IDEACountDownTimer.h"
#     define IDEA_COUNT_DOWN_TIMER                                         (1)
#  else
#     define IDEA_COUNT_DOWN_TIMER                                         (0)
#  endif

#  if __has_include(<IDEAApplet/IDEAApplet.h>)
#     import <IDEAApplet/IDEAApplet.h>
#     import <IDEAApplet/IDEAAppletCore.h>
#     import <IDEAApplet/IDEAAppletModel.h>
#     import <IDEAApplet/IDEAAppletEvent.h>
#     import <IDEAApplet/IDEAAppletService.h>
#     import <IDEAApplet/IDEAAppletSingleton.h>
#     import <IDEAApplet/IDEAAppletNotificationBus.h>
#     import <IDEAApplet/IDEAAppletSignalBus.h>
#  endif // __has_include(<IDEAApplet/IDEAApplet.h>)

#  if __has_include(<IDEAApplet/IDEAAppletDebug.h>)
#     import <IDEAApplet/IDEAAppletDebug.h>
#  endif // __has_include(<IDEAApplet/IDEAAppletDebug.h>)

#endif /* __OBJC__ */

#import <IDEAStartUp/IDEAStartUp.h>
#import <IDEAUIRouter/IDEAUIRouter.h>

#import <IDEAKit/IDEAKit.h>
#import <IDEAUIKit/IDEAUIKit.h>
#import <IDEAColor/IDEAColor.h>
#import <IDEAColor/UIColorX+System.h>
#import <IDEAColor/UIColorX+Dynamic.h>

/******************************************************************************************************/

#if __has_feature(objc_arc)
#  define __AUTORELEASE(x)                         (x);
#  define __RELEASE(x)                             (x) = nil;
#  define __RETAIN(x)                              (x)
#  define __SUPER_DEALLOC                          objc_removeAssociatedObjects(self);
#  define __dispatch_release(x)                    (x) = nil;
#else
#  define __RETAIN(x)                              [(x) retain];
#  define __AUTORELEASE(x)                         [(x) autorelease];
#  define __RELEASE(x)                             if (nil != (x)) {                               \\
                                                      [(x) release];                               \\
                                                      (x) = nil;                                   \\
                                                   }
#  define __SUPER_DEALLOC                          objc_removeAssociatedObjects(self);[super dealloc];
#  define __dispatch_release(x)                    dispatch_release((x))
#endif

#undef __ON__
#undef __OFF__
#undef __AUTO__
#undef __Debug__

#define __ON__                                     (1)
#define __OFF__                                    (0)

#if defined(DEBUG) && (1==DEBUG)
#  define __AUTO__                                 (1)
#  define __Debug__                                (1)
#else
#  define __AUTO__                                 (0)
#  define __Debug__                                (0)
#endif

/******************************************************************************************************/

#define LOG_BUG_SIZE                               (1024 * 1)

#ifdef __OBJC__

typedef NS_ENUM(NSInteger, __LogLevel) {
  
   __LogLevelFatal   = 0,
   __LogLevelError,
   __LogLevelWarn,
   __LogLevelInfo,
   __LogLevelDebug
};

NS_INLINE const char* ____LogLevelToString(__LogLevel _eLevel) {
  
   switch (_eLevel) {
     
      case __LogLevelFatal:
         return ("Fatal");
      case __LogLevelError:
         return ("Error");
      case __LogLevelWarn:
         return (" Warn");
      case __LogLevelInfo:
         return (" Info");
      case __LogLevelDebug:
         return ("Debug");
      default:
         break;

   } /* End switch (); */

   return ("Unknown");
}

NS_INLINE void ____Log(__LogLevel _eLevel, const NSString *_aMsg) {
  
   if (LOG_BUG_SIZE >= _aMsg.length) {
     
      printf("[%s] %s :: %s\\n", MODULE, ____LogLevelToString(_eLevel), [_aMsg UTF8String]);

   } /* End if () */
   else {
     
      printf("####################################################################################\\n");
      printf("[%s] %s :: ", MODULE, ____LogLevelToString(_eLevel));

      // 在数组范围内，则循环分段
      while (LOG_BUG_SIZE < _aMsg.length) {
        
         // 按字节长度截取字符串
         NSString *szSubStr   = [_aMsg substringToIndex:LOG_BUG_SIZE]; // cutStr(bytes, maxByteNum);

         // 打印日志
         printf("%s\\n", [szSubStr UTF8String]);

         // 截取出尚未打印字节数组
         _aMsg = [_aMsg substringFromIndex:LOG_BUG_SIZE];

      } /* End while () */

      // 打印剩余部分
      printf("%s\\n", [_aMsg UTF8String]);
      printf("####################################################################################\\n");

   } /* End else */

//   printf("[%s] %s :: %s\\n", MODULE, ____LogLevelToString(_eLevel), _cpszMsg);

   return;
}

NS_INLINE void ____LoggerFatal(NSString *aFormat, ...) {
  
   va_list      args;
   NSString    *szMSG   = nil;

   va_start (args, aFormat);
   szMSG = [[NSString alloc] initWithFormat:aFormat  arguments:args];
   va_end (args);

   ____Log(__LogLevelFatal, szMSG);

   __RELEASE(szMSG);

   return;
}

NS_INLINE void ____LoggerError(NSString *aFormat, ...) {
  
   va_list      args;
   NSString    *szMSG   = nil;

   va_start (args, aFormat);
   szMSG = [[NSString alloc] initWithFormat:aFormat  arguments:args];
   va_end (args);

   ____Log(__LogLevelError, szMSG);

   __RELEASE(szMSG);

   return;
}

NS_INLINE void ____LoggerWarn(NSString *aFormat, ...) {
  
   va_list      args;
   NSString    *szMSG   = nil;

   va_start (args, aFormat);
   szMSG = [[NSString alloc] initWithFormat:aFormat  arguments:args];
   va_end (args);

   ____Log(__LogLevelWarn, szMSG);

   __RELEASE(szMSG);

   return;
}

NS_INLINE void ____LoggerInfo(NSString *aFormat, ...) {
  
   va_list      args;
   NSString    *szMSG   = nil;

   va_start (args, aFormat);
   szMSG = [[NSString alloc] initWithFormat:aFormat  arguments:args];
   va_end (args);

   ____Log(__LogLevelInfo, szMSG);

   __RELEASE(szMSG);

   return;
}

NS_INLINE void ____LoggerDebug(NSString *aFormat, ...) {
  
   va_list      args;
   NSString    *szMSG   = nil;

   va_start (args, aFormat);
   szMSG = [[NSString alloc] initWithFormat:aFormat  arguments:args];
   va_end (args);

   ____Log(__LogLevelDebug, szMSG);

   __RELEASE(szMSG);

   return;
}

#else

__BEGIN_DECLS

static __inline void ____LoggerFatal(char *_Format, ...) {
  
   va_list      args;
   static char s_MSG[LOG_BUG_SIZE]  = {0};

   bzero(s_MSG, sizeof(s_MSG));

   va_start (args, _Format);
   vsnprintf(s_MSG, sizeof(s_MSG), _Format, args);
   va_end (args);

   printf("[%s] %s :: %s\\n", MODULE, "Fatal", s_MSG);

   return;
}

static __inline void ____LoggerError(char *_Format, ...) {
  
   va_list      args;
   static char s_MSG[LOG_BUG_SIZE]  = {0};

   bzero(s_MSG, sizeof(s_MSG));

   va_start (args, _Format);
   vsnprintf(s_MSG, sizeof(s_MSG), _Format, args);
   va_end (args);

   printf("[%s] %s :: %s\\n", MODULE, "Error", s_MSG);

   return;
}

static __inline void ____LoggerWarn(char *_Format, ...) {
  
   va_list      args;
   static char s_MSG[LOG_BUG_SIZE]  = {0};

   bzero(s_MSG, sizeof(s_MSG));

   va_start (args, _Format);
   vsnprintf(s_MSG, sizeof(s_MSG), _Format, args);
   va_end (args);

   printf("[%s] %s :: %s\\n", MODULE, "Warning", s_MSG);

   return;
}

static __inline void ____LoggerInfo(char *_Format, ...) {
  
   va_list      args;
   static char s_MSG[LOG_BUG_SIZE]  = {0};

   bzero(s_MSG, sizeof(s_MSG));

   va_start (args, _Format);
   vsnprintf(s_MSG, sizeof(s_MSG), _Format, args);
   va_end (args);

   printf("[%s] %s :: %s\\n", MODULE, "Info", s_MSG);

   return;
}

static __inline void ____LoggerDebug(char *_Format, ...) {
  
   va_list      args;
   static char s_MSG[LOG_BUG_SIZE]  = {0};

   bzero(s_MSG, sizeof(s_MSG));

   va_start (args, _Format);
   vsnprintf(s_MSG, sizeof(s_MSG), _Format, args);
   va_end (args);

   printf("[%s] %s :: %s\\n", MODULE, "Debug", s_MSG);

   return;
}

__END_DECLS

#endif /* !__OBJC__ */

/******************************************************************************************************/

#define IsInvalid                                  (YES)

#define I_FUNCTION                                 __PRETTY_FUNCTION__

#ifndef __STRING
#  define __STRING(STR)                            (#STR)
#endif /* __STRING */

#ifndef FREE_IF
#  define FREE_IF(p)                               if(p) {free (p); (p)=NULL;}
#endif /* DELETE_IF */

/******************************************************************************************************/

#define __DebugFunc__                              (__AUTO__)
#define __DebugDebug__                             (__AUTO__)
#define __DebugWarn__                              (__AUTO__)
#define __DebugError__                             (__AUTO__)
#define __DebugColor__                             (__AUTO__)
#define __DebugView__                              (__AUTO__)

#define __DebugKeyboard__                          (__OFF__)

/******************************************************************************************************/

#if __DebugDebug__
#  define LogDebug(x)                              ____LoggerDebug x
#else
#  define LogDebug(x)
#endif

#if __DebugWarn__
#  define LogWarn(x)                               ____LoggerWarn x
#else
#  define LogWarn(x)
#endif

#if __DebugError__
#  define LogError(x)                              ____LoggerError x
#else
#  define LogError(x)
#endif

#if __DebugFunc__
#  define LogFunc(x)                               ____LoggerInfo x
#else
#  define LogFunc(x)
#endif

#if __DebugView__
#  define LogView(x)                               ____LoggerInfo x
#else
#  define LogView(x)
#endif

#if __DebugKeyboard__
#  define LogKeyboard(x)                           ____LoggerInfo x
#else
#  define LogKeyboard(x)
#endif

/******************************************************************************************************/

#define  __Function_Start()                        LogFunc(((@"%s - Enter!") , __PRETTY_FUNCTION__));
#define  __Function_End(_Return)                                                                                              \\
                                                   {                                                                          \\
                                                      if (noErr == (_Return))                                                 \\
                                                      {                                                                       \\
                                                         LogFunc(((@"%s - Leave with Success!"), __PRETTY_FUNCTION__));                \\
                                                      } /*End if () */                                                        \\
                                                      else                                                                    \\
                                                      {                                                                       \\
                                                         LogFunc(((@"%s - Leave with Error : %d(0x%08x)!"), __PRETTY_FUNCTION__, (int)_Return, (int)_Return));\\
                                                      } /*End else () */                                                      \\
                                                   }

#if (__Debug__)
#  define FunctionStart                            __Function_Start
#  define FunctionEnd                              __Function_End
#else
#  define FunctionStart()
#  define FunctionEnd(x)
#endif /* (__Debug__) */

#define __TRY                                      FunctionStart();           \\
                                                   do {

#define __CATCH(nErr)                                 nErr = noErr;           \\
                                                   } while (0);               \\
                                                   FunctionEnd(nErr);

#define __LOG_FUNCTION                             LogFunc((@"%s :", __PRETTY_FUNCTION__))

#define __LOG_RECT(rc)                             LogDebug((@"%s : RECT : (%d, %d, %d, %d)", __STRING(rc), (int)((rc).origin.x), (int)((rc).origin.y), (int)((rc).size.width), (int)((rc).size.height)))
#define __LOG_SIZE(sz)                             LogDebug((@"%s : SIZE : (%d, %d)", __STRING(sz), (int)((sz).width), (int)((sz).height)))
#define __LOG_POINT(pt)                            LogDebug((@"%s : POINT: (%d, %d)", __STRING(pt), (int)((pt).x), (int)((pt).y)))

/******************************************************************************************************/

#ifndef __DUMMY_CLASS
# define __DUMMY_CLASS(_name_)                     @interface __DUMMY_CLASS_ ## _name_ : NSObject                             \\
                                                   @end                                                                       \\
                                                   @implementation __DUMMY_CLASS_ ## _name_                                   \\
                                                   @end
#endif

/******************************************************************************************************/

#define __AVAILABLE_SDK_IOS(_ios)                  ((__IPHONE_##_ios != 0) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_##_ios))

/******************************************************************************************************/

NS_INLINE NSBundle * __BUNDLE_FROM(Class aClass) {
   
   static NSBundle         *g_BUNDLE      = nil;
   static dispatch_once_t   stOnceToken;
   
   dispatch_once(&stOnceToken, ^{
      
      NSBundle *stBundle   = [NSBundle bundleForClass:aClass];
      NSString *szPath     = [stBundle pathForResource:@(BUNDLE) ofType:@"bundle"];
      
      g_BUNDLE = [NSBundle bundleWithPath:szPath];
   });
   
   return g_BUNDLE;
}

NS_INLINE NSString * __LOCALIZED_STRING(Class aClass, NSString *aKey) {
   
   return NSLocalizedStringWithDefaultValue(aKey, nil, __BUNDLE_FROM(aClass), aKey, aKey);
}

NS_INLINE NSString * __FILE_IN_BUNDLE(NSString *aName, Class aClass) {
    
  return [__BUNDLE_FROM(aClass) pathForResource:aName ofType:@""];
}

NS_INLINE UIImage * __IMAGE_NAMED_IN_BUNDLE(NSString *aName, Class aClass) {
   
   return [UIImage imageNamed:aName inBundle:__BUNDLE_FROM(aClass) compatibleWithTraitCollection:nil];
}

NS_INLINE UIImage * __IMAGE_NAMED_IN_FRAMEWORK(NSString *aName) {
   
   NSString *szPath     = [[NSBundle mainBundle] pathForResource:@(MODULE)
                                                      ofType:@"framework"
                                                 inDirectory:@"Frameworks"];
   
   NSBundle *stBundle   = [NSBundle bundleWithPath:szPath];
   
   return [UIImage imageNamed:aName inBundle:stBundle compatibleWithTraitCollection:nil];
}

NS_INLINE UIImage * __IMAGE_NAMED(NSString *aName, Class aClass) {
   
   UIImage  *stImage    = __IMAGE_NAMED_IN_BUNDLE(aName, aClass);
   
   if (nil == stImage) {
      
      stImage  = __IMAGE_NAMED_IN_FRAMEWORK(aName);
      
   } /* End if () */
   
   return stImage;
}

NS_INLINE NSString * __APP_BUNDLE_NAME() {
   return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
}

NS_INLINE NSString * __APP_BUNDLE_ID() {
   return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
}

NS_INLINE NSString * __APP_VERSION() {
   return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

NS_INLINE NSString * __APP_BUILD_VERSION() {
   return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

/******************************************************************************************************/

#if __has_include(<FBAudienceNetwork/FBAudienceNetwork.h>)
#import <FBAudienceNetwork/FBAudienceNetwork.h>
#  define ADS_AUDIENCE_NETWORK                                             (1)
#elif __has_include("FBAudienceNetwork/FBAudienceNetwork.h")
#  import "FBAudienceNetwork/FBAudienceNetwork.h"
#  define ADS_AUDIENCE_NETWORK                                             (1)
#else
#  define ADS_AUDIENCE_NETWORK                                             (0)
#endif

#if __has_include(<FacebookAdapter/FacebookAdapter.h>)
#  import <FacebookAdapter/FacebookAdapter.h>
#  define ADS_FACEBOOK_ADAPTER                                             (1)
#elif __has_include("FacebookAdapter/FacebookAdapter.h")
#  import "FacebookAdapter/FacebookAdapter.h"
#  define ADS_FACEBOOK_ADAPTER                                             (1)
#else
#  define ADS_FACEBOOK_ADAPTER                                             (0)
#endif

#if __has_include(<GoogleMobileAds/GoogleMobileAds.h>)
#  import <GoogleMobileAds/GoogleMobileAds.h>
#  define ADS_GOOGLE_MOBILE                                                (1)
#elif __has_include("GoogleMobileAds/GoogleMobileAds.h")
#  import "GoogleMobileAds/GoogleMobileAds.h"
#  define ADS_GOOGLE_MOBILE                                                (1)
#else
#  define ADS_GOOGLE_MOBILE                                                (0)
#endif

/******************************************************************************************************/

#import <ImageProvider/ImageProvider.h>
#import <SettingProvider/SettingProvider.h>
#import <SettingProvider/UISetting.h>

#import <IDEARouter/IDEARouter.h>
#import <IDEANetUtils/IDEANetUtils.h>

#if __has_include(<APPDEBUG/APPDEBUG.h>)
#  import <APPDEBUG/APPDEBUG.h>
#  define APP_DEBUG                                                        (1)
#elif __has_include("APPDEBUG/APPDEBUG.h")
#  import "APPDEBUG/APPDEBUG.h"
#  define APP_DEBUG                                                        (1)
#else
#  define APP_DEBUG                                                        (0)
#endif

/******************************************************************************************************/

#if __has_include(<PRIVACY/PrivacyController.h>)
#  import <PRIVACY/PrivacyController+Notification.h>
#  define PRIVACY                                                          (1)
#elif __has_include("PRIVACY/PrivacyController.h")
#  import "PRIVACY/PrivacyController+Notification.h"
#  define PRIVACY                                                          (1)
#else
#  define PRIVACY                                                          (0)
#endif

/******************************************************************************************************/

 EOS
 spec.prefix_header_contents = pch_app_kit

end
