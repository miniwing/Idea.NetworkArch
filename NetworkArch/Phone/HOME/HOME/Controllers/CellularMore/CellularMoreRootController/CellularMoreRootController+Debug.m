//
//  CellularMoreRootController+Debug.m
//  NetworkArch
//
//  Created by Harry on 2021/7/19.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "CellularMoreRootController+Inner.h"
#import "CellularMoreRootController+Signal.h"
#import "CellularMoreRootController+Notification.h"
#import "CellularMoreRootController+Theme.h"
#import "CellularMoreRootController+Debug.h"

#if __Debug__
@implementation CellularMoreRootController (Debug)

@end
#endif /* __Debug__ */

#if __InjectionIII__
#pragma mark - InjectionIII
@implementation CellularMoreRootController (InjectionIII)

- (void)injected {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

@end
#endif /* __InjectionIII__ */
