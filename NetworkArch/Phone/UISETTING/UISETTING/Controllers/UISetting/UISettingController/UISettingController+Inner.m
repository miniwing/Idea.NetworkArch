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

@implementation UISettingController (Inner)

#pragma mark - IBAction
- (IBAction)onBack:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   if ([self.navigationController isKindOfClass:[UISettingRootController class]] || [self.rt_navigationController isKindOfClass:[UISettingRootController class]]) {
      
      [self dismissViewControllerAnimated:YES
                               completion:nil];
   } /* End if () */
   else {
      
      [self.navigationController popViewControllerAnimated:YES
                                                completion:nil];
   } /* End else */
   
   __CATCH(nErr);
   
   return;
}

@end

#pragma mark - UIStoryboard
@implementation UISettingController (UIStoryboard)

+ (NSString *)storyboard {
   
   return @(MODULE);
}

+ (NSString *)bundle {

   return @(BUNDLE);
}

@end

#pragma mark - IDEA_MAIN
IDEA_MAIN() {
   
   LogDebug((@"UISettingController::IDEA_MAIN"));
   
   [IDEAUIRouter registerURLPattern:@"UISETTING/create"
                          toHandler:^(NSString *aURL, NSDictionary *aRouter, IDEAUIRouterCompletion aCompletion) {
      
      LogDebug((@"UISettingController::IDEA_MAIN : URL      : %@", aURL));
      LogDebug((@"UISettingController::IDEA_MAIN : Router   : %@", aRouter));

      UISettingController *stSettingController = [UIStoryboard loadStoryboard:UISettingRootController.storyboard
                                                               viewController:UISettingController.class
                                                                     inBundle:UISettingRootController.bundle];
      
      if (nil != aCompletion) {
         
         aCompletion(aURL, nil, stSettingController);
         
      } /* End if () */
   }];
   
   return;
}