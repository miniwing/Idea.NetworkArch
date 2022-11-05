//
//  RootViewController.h
//  NetworkArch
//
//  Created by Harry on 2021/6/24.
//  Copyright © 2021 Harry. All rights reserved.
//

#import <IDEAUIVendor/IDEATabBarController.h>

NS_ASSUME_NONNULL_BEGIN

@interface RootViewController : IDEATabBarControllerTransition <UITabBarControllerDelegate>

@end

@interface RootViewController (UIStoryboard)

@property (nonatomic, class, readonly)       NSString                            * storyboard;

@end

NS_ASSUME_NONNULL_END
