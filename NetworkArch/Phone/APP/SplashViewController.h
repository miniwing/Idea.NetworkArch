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

@property (nonatomic, weak)   IBOutlet       UIActivityIndicatorView             * activityIndicatorView;

//@property (nonatomic, weak)   IBOutlet       UILabel                             * copyrightLabel;

@end

@interface SplashViewController (UIStoryboard)

@property (nonatomic, class, readonly)       NSString                            * storyboard;

@end

@interface SplashViewController (Notification)

@property (class, nonatomic, readonly)       NSString                            * SPLASH;
@property (class, nonatomic, readonly)       NSString                            * SPLASH_DONE;

@end

NS_ASSUME_NONNULL_END
