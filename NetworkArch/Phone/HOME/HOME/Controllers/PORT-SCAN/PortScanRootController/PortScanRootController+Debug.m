//
//  PortScanRootController+Debug.m
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "PortScanRootController+Inner.h"
#import "PortScanRootController+Signal.h"
#import "PortScanRootController+Notification.h"
#import "PortScanRootController+Theme.h"
#import "PortScanRootController+Debug.h"

#if __Debug__
@implementation PortScanRootController (Debug)

@end
#endif /* __Debug__ */

#if __InjectionIII__
#pragma mark - InjectionIII
@implementation PortScanRootController (InjectionIII)

- (void)injected {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

@end
#endif /* __InjectionIII__ */
