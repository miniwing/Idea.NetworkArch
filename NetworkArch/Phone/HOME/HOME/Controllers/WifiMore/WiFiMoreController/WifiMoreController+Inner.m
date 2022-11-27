//
//  WifiMoreController+Inner.m
//  NetworkArch
//
//  Created by Harry on 2021/7/19.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WifiMoreController+Inner.h"
#import "WifiMoreController+Action.h"
#import "WifiMoreController+Signal.h"
#import "WifiMoreController+Notification.h"
#import "WifiMoreController+Theme.h"
#import "WifiMoreController+Debug.h"

@implementation WifiMoreController (Inner)

@end

#pragma mark - UIStoryboard
@implementation WifiMoreController (UIStoryboard)

+ (NSString *)storyboard {
   
   return @"WIFI";
}

+ (NSString *)bundle {

   return @(BUNDLE);
}

@end

#pragma mark - IDEA_MAIN
IDEA_MAIN() {
   
   LogDebug((@"WifiMoreController::IDEA_MAIN"));
   
   [IDEAUIRouter registerURLPattern:@"WIFI/create"
                          toHandler:^(NSString *aURL, NSDictionary *aRouter, IDEAUIRouterCompletion aCompletion) {
      
      LogDebug((@"WifiMoreController::IDEA_MAIN : URL      : %@", aURL));
      LogDebug((@"WifiMoreController::IDEA_MAIN : Router   : %@", aRouter));
      
      UIViewController  *stViewController = [UIStoryboard loadStoryboard:WifiMoreController.storyboard
                                                          viewController:WifiMoreController.class
                                                                inBundle:WifiMoreController.bundle];
      
      if (nil != aCompletion) {
         
         aCompletion(aURL, nil, stViewController);
         
      } /* End if () */
   }];
   
   return;
}
