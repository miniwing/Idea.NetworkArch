//
//  WifiInterfacesCell+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/8/11.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WifiInterfacesCell+Signal.h"

@implementation WifiInterfacesCell (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@end

#pragma mark - handleSignal
@implementation WifiInterfacesCell (handleSignal)

#if __Debug__
handleSignal(WifiInterfacesCell, selfSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[WifiInterfacesCell selfSignal:] : Signal : %@", aSignal));

   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

@end
