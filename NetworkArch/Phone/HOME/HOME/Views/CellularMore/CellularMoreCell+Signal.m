//
//  CellularMoreCell+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/8/1.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "CellularMoreCell+Signal.h"

@implementation CellularMoreCell (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@end

#pragma mark - handleSignal
@implementation CellularMoreCell (handleSignal)

#if __Debug__
handleSignal(CellularMoreCell, selfSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[CellularMoreCell selfSignal:] : Signal : %@", aSignal));

   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

@end
