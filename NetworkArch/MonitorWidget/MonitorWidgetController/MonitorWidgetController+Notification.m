//
//  MonitorWidgetController+Notification.m
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

@implementation MonitorWidgetController (Notification)

#if __Debug__
@def_notification(self);
#endif /* __Debug__ */

@end

#pragma mark - handleNotification
@implementation MonitorWidgetController (handleNotification)

#if __Debug__
handleNotification(MonitorWidgetController, selfNotification) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

@end
