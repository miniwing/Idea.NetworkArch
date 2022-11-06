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

#import <APPDATA/APPDATA.h>
#import <APPDATA/NetworkArch.h>

#import "DNSController+Action.h"
#import "DNSController+Inner.h"
#import "DNSController+Signal.h"
#import "DNSController+Notification.h"
#import "DNSController+Theme.h"
#import "DNSController+Debug.h"

#import "DNSContentController+Inner.h"
#import "DNSContentController+Signal.h"
#import "DNSContentController+Notification.h"

@implementation DNSController (Inner)

@end

#pragma mark - UIStoryboard
@implementation DNSController (UIStoryboard)

+ (NSString *)storyboard {
   
   return @"UTILITIES";
}

+ (NSString *)bundle {

   return @(BUNDLE);
}

@end

#pragma mark - UITextFieldDelegate
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

   __block UIUserInterfaceStyle   eUserInterfaceStyle                      = UIUserInterfaceStyleLight;

   __TRY;
   
   if (kStringIsBlank(aTextField.text)) {
      
      bShouldReturn  = NO;

      break;
      
   } /* End if () */

//   szApiKey = [NetworkArch apiKey];
   LogDebug((@"-[DNSController textFieldShouldReturn:] : ApiKey : %@", szApiKey));

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
            
            [self.activityIndicator setHidden:YES animated:YES];
            [self.activityIndicator stopAnimating];
            
            if ([[aAction title] isEqualToString:__LOCALIZED_STRING(self.class, @"OK")]) {
               
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
            [self.contentController postSignal:DNSContentController.startSignal
                                    withObject:self.textField.text
                                       onQueue:DISPATCH_GET_MAIN_QUEUE()];
         }];

      } /* End else */
   }];
   
   [self resignFirstResponder];

   [CATransaction commit];

   __CATCH(nErr);
   
   return bShouldReturn;
}

@end

#pragma mark - IDEA_MAIN
IDEA_MAIN() {
   
   LogDebug((@"DNSController::IDEA_MAIN"));
   
   [IDEAUIRouter registerURLPattern:@"DNS/create"
                          toHandler:^(NSString *aURL, NSDictionary *aRouter, IDEAUIRouterCompletion aCompletion) {
      
      LogDebug((@"DNSController::IDEA_MAIN : URL      : %@", aURL));
      LogDebug((@"DNSController::IDEA_MAIN : Router   : %@", aRouter));
      
      DNSController  *stController  = [UIStoryboard loadStoryboard:DNSController.storyboard
                                                    viewController:DNSController.class
                                                          inBundle:DNSController.bundle];
      
      if (nil != aCompletion) {
         
         aCompletion(aURL, nil, stController);
         
      } /* End if () */
   }];
   
   return;
}
