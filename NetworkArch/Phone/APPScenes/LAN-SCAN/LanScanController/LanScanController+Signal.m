//
//  LanScanController+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "LanScanController+Signal.h"

@implementation LanScanController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@def_signal(startScan);
@def_signal(stopScan);

@end

#pragma mark - handleSignal
@implementation LanScanController (handleSignal)

handleSignal(APPDelegate, networkStatusSignal) {

   int                            nErr                                     = EFAULT;
      
   __TRY;

   LogDebug((@"-[HomeContentController handleSignal:networkStatusSignal:] : status : %@", aSignal.object));

   __CATCH(nErr);
   
   return;
}

handleSignal(LanScanController, startScanSignal) {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [self.rightBarButtonItem setImage:[UIImage imageNamed:@"UIButtonBarStop"]];
   
   [[PNetMLanScanner shareInstance] scan];

   __CATCH(nErr);
   
   return;
}

handleSignal(LanScanController, stopScanSignal) {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [self.rightBarButtonItem setImage:[UIImage imageNamed:@"UIButtonBarPlay"]];
   
   [[PNetMLanScanner shareInstance] stop];
   
   __CATCH(nErr);
   
   return;
}

@end
