//
//  WifiMoreController+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/7/19.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WifiMoreController+Inner.h"
#import "WifiMoreController+Action.h"
#import "WifiMoreController+Signal.h"
#import "WifiMoreController+Notification.h"
#import "WifiMoreController+Theme.h"
#import "WifiMoreController+Debug.h"

@implementation WifiMoreController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@end

#pragma mark - handleSignal
@implementation WifiMoreController (handleSignal)

#if __Debug__
handleSignal(WifiMoreController, selfSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[WifiMoreController selfSignal:] : Signal : %@", aSignal));

   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

@end
