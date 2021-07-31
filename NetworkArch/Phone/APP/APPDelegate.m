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

#import "APPDelegate.h"
#import "APPDelegate+Inner.h"
#import "APPDelegate+APP.h"
#import "APPDelegate+Kit.h"

#import "RootViewController.h"
#import "SplashViewController.h"

#import "SettingController+Notification.h"

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
   
   /******************************************************************************************/
   
   //   self.onNotification(IDEA_MAKE_NOTIFICATION( Setting, TABBAR, ANIMATE ), ^(NSNotification *aNotification) {
   //
   //      [APPDelegate setTabbarAnimation:[aNotification.object boolValue]];
   //   });
   
   self.onNotification(SettingController.tabAnimationNotification, ^(NSNotification *aNotification) {
      
      LogDebug((@"-[APPDelegate application:willFinishLaunchingWithOptions:] : tabAnimation : %@", SettingController.tabAnimationNotification));
      
      [APPDelegate setTabbarAnimation:[aNotification.object boolValue]];
   });
   
   //   [self observeNotification:SettingController.tabAnimationNotification];
   
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
#endif /* __Debug__ */
   
   __CATCH(nErr);
   
   return SUCCESS == nErr; //YES;
}

- (BOOL)application:(UIApplication *)aApplication didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[APPDelegate application:didFinishLaunchingWithOptions:] : UIApplication : %@", aApplication));
   /******************************************************************************************/
   
   // Override point for customization after application launch.
   if ([self.window.rootViewController isKindOfClass:[RootViewController class]]) {
      
      self.rootViewController = __cast(RootViewController *, self.window.rootViewController);
      
      self.splashViewController  = [UIStoryboard loadStoryboard:SplashViewController.storyboard
                                                 viewController:[SplashViewController class]];
      
   } /* End if () */
   else if ([self.window.rootViewController isKindOfClass:[SplashViewController class]]) {
      
      self.splashViewController  = __cast(SplashViewController *, self.window.rootViewController);
      
      self.rootViewController = [UIStoryboard loadStoryboard:RootViewController.storyboard
                                              viewController:[RootViewController class]];
      
   } /* End else */
   
   //   [self.window setRootViewController:self.splashViewController];
   [self.window makeKeyAndVisible];
   
   //   [self.window addSubview:self.splashViewController.view];
   
   [self splash];
   
   /******************************************************************************************/
   
   //   [self monitorReachabilityStatus];
   
   /******************************************************************************************/
   
   __CATCH(nErr);
   
   return SUCCESS == nErr; //YES;
}

- (void)applicationWillResignActive:(UIApplication *)aApplication {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
   // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
   
   __CATCH(nErr);
   
   return;
}

- (void)applicationDidEnterBackground:(UIApplication *)aApplication {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
   // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   
   __CATCH(nErr);
   
   return;
}

- (void)applicationWillEnterForeground:(UIApplication *)aApplication {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
   
   __CATCH(nErr);
   
   return;
}

- (void)applicationDidBecomeActive:(UIApplication *)aApplication {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   
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
   
#if __Debug__
   sleep(1.5);
#endif /* __Debug__ */
   
   szVersion   = [APPDelegate version];
   LogDebug((@"-[APPDelegate loadData] : version    : %@", szVersion));
   LogDebug((@"-[APPDelegate loadData] : appVersion : %@", [UIApplication sharedApplication].appVersion));
   
   // 第一次进入
   if (kStringIsEmpty(szVersion)) {
      
      [APPDelegate setVersion:[UIApplication sharedApplication].appVersion];
      [APPDelegate setTabbarAnimation:YES];
      
   } /* End if () */
   else {
      
      if ([szVersion isEqual:[UIApplication sharedApplication].appVersion]) {
         
         // 非第一次进入
         
      } /* End if () */
      else {
         
         // 当前版本第一次进入
         // 可能需要升级数据。
         [APPDelegate setVersion:[UIApplication sharedApplication].appVersion];
         
      } /* End else */
      
   } /* End else */
   
   LogDebug((@"[UIDevice ipv4:NetworkCellular] : %@", [UIDevice ipv4:NetworkCellular]));

   UI_PERFORM_SELECTOR(self, @selector(splashing), nil, NO);
   
   __CATCH(nErr);
   
   return;
}

// 如果sleep，必需是非UI线程。
- (void)splashing {
   
   int                            nErr                                     = EFAULT;
   
   //   NSTimeInterval                 fDuration                                = UIAViewAnimationDefaultDuraton;
   
   __TRY;
   
   self.rootViewController = [UIStoryboard loadStoryboard:RootViewController.storyboard
                                           viewController:[RootViewController class]];
   
   [UIView transitionFromView:self.splashViewController.view
                       toView:self.rootViewController.view
#if __Debug__
                     duration:UIAViewAnimationDefaultDuraton * 2
#else /* __Debug__ */
                     duration:UIAViewAnimationDefaultDuraton
#endif /* !__Debug__ */
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   completion:^(BOOL aFinished) {
      
      UI_PERFORM_SELECTOR(self, @selector(splashDone), nil, NO);
   }];
   
//#if __Debug__
//   fDuration   = UIAViewAnimationDefaultDuraton * 5;
//#endif /* __Debug__ */
//
//   [UIView animateWithDuration:fDuration
//                    animations:^{
//
//      self.splashViewController.view.alpha   = 0;
//   }
//                    completion:^(BOOL finished) {
//
//      [self.splashViewController.view removeFromSuperview];
//
//      UI_PERFORM_SELECTOR(self, @selector(splashDone), nil, NO);
//   }];
   
   __CATCH(nErr);
   
   return;
}

// 如果sleep，必需是非UI线程。
- (void)splashDone {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [self.window setRootViewController:self.rootViewController];
   
   [self postNotificationName:SplashViewController.SPLASH_DONE
                       object:nil];
   
   __CATCH(nErr);
   
   return;
}

//#pragma mark - handleNotification(SettingController, tabAnimationNotification)
//handleNotification(SettingController, notificationName(tabAnimation)) {
//
//   int                            nErr                                     = EFAULT;
//
//   __TRY;
//
//   LogDebug((@"-[APPDelegate handleNotification:] : tabAnimation : %@", SettingController.tabAnimationNotification));
//
//   [APPDelegate setTabbarAnimation:[aNotification.object boolValue]];
//
//   __CATCH(nErr);
//
//   return;
//}

#pragma mark - (AFNetworkReachabilityManager *)networkReachabilityManager
- (AFNetworkReachabilityManager *)networkReachabilityManager {
   
   if (nil == _networkReachabilityManager) {
      
      _networkReachabilityManager   = [AFNetworkReachabilityManager manager];
      
   } /* End if () */
   
   return _networkReachabilityManager;
}

@end
