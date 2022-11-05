//
//  CellularMoreController+Debug.m
//  NetworkArch
//
//  Created by Harry on 2021/7/19.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "CellularMoreController+Inner.h"
#import "CellularMoreController+Action.h"
#import "CellularMoreController+Signal.h"
#import "CellularMoreController+Notification.h"
#import "CellularMoreController+Theme.h"
#import "CellularMoreController+Debug.h"

#if __Debug__
@implementation CellularMoreController (Debug)

@end
#endif /* __Debug__ */

#if __InjectionIII__
#pragma mark - InjectionIII
@implementation CellularMoreController (InjectionIII)

- (void)injected {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

@end
#endif /* __InjectionIII__ */
