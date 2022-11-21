//
//  UISettingController+Debug.m
//  SETTING
//
//  Created by Harry on 2021/8/23.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "UISettingController+Inner.h"
#import "UISettingController+Action.h"
#import "UISettingController+Signal.h"
#import "UISettingController+Notification.h"
#import "UISettingController+Theme.h"
#import "UISettingController+Debug.h"

#if __Debug__
@implementation UISettingController (Debug)

@end
#endif /* __Debug__ */

#if __InjectionIII__
#pragma mark - InjectionIII
@implementation UISettingController (InjectionIII)

- (void)injected {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

@end
#endif /* __InjectionIII__ */
