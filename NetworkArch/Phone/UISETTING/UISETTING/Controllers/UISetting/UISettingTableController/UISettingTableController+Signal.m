//
//  UISettingTableController+Signal.m
//  UISETTING
//
//  Created by Harry on 2021/8/19.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "UISettingTableController+Signal.h"

@implementation UISettingTableController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@end

#pragma mark - handleSignal
@implementation UISettingTableController (handleSignal)

#if __Debug__
handleSignal(UISettingTableController, selfSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[UISettingTableController selfSignal:] : Signal : %@", aSignal));

   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

@end
