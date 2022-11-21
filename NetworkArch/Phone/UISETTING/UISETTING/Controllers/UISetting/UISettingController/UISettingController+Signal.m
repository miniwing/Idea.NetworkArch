//
//  UISettingController+Signal.m
//  SETTING
//
//  Created by Harry on 2021/8/19.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "UISettingController+Inner.h"
#import "UISettingController+Action.h"
#import "UISettingController+Signal.h"
#import "UISettingController+Notification.h"
#import "UISettingController+Theme.h"
#import "UISettingController+Debug.h"

@implementation UISettingController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@end

#pragma mark - handleSignal
@implementation UISettingController (handleSignal)

#if __Debug__
handleSignal(UISettingController, selfSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[UISettingController selfSignal:] : Signal : %@", aSignal));

   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

@end
