//
//  APPDelegate.m
//  NetworkArch
//
//  Created by Harry on 2021/6/24.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import <SettingProvider/SettingProvider.h>
#import <NetworkService/INetworkService.h>
#import <IDEAKit/UIDevice+Network.h>

#import <APPDATA/APPDATA.h>
#import <APPDATA/NetworkArch.h>

#import <ADs/AppOpenAdManager.h>

#import "APPDelegate.h"
#import "APPDelegate+ADs.h"
#import "APPDelegate+Inner.h"
#import "APPDelegate+Signal.h"

#import "RootViewController.h"
#import "SplashViewController.h"

@implementation APPDelegate

- (BOOL)application:(UIApplication *)aApplication willFinishLaunchingWithOptions:(nullable NSDictionary<UIApplicationLaunchOptionsKey, id> *)aLaunchOptions {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : documentsPath   : %@", aApplication.documentsPath));
   LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : libraryPath     : %@", aApplication.libraryPath));
   LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : documentsPath   : %@", [UIApplication sharedApplication].documentsPath));
   LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : identifierGroup : %@", [IDEAIdentifier identifierGroup]));
   LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : pathGroup       : %@", [UIApplication groupPath:[IDEAIdentifier identifierGroup]]));
      
#if AF_NETWORKING
   [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
#endif /* AF_NETWORKING */
   
#if AF_NETWORK_ACTIVITY_LOGGER
   [[AFNetworkActivityLogger sharedLogger] startLogging];
   [[AFNetworkActivityLogger sharedLogger] setLogLevel:AFLoggerLevelDebug];
#endif /* AF_NETWORK_ACTIVITY_LOGGER */
   
   /******************************************************************************************/
   /**
    监听保存
    */
//   __TEST("%s", "-[APPDelegate application:willFinishLaunchingWithOptions:]");
   
   /******************************************************************************************/
   
   //   self.onNotification(IDEA_MAKE_NOTIFICATION( Setting, TABBAR, ANIMATE ), ^(NSNotification *aNotification) {
   //
   //      [APPDelegate setTabbarAnimation:[aNotification.object boolValue]];
   //   });
   //   [self observeNotification:SettingController.tabAnimationNotification];
   /******************************************************************************************/
   /**
    监听网络状态
    */
   @weakify(self);
   self.onNotification(SettingProvider.appRateOnStoreNotification, ^(NSNotification *aNotification) {

      @strongify(self);
      
      LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : appRateOnStore : %@", aNotification));
      LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : strongify : %@", self));

#if APP_RATER
      [Appirater rateApp];
#endif /* APP_RATER */
      return;
   });
   
//   // 检测锁屏和解锁
//   // 私有 API
//   CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), //center
//                                   NULL, // CFBridgingRetain(self), // observer
//                                   displayStatusChanged, // callback
//                                   CFSTR("com.apple.springboard.lockcomplete"), // event name
//                                   NULL, // object
//                                   CFNotificationSuspensionBehaviorDeliverImmediately);
//   
//   
//   CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), //center
//                                   NULL, // observer
//                                   displayStatusChanged,
//                                   CFSTR("com.apple.springboard.lockstate"),
//                                   NULL, // object
//                                   CFNotificationSuspensionBehaviorDeliverImmediately);
   
   /******************************************************************************************/
   
#if __InjectionIII__
   [[NSBundle bundleWithPath:@"/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle"] load];
   //   // or switf
   //   Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle")?.load()
   //   // for tvOS:
   //   Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/tvOSInjection.bundle")?.load()
   //   // Or for macOS:
   //   Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/macOSInjection.bundle")?.load()
#endif /* __InjectionIII__ */
   
#if __Debug__
   /******************************************************************************************/
   // https://www.jianshu.com/p/a02be724b7ec
   // 动态注册字体
   
   LogDebug((@"----------------------------------------------------"));
   for (NSString *szFamilyName = nil in [UIFont familyNames]) {
      
      LogDebug((@"family:'%@'", szFamilyName));
      
      //      for(NSString *szName in [UIFont fontNamesForFamilyName:szFamilyName]) {
      //
      //         LogDebug((@"\tfont:'%@'",szName));
      //
      //      } /* End for () */
      
   } /* End for () */
   
   LogDebug((@"----------------------------------------------------"));
   
   LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : [IDEAIdentifier scheme] : %@", [IDEAIdentifier scheme]));
   LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : [IDEAIdentifier schemePrefix] : %@", [IDEAIdentifier schemePrefix]));
   
   LogDebug((@"----------------------------------------------------"));

//   LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : isEmail : %@", [(@"www.baidu.com") isEmail] ? @"YES" : @"NO"));
//   LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : isEmail : %@", [(@"xxx.xxx@gmail.com") isEmail] ? @"YES" : @"NO"));
//   LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : isEmail : %@", [(@"xxx@baidu.com") isEmail] ? @"YES" : @"NO"));
//   LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : isEmail : %@", [(@"xxx.@baidu.com") isEmail] ? @"YES" : @"NO"));
//
//   LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : isIPV4 : %@", [(@"192.168.2.22") isIPAddress] ? @"YES" : @"NO"));
//   LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : isIPV4 : %@", [(@"192.2") isIPAddress] ? @"YES" : @"NO"));
//   LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : isIPV4 : %@", [(@"192.168.2.2222") isIPAddress] ? @"YES" : @"NO"));
//   LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : isIPV4 : %@", [(@"192.168.2.256") isIPAddress] ? @"YES" : @"NO"));
//   LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : isIPV4 : %@", [(@"192.168.256.254") isIPAddress] ? @"YES" : @"NO"));
//   LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : isIPV4 : %@", [(@"192.256.168.254") isIPAddress] ? @"YES" : @"NO"));
//   LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : isIPV4 : %@", [(@"256.192.168.254") isIPAddress] ? @"YES" : @"NO"));

   NSArray<NSString *>  *stIPV4s = [(@"192.168.2.22") IPV4s];
   LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : IPV4s : %@", stIPV4s));

   LogDebug((@"----------------------------------------------------"));

   /******************************************************************************************/
      
//   dispatch_sync(dispatch_get_main_queue(), ^{
//      NSLog(@"死锁。。。。。。。");
//   });

   /******************************************************************************************/

   float  w    = [UIScreen mainScreen].bounds.size.width * [UIScreen mainScreen].scale;
   float  h    = [UIScreen mainScreen].bounds.size.height * [UIScreen mainScreen].scale;

   float  dpi  = sqrt( w*w + h*h ); // 屏幕对角尺寸

   LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : dpi : %.2f", dpi));
   
#endif /* __Debug__ */
   
   LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : ProtectedDataAvailable : %d", aApplication.isProtectedDataAvailable));
   LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : IDFA : %@", [ASIdentifierManager sharedManager].advertisingIdentifier.UUIDString));
   LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : IDFV : %@", UIDevice.currentDevice.identifierForVendor.UUIDString));

   /******************************************************************************************/

#if GOOGLE_MOBILE_ADS
   [[GADMobileAds sharedInstance] startWithCompletionHandler:nil];
   
#if ADMOB_TEST_DEVICE
   NSMutableArray   *stTestDevices = [NSMutableArray array];
   
#  if TARGET_OS_SIMULATOR
   [stTestDevices addObject:GADSimulatorID];
#  endif /* TARGET_OS_SIMULATOR */

//   [stTestDevices addObject:@"d843fe76c85abf1f5ca02c98904f81bf"]; // Harry's iPhone 5s
//   [stTestDevices addObject:@"09b9c6760653656e703bd450c3385513"]; // ROM's iPhone 5s

   [stTestDevices addObject:[UIDevice currentDevice].identifierForVendor.UUIDString];
   [stTestDevices addObject:[ASIdentifierManager sharedManager].advertisingIdentifier.UUIDString]; // TEST Device

   [stTestDevices addObject:@"80fbff4cdaad0a572a0b0e2faa24035a"]; // Harry's iPhone 6s
   [stTestDevices addObject:@"bc7bde38feef1e59c9d73072448d9126"]; // Harry's iPhone 6s+

   [GADMobileAds sharedInstance].requestConfiguration.testDeviceIdentifiers = stTestDevices;
#endif /* ADMOB_TEST_DEVICE */

   [AppOpenAdManager setDelegate:self];
   [AppOpenAdManager loadAd];
#endif /* GOOGLE_MOBILE_ADS */

   /******************************************************************************************/

   __CATCH(nErr);
   
   return SUCCESS == nErr; //YES;
}

- (BOOL)application:(UIApplication *)aApplication didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[APPDelegate application:didFinishLaunchingWithOptions:] : UIApplication  : %@", aApplication));
   LogDebug((@"-[APPDelegate application:didFinishLaunchingWithOptions:] : Window         : %@", self.window));
   LogDebug((@"-[APPDelegate application:didFinishLaunchingWithOptions:] : TraitCollection: %@", self.window.traitCollection));

   /******************************************************************************************/
   // setup appearance
   if (@available(iOS 15.0, *)) {
      
      UINavigationBarAppearance  *stAppearance  = [[UINavigationBarAppearance alloc] init];
      [stAppearance configureWithOpaqueBackground];
      [stAppearance setBackgroundColor:UIColor.clearColor];
      [stAppearance setShadowColor:UIColor.clearColor];
      [stAppearance setShadowImage:[UIImage new]];
      
      NSMutableDictionary  *stTitleAttributes   = nil;
      
      if (nil == stAppearance.titleTextAttributes) {
         
         stTitleAttributes = [NSMutableDictionary dictionary];
         
      } /* End if () */
      else {
         
         stTitleAttributes = [stAppearance.titleTextAttributes mutableCopy];
         
      } /* End else */
      
      [stTitleAttributes setObject:UIColorX.labelColor
                            forKey:NSForegroundColorAttributeName];
      [stTitleAttributes setObject:[UIFont systemFontOfSize:16 weight:UIFontWeightRegular]
                            forKey:NSFontAttributeName];
      
      [stAppearance setTitleTextAttributes:stTitleAttributes];
      
      [UINavigationBar appearance].standardAppearance    = stAppearance;
      [UINavigationBar appearance].scrollEdgeAppearance  = [UINavigationBar appearance].standardAppearance;
      
   } /* End if () */
   else {
      
      // Fallback on earlier versions
      
   } /* End else */
   /******************************************************************************************/

   LogDebug((@"-[APPDelegate application:didFinishLaunchingWithOptions:] : appVersion : %@", [UIApplication sharedApplication].appVersion));
   
   /******************************************************************************************/

   // Override point for customization after application launch.
   if ([self.window.rootViewController isKindOfClass:RootViewController.class]) {
      
      self.rootViewController    = __cast(RootViewController *, self.window.rootViewController);
      
//      self.splashViewController  = [UIStoryboard loadStoryboard:SplashViewController.storyboard
//                                                 viewController:SplashViewController.class];
   } /* End if () */
   else if ([self.window.rootViewController isKindOfClass:SplashViewController.class]) {
      
      self.splashViewController  = __cast(SplashViewController *, self.window.rootViewController);
      
//      self.rootViewController    = [UIStoryboard loadStoryboard:RootViewController.storyboard
//                                                 viewController:RootViewController.class];
   } /* End else */
   
   [self.window makeKeyAndVisible];
   
   /******************************************************************************************/
   
   LogDebug((@"-[APPDelegate application:didFinishLaunchingWithOptions:] : ProtectedDataAvailable : %d", aApplication.isProtectedDataAvailable));
   
   self.applicationState   = UIApplicationStateActive;
   [self splash];
   
   /******************************************************************************************/

   __CATCH(nErr);
   
   return SUCCESS == nErr; //YES;
}

