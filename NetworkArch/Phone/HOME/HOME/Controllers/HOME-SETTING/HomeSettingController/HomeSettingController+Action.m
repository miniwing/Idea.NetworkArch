//
//  HomeSettingController+Action.m
//  HOME
//
//  Created by Harry on 2022/11/9.
//

#import "HomeSettingRootController.h"

#import "HomeSettingController+Inner.h"
#import "HomeSettingController+Action.h"
#import "HomeSettingController+Signal.h"
#import "HomeSettingController+Notification.h"
#import "HomeSettingController+Theme.h"
#import "HomeSettingController+Debug.h"

#pragma mark - IBAction
@implementation HomeSettingController (Action)

- (IBAction)onClose:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [self resignFirstResponder];

   if ([self.navigationController isKindOfClass:HomeSettingRootController.class] || [self.rt_navigationController isKindOfClass:HomeSettingRootController.class]) {
      
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
