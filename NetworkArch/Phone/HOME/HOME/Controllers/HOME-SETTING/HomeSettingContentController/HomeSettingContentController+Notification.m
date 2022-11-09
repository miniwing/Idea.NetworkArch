//
//  HomeSettingContentController+Notification.m
//  NetworkArch
//
//  Created by Harry on 2021/8/15.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "HomeSettingContentController+Inner.h"
#import "HomeSettingContentController+Action.h"
#import "HomeSettingContentController+Signal.h"
#import "HomeSettingContentController+Notification.h"
#import "HomeSettingContentController+Theme.h"
#import "HomeSettingContentController+Debug.h"

@implementation HomeSettingContentController (Notification)

#if __Debug__
@def_notification(self);
#endif /* __Debug__ */

@def_notification(save);
@def_notification(addLink);

@end
