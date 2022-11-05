//
//  WifiMoreController+Action.m
//  Pods
//
//  Created by Harry on 2022/11/1.
//

#import "WifiMoreRootController+Inner.h"

#import "WifiMoreController+Inner.h"
#import "WifiMoreController+Action.h"
#import "WifiMoreController+Signal.h"
#import "WifiMoreController+Notification.h"
#import "WifiMoreController+Theme.h"
#import "WifiMoreController+Debug.h"

#pragma mark - IBAction
@implementation WifiMoreController (Action)

- (IBAction)onBack:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   if ([self.navigationController isKindOfClass:WifiMoreRootController.class] || [self.rt_navigationController isKindOfClass:WifiMoreRootController.class]) {
      
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