- (void)applicationWillResignActive:(UIApplication *)aApplication {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
   // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
   // [self splash];

   __CATCH(nErr);
   
   return;
}

- (void)applicationDidEnterBackground:(UIApplication *)aApplication {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
   // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

   self.applicationState   = UIApplicationStateBackground;
   
   __CATCH(nErr);
   
   return;
}

- (void)applicationWillEnterForeground:(UIApplication *)aApplication {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
   [Appirater appEnteredForeground:YES];
   
   __CATCH(nErr);
   
   return;
}

- (void)applicationDidBecomeActive:(UIApplication *)aApplication {
   
   int                            nErr                                     = EFAULT;

   NSTimeInterval                 dLastTime                                = 0.0f;
   
#if GOOGLE_MOBILE_ADS
   UIViewController              *stRootController                         = nil;
#endif /* GOOGLE_MOBILE_ADS */

   __TRY;
   
   // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//   if (NO == [APPDelegate isApiKeySetting]) {
//
//      [self sendSignal:APPDelegate.loadApiKeySignal];
//
//   } /* End if () */

   dLastTime   = [SettingProvider activeTime];
   
#if GOOGLE_MOBILE_ADS
   stRootController = self.window.rootViewController;
   LogDebug((@"-[APPDelegate applicationDidBecomeActive:] : RootController : %@", stRootController));

   // Do not show app open ad if the current view controller is SplashViewController.
//   if (stRootViewController && [rootViewController isKindOfClass:[SplashViewController class]]) {
   if (!stRootController || ([stRootController isKindOfClass:SplashViewController.class])) {

   } /* End if () */
   else {
      
      if ((UIApplicationStateBackground == self.applicationState) && (0 != dLastTime) && ([NSDate date].timeIntervalSince1970 - dLastTime > 5 * 60)) {
         
         [AppOpenAdManager showAdIfAvailable:stRootController];

      } /* End if () */
      
   } /* End else */
#endif /* GOOGLE_MOBILE_ADS */

   [SettingProvider setActiveTime:[NSDate date].timeIntervalSince1970];
   self.applicationState   = UIApplicationStateActive;

   __CATCH(nErr);
   
   return;
}

