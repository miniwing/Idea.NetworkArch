//
//  MonitorController+Action.m
//  PRIVACY
//
//  Created by Harry on 2022/10/15.
//

#import "MonitorController+Inner.h"
#import "MonitorController+Action.h"
#import "MonitorController+Notification.h"
#import "MonitorController+Theme.h"

#pragma mark - IBAction
@implementation MonitorController (Action)

- (IBAction)onSetting:(id)aSender {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;
   
   [IDEAUIRouter openURL:@"UISETTING/create"
              completion:^(NSString *aURL, NSError *aError, UIViewController *aViewController) {
      
      if (nil != aViewController) {
         
         LogDebug((@"-[MonitorController onSetting] : %@ : %@", aURL, aViewController));
                  
         [self.navigationController pushViewController:aViewController animated:YES];

      } /* End if () */

      return;
   }];
   
   __CATCH(nErr);
   
   return;
}

@end
