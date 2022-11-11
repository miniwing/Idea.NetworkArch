//
//  PrivacyController+Action.m
//  PRIVACY
//
//  Created by Harry on 2022/10/15.
//

#import "PrivacyController+Inner.h"
#import "PrivacyController+Action.h"
#import "PrivacyController+Notification.h"
#import "PrivacyController+Theme.h"

#pragma mark - IBAction
@implementation PrivacyController (Action)

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (IBAction)onContinue:(UIButton *)aButton {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   @weakify(self);
   [self dismissViewControllerAnimated:YES
                            completion:^{
      
      LogDebug((@"-[PrivacyController onContinue:] : dismissCompletion"));

//      [SettingProvider setPrivacy:!__Debug__];
      [SettingProvider setPrivacy:YES];

      LogDebug((@"-[PrivacyController onContinue:] : isTracking : %d", [SettingProvider isTracking]));

      if (![SettingProvider isTracking]) {
         
         @strongify(self);
         UI_PERFORM_SELECTOR(self, @selector(openTracking), nil, NO);

      } /* End if () */
   }];
   
   __CATCH(nErr);
   
   return;
}

@end
