//
//  SettingRootController.h
//  SETTING
//
//  Created by Harry on 2021/02/25.
//  Copyright © 2021 Harry. All rights reserved.
//

#import <IDEAUIVendor/IDEANavigationController.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingRootController : IDEANavigationController

@end

@interface SettingRootController (UIStoryboard)

@property (class, nonatomic, readonly)       NSString                            * storyboard;

@end

NS_ASSUME_NONNULL_END
