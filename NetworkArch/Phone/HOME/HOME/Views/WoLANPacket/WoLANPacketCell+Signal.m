//
//  WoLANPacketCell+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/8/19.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WoLANPacketCell+Signal.h"

@implementation WoLANPacketCell (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@end

#pragma mark - handleSignal
@implementation WoLANPacketCell (handleSignal)

#if __Debug__
handleSignal(WoLANPacketCell, selfSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[WoLANPacketCell selfSignal:] : Signal : %@", aSignal));

   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

@end
