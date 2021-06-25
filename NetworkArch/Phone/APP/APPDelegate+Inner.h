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

@interface APPDelegate ()

@property (nonatomic, strong)                RootViewController                  * rootViewController;
@property (nonatomic, strong)                SplashViewController                * splashViewController;

@end

@interface APPDelegate (Inner)

@end

NS_ASSUME_NONNULL_END
