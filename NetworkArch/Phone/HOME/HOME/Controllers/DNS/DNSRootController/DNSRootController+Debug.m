//
//  DNSRootController+Debug.m
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

#if __Debug__
@implementation DNSRootController (Debug)

@end
#endif /* __Debug__ */

#if __InjectionIII__
#pragma mark - InjectionIII
@implementation DNSRootController (InjectionIII)

- (void)injected {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

@end
#endif /* __InjectionIII__ */
