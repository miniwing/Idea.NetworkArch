//
//  DNSCell+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/8/16.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "DNSCell+Signal.h"

@implementation DNSCell (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@end

#pragma mark - handleSignal
@implementation DNSCell (handleSignal)

#if __Debug__
handleSignal(DNSCell, selfSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[DNSCell selfSignal:] : Signal : %@", aSignal));

   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

@end
