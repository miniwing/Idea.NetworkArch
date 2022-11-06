//
//  WifiInterfacesRootController+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/8/4.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WifiInterfacesRootController+Signal.h"

@implementation WifiInterfacesRootController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@end

#pragma mark - handleSignal
@implementation WifiInterfacesRootController (handleSignal)

#if __Debug__
handleSignal(WifiInterfacesRootController, selfSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[WifiInterfacesRootController selfSignal:] : Signal : %@", aSignal));

   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

@end
