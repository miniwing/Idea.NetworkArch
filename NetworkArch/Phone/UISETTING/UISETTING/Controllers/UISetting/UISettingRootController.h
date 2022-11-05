//
//  UISettingRootController.h
//  UISETTING
//
//  Created by Harry on 2021/02/25.
//  Copyright © 2021 Harry. All rights reserved.
//

#import <IDEAUIVendor/IDEANavigationController.h>

NS_ASSUME_NONNULL_BEGIN

@interface UISettingRootController : IDEANavigationController

@end

@interface UISettingRootController (UIStoryboard)

@property (class, nonatomic, readonly)       NSString                            * storyboard;
@property (class, nonatomic, readonly)       NSString                            * bundle;

@end

NS_ASSUME_NONNULL_END
