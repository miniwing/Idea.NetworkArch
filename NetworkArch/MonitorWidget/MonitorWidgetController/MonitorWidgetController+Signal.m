//
//  MonitorWidgetController+Signal.m
//  MonitorWidget
//
//  Created by Harry on 2022/11/23.
//  Copyright © 2022 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "MonitorWidgetController+Inner.h"
#import "MonitorWidgetController+Action.h"
#import "MonitorWidgetController+Signal.h"
#import "MonitorWidgetController+Notification.h"
#import "MonitorWidgetController+Theme.h"
#import "MonitorWidgetController+Debug.h"

@implementation MonitorWidgetController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@end

#pragma mark - handleSignal
@implementation MonitorWidgetController (handleSignal)

#if __Debug__
handleSignal(MonitorWidgetController, selfSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

@end
