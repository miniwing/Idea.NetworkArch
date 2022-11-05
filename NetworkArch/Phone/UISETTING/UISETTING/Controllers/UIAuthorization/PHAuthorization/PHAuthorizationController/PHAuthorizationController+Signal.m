//
//  PHAuthorizationController+Signal.m
//  UISETTING
//
//  Created by Harry on 2022/6/20.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "PHAuthorizationController+Signal.h"

@implementation PHAuthorizationController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@end

#pragma mark - handleSignal
@implementation PHAuthorizationController (handleSignal)

#if __Debug__
handleSignal(PHAuthorizationController, selfSignal) {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}
#endif /* __Debug__ */

@end
