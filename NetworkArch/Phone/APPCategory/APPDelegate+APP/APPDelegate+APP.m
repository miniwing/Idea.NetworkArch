//
//  APPDelegate+APP.m
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "APPDelegate+Inner.h"

@implementation APPDelegate (APP)

+ (APPDelegate *)APP {
   
   static   APPDelegate   *stAPPDelegate     = nil;
   
   if (nil == stAPPDelegate) {
      
      dispatch_sync_on_main_queue(^{
         
         stAPPDelegate   = __cast(APPDelegate *, [[UIApplication sharedApplication] delegate]);
      });
   } /* End if () */
   
   return stAPPDelegate;
}

+ (RootViewController *)rootViewController {
   
   return [APPDelegate APP].rootViewController;
}

+ (SplashViewController *)splashViewController {
   
   return [APPDelegate APP].splashViewController;
}

@end
