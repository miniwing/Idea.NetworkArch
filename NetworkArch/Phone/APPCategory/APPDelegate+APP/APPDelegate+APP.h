//
//  APPDelegate+APP.h
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "APPDelegate.h"

#import "RootViewController.h"
#import "SplashViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface APPDelegate (APP)

+ (APPDelegate *)APP;
+ (RootViewController *)rootViewController;
+ (SplashViewController *)splashViewController;

@end

NS_ASSUME_NONNULL_END
