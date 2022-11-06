//
//  LanScanController+Debug.m
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "LanScanController+Inner.h"
#import "LanScanController+Action.h"
#import "LanScanController+Signal.h"
#import "LanScanController+Notification.h"
#import "LanScanController+Theme.h"
#import "LanScanController+Debug.h"

#if __Debug__
@implementation LanScanController (Debug)

@end
#endif /* __Debug__ */

#if __InjectionIII__
#pragma mark - InjectionIII
@implementation LanScanController (InjectionIII)

- (void)injected {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

@end
#endif /* __InjectionIII__ */
