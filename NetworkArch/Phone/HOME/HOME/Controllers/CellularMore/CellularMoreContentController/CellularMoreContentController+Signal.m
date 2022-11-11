//
//  CellularMoreContentController+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/8/1.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "CellularMoreContentController+Action.h"
#import "CellularMoreContentController+Inner.h"
#import "CellularMoreContentController+Signal.h"
#import "CellularMoreContentController+Notification.h"
#import "CellularMoreContentController+Theme.h"
#import "CellularMoreContentController+Debug.h"

#import "CellularMoreContentController+AD.h"

@implementation CellularMoreContentController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@def_signal(loadAD);

@end

#pragma mark - handleSignal
@implementation CellularMoreContentController (handleSignal)

#if __Debug__
handleSignal(CellularMoreContentController, selfSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[CellularMoreContentController selfSignal:] : Signal : %@", aSignal));

   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

handleSignal(CellularMoreContentController, loadADSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[CellularMoreContentController loadADSignal:] : Signal : %@", aSignal));

   [self loadAd];
   
   __CATCH(nErr);

   return;
}

@end
