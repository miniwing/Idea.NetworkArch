//
//  DNSController+Inner.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "APPDelegate+APP.h"
#import "APPDelegate+Kit.h"

#import "HomeController+Signal.h"
#import "HomeController+Notification.h"

#import "DNSController+Inner.h"
#import "DNSController+Signal.h"
#import "DNSController+Notification.h"

#import "DNSContentController+Inner.h"
#import "DNSContentController+Signal.h"
#import "DNSContentController+Notification.h"

@implementation DNSController (Inner)

@end

#pragma mark - <UITextFieldDelegate>
@implementation DNSController (UITextFieldDelegate)

- (BOOL)textFieldShouldBeginEditing:(UITextField *)aTextField {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)aTextField {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[DNSController textFieldDidBeginEditing:] : Text : %@", aTextField.text));

   if (!kStringIsEmpty(aTextField.text)) {
      
      [self.rightBarButtonItem setEnabled:YES];
      
   } /* End if () */
   else {
      
      [self.rightBarButtonItem setEnabled:NO];
      
   } /* End else */

   __CATCH(nErr);
   
   return;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)aTextField {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)aTextField {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

- (void)textFieldDidEndEditing:(UITextField *)aTextField reason:(UITextFieldDidEndEditingReason)aReason {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

- (BOOL)textField:(UITextField *)aTextField shouldChangeCharactersInRange:(NSRange)aRange replacementString:(NSString *)aString {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return YES;
}

- (void)textFieldDidChangeSelection:(UITextField *)aTextField {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

- (BOOL)textFieldShouldClear:(UITextField *)aTextField {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)aTextField {
   
   int                            nErr                                     = EFAULT;
   
   BOOL                           bShouldReturn                            = NO;
   
   __block NSString              *szApiKey                                 = nil;
   
   __TRY;
   
   if (kStringIsBlank(aTextField.text)) {
      
      bShouldReturn  = NO;

      break;
      
   } /* End if () */

   szApiKey = [APPDelegate apiKey];
   LogDebug((@"-[DNSController textFieldShouldReturn:] : ApiKey : %@", szApiKey));

   [CATransaction begin];
   [self resignFirstResponder];
   [CATransaction commit];

   [CATransaction setCompletionBlock:^{
      
      if (kStringIsBlank(szApiKey)) {
         
         [UIAlertController showActionSheetInViewController:self
                                                  withTitle:APP_STR(@"API Key Empty")
                                                    message:APP_STR(@"PRESS OK TO GET (FREE).")
                                          cancelButtonTitle:APP_STR(@"Cancel")
                                     destructiveButtonTitle:APP_STR(@"OK")
                                          otherButtonTitles:nil
                         popoverPresentationControllerBlock:^(UIPopoverPresentationController *aPopover) {
            
         }
                                                   tapBlock:^(UIAlertController *aController, UIAlertAction *aAction, NSInteger aButtonIndex) {
            
            [self.activityIndicator setHidden:YES animated:YES];
            [self.activityIndicator stopAnimating];
            
            if ([[aAction title] isEqualToString:APP_STR(@"OK")]) {
               
               [self postNotify:HomeController.settingNotification
                        onQueue:dispatch_get_main_queue()];

            } /* End if () */
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
   
   __CATCH(nErr);
   
   return bShouldReturn;
}

- (void)textFieldTextDidChange:(NSNotification *)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[DNSController textFieldTextDidChange:] : Text : %@", self.textField.text));
   
   if (!kStringIsEmpty(self.textField.text)) {
      
      [self.rightBarButtonItem setEnabled:YES];
      
   } /* End if () */
   else {
      
      [self.rightBarButtonItem setEnabled:NO];
      
   } /* End else */
   
   __CATCH(nErr);
   
   return;
}

@end