- (void)applicationWillTerminate:(UIApplication *)aApplication {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
   
   __CATCH(nErr);
   
   return;
}

- (BOOL)application:(UIApplication *)aApplication openURL:(NSURL *)aURL options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)aOptions {
   
   int                            nErr                                     = EFAULT;
   
   BOOL                           bDone                                    = NO;
   
   __TRY;
   
   LogDebug((@"-[APPDelegate application:openURL:options:] : URL : %@", aURL));
   LogDebug((@"-[APPDelegate application:openURL:options:] : [IDEAIdentifier scheme] : %@", [IDEAIdentifier scheme]));
   LogDebug((@"-[APPDelegate application:openURL:options:] : [IDEAIdentifier schemePrefix] : %@", [IDEAIdentifier schemePrefix]));
   
   if ([[aURL scheme] isEqualToString:[IDEAIdentifier schemePrefix]]) {
      
      //...
      bDone = YES;
      
   } /* End if () */
   
   __CATCH(nErr);
   
   // Add any custom logic here.
   return bDone;
}

- (void)applicationProtectedDataWillBecomeUnavailable:(UIApplication *)aApplication {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;

   LogDebug((@"-[APPDelegate applicationProtectedDataWillBecomeUnavailable:] : ProtectedDataAvailable : %d", aApplication.isProtectedDataAvailable));

   __CATCH(nErr);
   
   return;
}

