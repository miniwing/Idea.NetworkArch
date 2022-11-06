//
//  HomeController+Inner.m
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "HomeRootController+Inner.h"

#import "HomeController+Inner.h"

#import "HomeContentController+Signal.h"

@implementation HomeController (Inner)

@end

#pragma mark - UIStoryboard
@implementation HomeController (UIStoryboard)

+ (NSString *)storyboard {
   
   return @(MODULE);
}

+ (NSString *)bundle {

   return @(BUNDLE);
}

@end

#pragma mark - <CLLocationManagerDelegate>
@implementation HomeController (CLLocationManagerDelegate)

- (void)locationManager:(CLLocationManager *)aManager didChangeAuthorizationStatus:(CLAuthorizationStatus)aStatus {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
      
   [self postSignal:HomeContentController.loadWifiInfoSignal
            onQueue:DISPATCH_GET_MAIN_QUEUE()];
   
//   [self postSignal:HomeContentController.loadCellularInfoSignal onQueue:DISPATCH_GET_MAIN_QUEUE()];

   __CATCH(nErr);
   
   return;
}

@end

#pragma mark - IDEA_MAIN
IDEA_MAIN() {
   
   LogDebug((@"HomeRootController::IDEA_MAIN"));
   
   [IDEAUIRouter registerURLPattern:@"HOME/create"
                          toHandler:^(NSString *aURL, NSDictionary *aRouter, IDEAUIRouterCompletion aCompletion) {
      
      LogDebug((@"HomeRootController::IDEA_MAIN : URL      : %@", aURL));
      LogDebug((@"HomeRootController::IDEA_MAIN : Router   : %@", aRouter));
      
      HomeRootController   *stSettingController = [UIStoryboard loadStoryboard:HomeRootController.storyboard
                                                                viewController:HomeRootController.class
                                                                      inBundle:HomeRootController.bundle];
      
      if (nil != aCompletion) {
         
         aCompletion(aURL, nil, stSettingController);
         
      } /* End if () */
   }];
   
   return;
}
