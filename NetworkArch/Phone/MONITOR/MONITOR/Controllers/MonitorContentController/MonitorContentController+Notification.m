//
//  MonitorContentController+Notification.m
//  MONITOR
//
//  Created by Harry on 2022/11/20.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "MonitorContentController+Inner.h"
#import "MonitorContentController+Action.h"
#import "MonitorContentController+Signal.h"
#import "MonitorContentController+Notification.h"
#import "MonitorContentController+Theme.h"
#import "MonitorContentController+Debug.h"

@implementation MonitorContentController (Notification)

#if __Debug__
@def_notification(self);
#endif /* __Debug__ */

@end

#pragma mark - handleNotification
@implementation MonitorContentController (handleNotification)

#if __Debug__
handleNotification(MonitorContentController, selfNotification) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

@end
