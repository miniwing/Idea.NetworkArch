//
//  HomeSettingController+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/8/15.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "HomeSettingController.h"

#import "HomeSettingContentController.h"
#import "HomeSettingContentController+Inner.h"
#import "HomeSettingContentController+Theme.h"
#import "HomeSettingContentController+Signal.h"
#import "HomeSettingContentController+Notification.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeSettingController ()

@property (nonatomic, strong)                MDCAppBar                           * appBar;

@property (nonatomic, strong)                HomeSettingContentController        * contentController;

@end

@interface HomeSettingController (Inner)

@end

NS_ASSUME_NONNULL_END
