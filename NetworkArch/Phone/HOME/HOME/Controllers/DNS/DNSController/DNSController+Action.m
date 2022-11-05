//
//  DNSController+Action.m
//  Pods
//
//  Created by Harry on 2022/11/5.
//

#import <APPDATA/APPDATA.h>
#import <APPDATA/NetworkArch+Storage.h>

#import "DNSController+Action.h"
#import "DNSController+Inner.h"
#import "DNSController+Signal.h"
#import "DNSController+Notification.h"
#import "DNSController+Theme.h"
#import "DNSController+Debug.h"

#pragma mark - IBAction
@implementation DNSController (Action)

- (IBAction)onBack:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
#if APP_CLOSE_KEYBOARD_BEFORE_VIEW_DISAPPEAR

   [CATransaction begin];

   [CATransaction setCompletionBlock:^{

      [self.navigationController popViewControllerAnimated:YES
                                                completion:nil];
   }];

   [self resignFirstResponder];

   [CATransaction commit];

#else /* APP_CLOSE_KEYBOARD_BEFORE_VIEW_DISAPPEAR */

   [self.navigationController popViewControllerAnimated:YES
                                             completion:nil];

#endif /* !APP_CLOSE_KEYBOARD_BEFORE_VIEW_DISAPPEAR */

   __CATCH(nErr);
   
   return;
}

- (IBAction)onStart:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __block NSString              *szApiKey                                 = nil;

   __block UIUserInterfaceStyle   eUserInterfaceStyle                      = UIUserInterfaceStyleLight;

   __TRY;
   
   if (kStringIsBlank(self.textField.text)) {
      
      nErr  = EFAULT;
      
      break;
      
   } /* End if () */
   
   szApiKey = [NetworkArch apiKey];
   LogDebug((@"-[DNSController onStart:] : ApiKey : %@", szApiKey));

   [CATransaction begin];
   
   [CATransaction setCompletionBlock:^{
   
      if (kStringIsBlank(szApiKey)) {

         if ([[DKNightVersionManager sharedManager].themeVersion isEqualToString:DKThemeVersionNight]) {

            eUserInterfaceStyle  = UIUserInterfaceStyleDark;

         } /* End if () */
         else { // if ([[DKNightVersionManager sharedManager].themeVersion isEqualToString:DKThemeVersionNormal])

            eUserInterfaceStyle  = UIUserInterfaceStyleLight;

         } /* End if () */

         [UIAlertController showActionSheetInViewController:self
                                         userInterfaceStyle:eUserInterfaceStyle
                                                  withTitle:__LOCALIZED_STRING(self.class, @"API Key Empty")
                                                    message:__LOCALIZED_STRING(self.class, @"PRESS OK TO GET (FREE).")
                                          cancelButtonTitle:__LOCALIZED_STRING(self.class, @"Cancel")
                                     destructiveButtonTitle:__LOCALIZED_STRING(self.class, @"OK")
                                          otherButtonTitles:nil
                         popoverPresentationControllerBlock:^(UIPopoverPresentationController *aPopover) {
            
         }
                                                   tapBlock:^(UIAlertController *aController, UIAlertAction *aAction, NSInteger aButtonIndex) {
            
            [self.textField setEnabled:YES];
            [self.activityIndicator setHidden:YES animated:YES];
            [self.activityIndicator stopAnimating];
            
            if ([[aAction title] isEqualToString:__LOCALIZED_STRING(self.class, @"OK")]) {
               
            } /* End if () */
            else {
               
               [self.textField becomeFirstResponder];

            } /* End else */
         }];
         
      } /* End if () */
      else {
         
         [self.textField setEnabled:NO];
         [self.rightBarButtonItem setEnabled:NO];
         [self.activityIndicator startAnimating];
         
         [self.contentView setHidden:YES animated:YES];
         
         @weakify(self);
         [self.activityIndicator setHidden:NO
                                  animated:YES
                                  complete:^{
                  
            @strongify(self);

            [self sendSignal:DNSController.startSignal withObject:self.textField.text];
         }];
      } /* End else */
      
   }];

   [self resignFirstResponder];
   
   [CATransaction commit];

   __CATCH(nErr);
   
   return;
}

@end

