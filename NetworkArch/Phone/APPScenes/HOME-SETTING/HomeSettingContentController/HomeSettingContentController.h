//
//  HomeSettingContentController.h
//  NetworkArch
//
//  Created by Harry on 2021/8/15.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "HomeSettingApiKeyCell.h"
#import "HomeSettingApiKeyCell+Inner.h"
#import "HomeSettingApiKeyCell+Signal.h"
#import "HomeSettingApiKeyCell+Notification.h"

#import "HomeSettingLinkCell.h"
#import "HomeSettingLinkCell+Inner.h"
#import "HomeSettingLinkCell+Signal.h"
#import "HomeSettingLinkCell+Notification.h"

NS_ASSUME_NONNULL_BEGIN

IDEA_ENUM(NSInteger, HomeSetting) {
   
   HomeSettingApiKey = 0,
   HomeSettingLink   = 1,
   HomeSettingNumber
};


@interface HomeSettingContentController : IDEATableViewController

@property (nonatomic, strong) IBOutletCollection(UITableViewCell) NSArray<UITableViewCell *> * settingCells;
@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *>          * settingCellContainerViews;

@property (nonatomic, weak)   IBOutlet       UIView                              * bottomView;
@property (nonatomic, weak)   IBOutlet       UIButton                            * saveButton;

@end

@interface HomeSettingContentController ()

@property (nonatomic, copy)                  NSString                            * apiKey;

@end

NS_ASSUME_NONNULL_END
