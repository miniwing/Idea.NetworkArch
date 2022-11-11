//
//  APPDelegate+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "APPDelegate.h"

#import "RootViewController.h"
#import "SplashViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface APPDelegate () <UIApplicationDelegate
#if GOOGLE_MOBILE_ADS
, GADFullScreenContentDelegate
, AppOpenAdManagerDelegate
#endif /* GOOGLE_MOBILE_ADS */
>

@property (nonatomic, strong)                RootViewController                  * rootViewController;
@property (nonatomic, strong, nullable)      SplashViewController                * splashViewController;

#if GOOGLE_MOBILE_ADS
@property (nonatomic, strong)                GADAppOpenAd                        * appOpenAd;
@property (nonatomic, weak)                  NSDate                              * loadTime;
#endif /* GOOGLE_MOBILE_ADS */

@end

@interface APPDelegate (Inner)

@end

//void displayStatusChanged(CFNotificationCenterRef center,
//                          void *observer,
//                          CFStringRef name,
//                          const void *object,
//                          CFDictionaryRef userInfo);

NS_ASSUME_NONNULL_END
