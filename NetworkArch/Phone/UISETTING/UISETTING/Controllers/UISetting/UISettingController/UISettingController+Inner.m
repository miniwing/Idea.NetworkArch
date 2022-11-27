//
//  UISettingController+Inner.m
//  SETTING
//
//  Created by Harry on 2021/6/10.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "UISettingRootController.h"

#import "UISettingController+Inner.h"
#import "UISettingController+Action.h"
#import "UISettingController+Signal.h"
#import "UISettingController+Notification.h"
#import "UISettingController+Theme.h"
#import "UISettingController+Debug.h"

@implementation UISettingController (Inner)

@end

#pragma mark - UIStoryboard
@implementation UISettingController (UIStoryboard)

+ (NSString *)storyboard {
   
   return @"UISETTING";
}

+ (NSString *)bundle {

   return @(BUNDLE);
}

@end

#pragma mark - IDEA_MAIN
IDEA_MAIN() {
   
   LogDebug((@"UISettingController::IDEA_MAIN"));
   
   [IDEAUIRouter registerURLPattern:@"UISETTING-ROOT/create"
                          toHandler:^(NSString *aURL, NSDictionary *aRouter, IDEAUIRouterCompletion aCompletion) {
      
      LogDebug((@"UISettingController::IDEA_MAIN : URL      : %@", aURL));
      LogDebug((@"UISettingController::IDEA_MAIN : Router   : %@", aRouter));
      
      UIViewController  *stViewController = [UIStoryboard loadStoryboard:UISettingRootController.storyboard
                                                          viewController:UISettingRootController.class
                                                                inBundle:UISettingRootController.bundle];
      
      if (nil != aCompletion) {
         
         aCompletion(aURL, nil, stViewController);
         
      } /* End if () */
   }];
   
   [IDEAUIRouter registerURLPattern:@"UISETTING/create"
                          toHandler:^(NSString *aURL, NSDictionary *aRouter, IDEAUIRouterCompletion aCompletion) {
      
      LogDebug((@"UISettingController::IDEA_MAIN : URL      : %@", aURL));
      LogDebug((@"UISettingController::IDEA_MAIN : Router   : %@", aRouter));
      
      UIViewController  *stViewController = [UIStoryboard loadStoryboard:UISettingController.storyboard
                                                          viewController:UISettingController.class
                                                                inBundle:UISettingController.bundle];
      
      if (nil != aCompletion) {
         
         aCompletion(aURL, nil, stViewController);
         
      } /* End if () */
   }];
   
   return;
}
