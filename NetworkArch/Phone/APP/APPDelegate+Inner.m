//
//  APPDelegate+Inner.m
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "APPDelegate+ADs.h"
#import "APPDelegate+Inner.h"
#import "APPDelegate+Signal.h"

@implementation APPDelegate (Inner)

@end

//// 接受通知后的处理
//void displayStatusChanged(CFNotificationCenterRef aCenter,
//                          void *aObserver,
//                          CFStringRef aName,
//                          const void *aObject,
//                          CFDictionaryRef aUserInfo) {
//   
//   // 每次锁屏和解锁都会发这个通知，第一次是锁屏，第二次是解锁，交替进行
////   [[HotSplashManager sharedInstance] lockStateChanged];
//   
//   LogDebug((@"APPDelegate::displayStatusChanged : name : %@", aName));
//   LogDebug((@"APPDelegate::displayStatusChanged : UserInfo : %@", aUserInfo));
//
//   return;
//}
