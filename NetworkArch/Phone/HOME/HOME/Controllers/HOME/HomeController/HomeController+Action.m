//
//  HomeController+Action.m
//  Pods
//
//  Created by Harry on 2022/10/31.
//

#import "HomeController+Inner.h"
#import "HomeController+Action.h"
#import "HomeController+Signal.h"
#import "HomeController+Notification.h"
#import "HomeController+Theme.h"
#import "HomeController+Debug.h"

#pragma mark - IBAction
@implementation HomeController (Action)

- (IBAction)onSetting:(id)aSender {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;

   [self notify:HomeController.settingNotification];
   
   __CATCH(nErr);
   
   return;
}

@end
