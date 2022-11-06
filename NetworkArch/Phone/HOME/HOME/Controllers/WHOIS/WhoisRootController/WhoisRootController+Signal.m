//
//  WhoisRootController+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WhoisRootController+Inner.h"
#import "WhoisRootController+Signal.h"
#import "WhoisRootController+Notification.h"
#import "WhoisRootController+Theme.h"
#import "WhoisRootController+Debug.h"

@implementation WhoisRootController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@end

#pragma mark - handleSignal
@implementation WhoisRootController (handleSignal)

#if __Debug__
handleSignal(WhoisRootController, selfSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[WhoisRootController selfSignal:] : Signal : %@", aSignal));

   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

@end
