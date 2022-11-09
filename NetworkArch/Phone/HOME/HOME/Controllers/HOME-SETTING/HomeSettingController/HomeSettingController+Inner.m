//
//  HomeSettingController+Inner.m
//  NetworkArch
//
//  Created by Harry on 2021/8/15.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "HomeSettingRootController.h"

#import "HomeSettingController+Inner.h"
#import "HomeSettingController+Action.h"
#import "HomeSettingController+Signal.h"
#import "HomeSettingController+Notification.h"
#import "HomeSettingController+Theme.h"
#import "HomeSettingController+Debug.h"

@implementation HomeSettingController (Inner)

@end

#pragma mark - UIStoryboard
@implementation HomeSettingController (UIStoryboard)

+ (NSString *)bundle {
   
   return @(BUNDLE);
}

+ (NSString *)storyboard {
   
   return @"HOME";
}

@end

#pragma mark - IDEA_MAIN
IDEA_MAIN() {
   
   LogDebug((@"HomeSettingController::IDEA_MAIN"));
   
   [IDEAUIRouter registerURLPattern:@"HOME.SETTING/create"
                          toHandler:^(NSString *aURL, NSDictionary *aRouter, IDEAUIRouterCompletion aCompletion) {
      
      LogDebug((@"HomeSettingController::IDEA_MAIN : URL      : %@", aURL));
      LogDebug((@"HomeSettingController::IDEA_MAIN : Router   : %@", aRouter));
      
      HomeSettingRootController  *stController  = [UIStoryboard loadStoryboard:HomeSettingRootController.storyboard
                                                                viewController:HomeSettingRootController.class
                                                                      inBundle:HomeSettingRootController.bundle];
      
      if (nil != aCompletion) {
         
         aCompletion(aURL, nil, stController);
         
      } /* End if () */
   }];
   
   return;
}
