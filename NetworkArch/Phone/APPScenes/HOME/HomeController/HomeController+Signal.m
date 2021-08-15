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

#import "HomeController+Signal.h"

@implementation HomeController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@def_signal(setting);

@end

#pragma mark - handleSignal
@implementation HomeController (handleSignal)

handleSignal(HomeController, settingSignal) {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
      
   LogDebug((@"-[HomeController settingSignal:] : Signal : %@", aSignal));
      
   __CATCH(nErr);
   
   return;
}

@end
