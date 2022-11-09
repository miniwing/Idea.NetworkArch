//
//  HomeController+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "HomeController+Inner.h"
#import "HomeController+Action.h"
#import "HomeController+Signal.h"
#import "HomeController+Notification.h"
#import "HomeController+Theme.h"
#import "HomeController+Debug.h"

@implementation HomeController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@end

#pragma mark - handleSignal
@implementation HomeController (handleSignal)

#if __Debug__
handleSignal(HomeController, selfSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[HomeController selfSignal:] : Signal : %@", aSignal));

   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

@end
