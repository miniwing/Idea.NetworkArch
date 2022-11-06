//
//  TracerouteController+Debug.m
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "TracerouteController+Inner.h"
#import "TracerouteController+Action.h"
#import "TracerouteController+Signal.h"
#import "TracerouteController+Notification.h"
#import "TracerouteController+Theme.h"
#import "TracerouteController+Debug.h"

#if __Debug__
@implementation TracerouteController (Debug)

@end
#endif /* __Debug__ */

#if __InjectionIII__
#pragma mark - InjectionIII
@implementation TracerouteController (InjectionIII)

- (void)injected {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

@end
#endif /* __InjectionIII__ */
