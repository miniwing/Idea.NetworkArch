//
//  PingRootController+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "PingRootController+Inner.h"
#import "PingRootController+Signal.h"
#import "PingRootController+Notification.h"
#import "PingRootController+Theme.h"
#import "PingRootController+Debug.h"

@implementation PingRootController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@end

#pragma mark - handleSignal
@implementation PingRootController (handleSignal)

#if __Debug__
handleSignal(PingRootController, selfSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[PingRootController selfSignal:] : Signal : %@", aSignal));

   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

@end
