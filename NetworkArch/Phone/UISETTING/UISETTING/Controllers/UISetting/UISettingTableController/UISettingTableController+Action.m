//
//  UISettingTableController+Action.m
//  UISETTING
//
//  Created by Harry on 2022/10/18.
//

#import "UISettingTableController.h"
#import "UISettingTableController+Inner.h"
#import "UISettingTableController+Action.h"
#import "UISettingTableController+Signal.h"
#import "UISettingTableController+Notification.h"
#import "UISettingTableController+Theme.h"
#import "UISettingTableController+Debug.h"

@implementation UISettingTableController (Action)

#pragma mark - IBAction
- (IBAction)onThemeSwitch:(UISwitch *)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   if (aSender.isOn) {
      
      [self.lightButton setEnabled:NO];
      [self.nightButton setEnabled:NO];
      
      if (@available(iOS 13.0, *)) {
         
         DISPATCH_ASYNC_ON_MAIN_QUEUE(^{
            
            if (UIUserInterfaceStyleDark == self.traitCollection.userInterfaceStyle) {
               
               [self.lightButton setSelected:NO];
               [self.nightButton setSelected:YES];
               
               [[DKNightVersionManager sharedManager] nightFalling];
               
            } /* End if () */
            else {
               
               [self.lightButton setSelected:YES];
               [self.nightButton setSelected:NO];
               
               [[DKNightVersionManager sharedManager] dawnComing];
               
            } /* End else */
         });
         
      } /* End if (iOS 13) */
      
   } /* End if () */
   else {
      
      [self.lightButton setEnabled:YES];
      [self.nightButton setEnabled:YES];
      
      [self.lightButton setSelected:YES];
      [self.nightButton setSelected:NO];
      
      DISPATCH_ASYNC_ON_MAIN_QUEUE(^{
         
         [[DKNightVersionManager sharedManager] dawnComing];
      });
   } /* End else */
   
   [SettingProvider setAutoTheme:aSender.isOn];
   [UISelectionFeedbackGenerator selectionChanged];
   
   __CATCH(nErr);
   
   return;
}

- (IBAction)onAnimationSwitch:(UISwitch *)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [SettingProvider setTabbarAnimation:aSender.isOn];
   
   [self postNotify:SettingProvider.tabAnimationNotification
         withObject:@(aSender.isOn)
            onQueue:DISPATCH_GET_MAIN_QUEUE()];

   if ([SettingProvider isHaptics]) {
      
      [UISelectionFeedbackGenerator selectionChanged];

   } /* End if () */
      
   __CATCH(nErr);
   
   return;
}

- (IBAction)onHapticsSwitch:(UISwitch *)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [SettingProvider setHaptics:aSender.isOn];
   
   [self postNotify:SettingProvider.hapticsNotification
         withObject:@(aSender.isOn)
            onQueue:DISPATCH_GET_MAIN_QUEUE()];

   if ([SettingProvider isHaptics]) {
      
      [UISelectionFeedbackGenerator selectionChanged];

   } /* End if () */
      
   __CATCH(nErr);
   
   return;
}

@end
