//
//  WoLANRootController+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WoLANRootController+Inner.h"
#import "WoLANRootController+Signal.h"
#import "WoLANRootController+Notification.h"
#import "WoLANRootController+Theme.h"
#import "WoLANRootController+Debug.h"

@implementation WoLANRootController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@end

#pragma mark - handleSignal
@implementation WoLANRootController (handleSignal)

#if __Debug__
handleSignal(WoLANRootController, selfSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[WoLANRootController selfSignal:] : Signal : %@", aSignal));

   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

@end
