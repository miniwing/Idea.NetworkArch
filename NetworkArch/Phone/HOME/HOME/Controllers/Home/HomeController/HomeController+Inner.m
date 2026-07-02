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
#import "HomeController+Action.h"
#import "HomeController+Signal.h"
#import "HomeController+Notification.h"
#import "HomeController+Theme.h"
#import "HomeController+Debug.h"

#import "HomeContentController+Inner.h"
#import "HomeContentController+Action.h"
#import "HomeContentController+Signal.h"
#import "HomeContentController+Theme.h"
#import "HomeContentController+Debug.h"

@implementation HomeController (Inner)

@end

#pragma mark - UIStoryboard
@implementation HomeController (UIStoryboard)

+ (NSString *)bundle {

   return @(BUNDLE);
}

+ (NSString *)storyboard {
   
   return @(MODULE);
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
      
      UIViewController  *stViewController = [UIStoryboard loadStoryboard:HomeRootController.storyboard
                                                          viewController:HomeRootController.class
                                                                inBundle:HomeRootController.bundle];
      
      if (nil != aCompletion) {
         
         aCompletion(aURL, nil, stViewController);
         
      } /* End if () */
   }];
   
   return;
}
