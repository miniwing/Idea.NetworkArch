//
//  WhoisController+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WhoisController+Signal.h"

@implementation WhoisController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@def_signal(start);

@end

#pragma mark - handleSignal
@implementation WhoisController (handleSignal)

handleSignal(WhoisController, startSignal) {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [self resignFirstResponder];
   
   LogDebug((@"-[WhoisController startSignal:] : Signal : %@", aSignal));
      
   __CATCH(nErr);
   
   return;
}

@end
