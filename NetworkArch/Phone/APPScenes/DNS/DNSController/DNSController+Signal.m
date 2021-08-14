//
//  DNSController+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "DNSController+Signal.h"

@implementation DNSController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@def_signal(start);

@end

#pragma mark - handleSignal
@implementation DNSController (handleSignal)

handleSignal(DNSController, startSignal) {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [self resignFirstResponder];
   
   LogDebug((@"-[DNSController startSignal:] : Signal : %@", aSignal));
      
   __CATCH(nErr);
   
   return;
}

@end
