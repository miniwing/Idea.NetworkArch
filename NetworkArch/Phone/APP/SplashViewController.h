//
//  SplashViewController.h
//  NetworkArch
//
//  Created by Harry on 2021/6/24.
//  Copyright © 2021 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SplashViewController : UIViewController

@end

@interface SplashViewController ()

//- (BOOL)splashing;
//+ (NSTimeInterval)duration;

@end

@interface SplashViewController (Notification)

@property (class, nonatomic, readonly)       NSString                            * SPLASH;
@property (class, nonatomic, readonly)       NSString                            * SPLASH_DONE;

@end

NS_ASSUME_NONNULL_END
