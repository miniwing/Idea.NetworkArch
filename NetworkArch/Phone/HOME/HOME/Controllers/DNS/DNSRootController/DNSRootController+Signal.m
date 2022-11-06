//
//  DNSRootController+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "DNSRootController+Inner.h"
#import "DNSRootController+Signal.h"
#import "DNSRootController+Notification.h"
#import "DNSRootController+Theme.h"
#import "DNSRootController+Debug.h"

@implementation DNSRootController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@end

#pragma mark - handleSignal
@implementation DNSRootController (handleSignal)

#if __Debug__
handleSignal(DNSRootController, selfSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[DNSRootController selfSignal:] : Signal : %@", aSignal));

   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

@end
