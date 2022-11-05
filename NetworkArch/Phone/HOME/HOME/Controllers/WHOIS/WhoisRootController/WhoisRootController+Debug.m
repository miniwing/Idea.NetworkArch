//
//  WhoisRootController+Debug.m
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

#if __Debug__
@implementation WhoisRootController (Debug)

@end
#endif /* __Debug__ */

#if __InjectionIII__
#pragma mark - InjectionIII
@implementation WhoisRootController (InjectionIII)

- (void)injected {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

@end
#endif /* __InjectionIII__ */
