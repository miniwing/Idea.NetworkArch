//
//  LanScanRootController+Debug.m
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "LanScanRootController+Inner.h"
#import "LanScanRootController+Signal.h"
#import "LanScanRootController+Notification.h"
#import "LanScanRootController+Theme.h"
#import "LanScanRootController+Debug.h"

#if __Debug__
@implementation LanScanRootController (Debug)

@end
#endif /* __Debug__ */

#if __InjectionIII__
#pragma mark - InjectionIII
@implementation LanScanRootController (InjectionIII)

- (void)injected {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

@end
#endif /* __InjectionIII__ */
