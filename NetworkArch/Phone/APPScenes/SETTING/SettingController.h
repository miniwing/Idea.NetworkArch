//
//  SettingController.h
//  SETTING
//
//  Created by Harry on 2021/02/25.
//  Copyright © 2021 Harry. All rights reserved.
//

#import <IDEAUIVendor/IDEAViewController.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingController : IDEAViewController

@property (nonatomic, weak)   IBOutlet       UIBarButtonItem                     * leftBarButtonItem;

@property (nonatomic, weak)   IBOutlet       UIView                              * contentView;
@property (nonatomic, weak)   IBOutlet       NSLayoutConstraint                  * contentViewTop;

@end

NS_ASSUME_NONNULL_END
