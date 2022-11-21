//
//  UISettingController+Action.m
//  UISETTING
//
//  Created by Harry on 2022/10/18.
//

#import "UISettingRootController.h"

#import "UISettingController+Inner.h"
#import "UISettingController+Action.h"
#import "UISettingController+Signal.h"
#import "UISettingController+Notification.h"
#import "UISettingController+Theme.h"
#import "UISettingController+Debug.h"

@implementation UISettingController (Action)

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
