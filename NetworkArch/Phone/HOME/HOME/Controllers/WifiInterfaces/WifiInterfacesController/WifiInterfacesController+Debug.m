//
//  WifiInterfacesController+Debug.m
//  NetworkArch
//
//  Created by Harry on 2021/8/4.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WifiInterfacesController+Inner.h"
#import "WifiInterfacesController+Action.h"
#import "WifiInterfacesController+Signal.h"
#import "WifiInterfacesController+Notification.h"
#import "WifiInterfacesController+Theme.h"
#import "WifiInterfacesController+Debug.h"

#if __Debug__
@implementation WifiInterfacesController (Debug)

@end
#endif /* __Debug__ */

#if __InjectionIII__
#pragma mark - InjectionIII
@implementation WifiInterfacesController (InjectionIII)

- (void)injected {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

@end
#endif /* __InjectionIII__ */
