//
//  WoLANController+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WoLANController+Signal.h"

@implementation WoLANController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@end

#pragma mark - handleSignal
@implementation WoLANController (handleSignal)

handleSignal(WoLANContentController, startSignal) {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
      
   LogDebug((@"-[WoLANController startSignal:] : Signal : %@", aSignal));
      
   __CATCH(nErr);
   
   return;
}

handleSignal(WoLANContentController, doneSignal) {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
      
   LogDebug((@"-[WoLANController doneSignal:] : Signal : %@", aSignal));

   [self.contentView setUserInteractionEnabled:YES];

   __CATCH(nErr);
   
   return;
}

@end