- (void)applicationProtectedDataDidBecomeAvailable:(UIApplication *)aApplication {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;

   LogDebug((@"-[APPDelegate applicationProtectedDataDidBecomeAvailable:] : ProtectedDataAvailable : %d", aApplication.isProtectedDataAvailable));

   __CATCH(nErr);
   
   return;
}

- (BOOL)canOpenURL:(NSURL *)aURL {
    
    int                            nErr                                     = EFAULT;
    
    BOOL                           bDone                                    = NO;

    __TRY;
    
   if ([[aURL scheme] isEqualToString:[IDEAIdentifier schemePrefix]]) {
      
      //...
      bDone = YES;
      
   } /* End if () */

    __CATCH(nErr);
    
    return bDone;
 }

#pragma mark - Splash
- (void)splash {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;

   BG_PERFORM_SELECTOR(self, @selector(loadData), nil);
   
   __CATCH(nErr);
   
   return;
}

- (void)loadData {
   
   int                            nErr                                     = EFAULT;
   
   NSString                      *szVersion                                = nil;
   
   __TRY;
      
   szVersion   = [SettingProvider version];
   LogDebug((@"-[APPDelegate loadData] : version    : %@", szVersion));
   LogDebug((@"-[APPDelegate loadData] : appVersion : %@", [UIApplication sharedApplication].appVersion));
      
   // 安装之后第一次进入
   if (kStringIsBlank(szVersion)) {
      
      [SettingProvider setVersion:[UIApplication sharedApplication].appVersion];
      [SettingProvider setTabbarAnimation:NO];
      [SettingProvider setApiKeySetting:NO];
      [SettingProvider setPrivacy:NO];

   } /* End if () */
   else {
      
      if ([szVersion isEqual:[UIApplication sharedApplication].appVersion]) {
         
         // 非第一次进入
         
      } /* End if () */
      else {
         
         // 版本更新后第一次进入
         // 可能需要升级数据。
         [SettingProvider setVersion:[UIApplication sharedApplication].appVersion];
         [SettingProvider setTabbarAnimation:NO];
         [SettingProvider setApiKeySetting:NO];
         [SettingProvider setPrivacy:NO];

      } /* End else */
      
   } /* End else */
   
   LogDebug((@"-[APPDelegate loadData] : [UIDevice ipv4:NetworkCellular] : %@", [UIDevice ipv4:NetworkCellular]));

   /******************************************************************************************/

   [self postSignal:APPDelegate.loadApiKeySignal onQueue:DISPATCH_GET_BACKGROUND_QUEUE()];

   /******************************************************************************************/

//#if GOOGLE_MOBILE_ADS
//   UI_PERFORM_SELECTOR(self, @selector(showAD), nil, NO);
//#else /* GOOGLE_MOBILE_ADS */
//   UI_PERFORM_SELECTOR(self, @selector(splashing), nil, NO);
//#endif /* !GOOGLE_MOBILE_ADS */

   /**
    * 冷启动时不显示开屏广告
    */
   UI_PERFORM_SELECTOR(self, @selector(splashing), nil, NO);

   __CATCH(nErr);
   
   return;
}

