//
//  CellularMoreRootController+Signal.m
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

@implementation CellularMoreRootController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@end

#pragma mark - handleSignal
@implementation CellularMoreRootController (handleSignal)

#if __Debug__
handleSignal(CellularMoreRootController, selfSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[CellularMoreRootController selfSignal:] : Signal : %@", aSignal));

   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

@end
