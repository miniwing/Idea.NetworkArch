//
//  PingController+Debug.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "PingController+Inner.h"
#import "PingController+Action.h"
#import "PingController+Signal.h"
#import "PingController+Notification.h"
#import "PingController+Theme.h"
#import "PingController+Debug.h"

#if __Debug__
@implementation PingController (Debug)

@end
#endif /* __Debug__ */

#if __InjectionIII__
#pragma mark - InjectionIII
@implementation PingController (InjectionIII)

- (void)injected {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

@end
#endif /* __InjectionIII__ */