#if GOOGLE_MOBILE_ADS
- (void)showAD {

   int                            nErr                                     = EFAULT;

   __TRY;

   [AppOpenAdManager showAdIfAvailable:self.window.rootViewController];
   LogDebug((@"-[APPDelegate showAD] : [AppOpenAdManager isShowingAd] : %@", [AppOpenAdManager isShowingAd] ? @"YES" : @"NO"));

   DISPATCH_AFTER_ON_MAIN_QUEUE(5, ^{

      LogDebug((@"-[APPDelegate showAD] : [AppOpenAdManager isShowingAd] : %@", [AppOpenAdManager isShowingAd] ? @"YES" : @"NO"));

      if ([AppOpenAdManager isShowingAd]) {

         // 有广告展示
         DISPATCH_AFTER_ON_MAIN_QUEUE(5, ^{

            [self splashing];
         });

      } /* End if () */
      else {

         // 无广告展示
         [self splashing];

      } /* End else */

      return;
   });

   __CATCH(nErr);

   return;
}

#pragma mark - AppOpenAdManagerDelegate
- (void)adDidComplete {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
      
   __CATCH(nErr);
   
   return;
}

#endif /* GOOGLE_MOBILE_ADS */

// 如果sleep，必需是非UI线程。
- (void)splashing {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   if (nil == self.rootViewController) {
      
      self.rootViewController    = [UIStoryboard loadStoryboard:RootViewController.storyboard
                                                 viewController:RootViewController.class];
   } /* End if () */
   
   [self.window setRootViewController:self.rootViewController];
   self.rootViewController.view.alpha  = 0;
   
   [self.window addSubview:self.splashViewController.view];
   [self.window bringSubviewToFront:self.splashViewController.view];
   self.rootViewController.view.alpha  = 1;
   
   [self.rootViewController setNeedsStatusBarAppearanceUpdate];
   
   [UIView animateWithDuration:[UIView animationDefaultDuration]
                    animations:^(void) {
      
      self.splashViewController.view.alpha   = 0;
   }
                    completion:^(BOOL aFinished) {
      
      [self.splashViewController.view removeFromSuperview];
      
      __RELEASE(self.splashViewController);
      UI_PERFORM_SELECTOR(self, @selector(splashDone), nil, NO);
   }];
   
   __CATCH(nErr);
   
   return;
}

// 如果sleep，必需是非UI线程。
- (void)splashDone {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   /******************************************************************************************/
#if APP_RATER
   [Appirater setAppId:[IDEAIdentifier appId]];
   [Appirater setDaysUntilPrompt:7];
   [Appirater setUsesUntilPrompt:5];
   [Appirater setSignificantEventsUntilPrompt:-1];
   [Appirater setTimeBeforeReminding:2];
   [Appirater setDebug:__Debug__];
   /******************************************************************************************/
#  if __Debug__
#  else
   [Appirater appLaunched:YES];
#  endif
#endif /* APP_RATER */

   /******************************************************************************************/

   [self postNotificationName:SplashViewController.SPLASH_DONE
                       object:nil];
   
   __CATCH(nErr);
   
   return;
}

@end
