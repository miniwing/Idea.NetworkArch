//
//  WoLANController+Notification.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WoLANController+Inner.h"
#import "WoLANController+Action.h"
#import "WoLANController+Signal.h"
#import "WoLANController+Notification.h"
#import "WoLANController+Theme.h"
#import "WoLANController+Debug.h"

#import "WoLANContentController+Inner.h"
#import "WoLANContentController+Signal.h"
#import "WoLANContentController+Notification.h"

@implementation WoLANController (Notification)

#if __Debug__
@def_notification(self);
#endif /* __Debug__ */

handleNotification(WoLANContentController, startSignal) {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[WoLANController startSignal:] : Signal : %@", aNotification));
      
   __CATCH(nErr);
   
   return;
}

@end
