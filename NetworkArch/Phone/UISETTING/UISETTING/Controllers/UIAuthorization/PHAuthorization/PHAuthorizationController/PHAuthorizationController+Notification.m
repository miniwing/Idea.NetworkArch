//
//  PHAuthorizationController+Notification.m
//  UISETTING
//
//  Created by Harry on 2022/6/20.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "PHAuthorizationController+Notification.h"

@implementation PHAuthorizationController (Notification)

#if __Debug__
@def_notification(self);
#endif /* __Debug__ */

@def_notification(allowAccess);

@end

#pragma mark - handleNotification
@implementation PHAuthorizationController (handleNotification)

#if __Debug__
handleNotification(PHAuthorizationController, selfNotification) {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}
#endif /* __Debug__ */

@end
