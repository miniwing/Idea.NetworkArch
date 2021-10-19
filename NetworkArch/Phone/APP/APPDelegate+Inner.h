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

#import "UIDevice+Network.h"

NS_ASSUME_NONNULL_BEGIN

@interface APPDelegate ()

@property (nonatomic, strong)                RootViewController                  * rootViewController;
@property (nonatomic, strong, nullable)      SplashViewController                * splashViewController;

@property (nonatomic, strong)                NetworkArch                         * networkArch;

@property (nonatomic, strong)                AFNetworkReachabilityManager        * networkReachabilityManager;

@end

@interface APPDelegate (Inner)

- (void)monitorReachabilityStatus;

@end

NS_ASSUME_NONNULL_END
