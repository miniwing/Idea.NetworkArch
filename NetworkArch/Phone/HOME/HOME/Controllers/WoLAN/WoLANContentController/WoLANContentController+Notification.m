//
//  WoLANContentController+Notification.m
//  NetworkArch
//
//  Created by Harry on 2021/8/13.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WoLANContentController+Inner.h"
#import "WoLANContentController+Action.h"
#import "WoLANContentController+Signal.h"
#import "WoLANContentController+Notification.h"
#import "WoLANContentController+Theme.h"
#import "WoLANContentController+Debug.h"

@implementation WoLANContentController (Notification)

#if __Debug__
@def_notification(self);
#endif /* __Debug__ */

@def_notification(textChange);
@def_notification(done);

@end
