//
//  WhoisController+Inner.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WhoisController+Inner.h"
#import "WhoisController+Action.h"
#import "WhoisController+Signal.h"
#import "WhoisController+Notification.h"
#import "WhoisController+Theme.h"
#import "WhoisController+Debug.h"

@implementation WhoisController (Inner)

@end

#pragma mark - UIStoryboard
@implementation WhoisController (UIStoryboard)

+ (NSString *)storyboard {
   
   return @"UTILITIES";
}

+ (NSString *)bundle {

   return @(BUNDLE);
}

@end


#pragma mark - UITextFieldDelegate
@implementation WhoisController (UITextFieldDelegate)

- (BOOL)textFieldShouldBeginEditing:(UITextField *)aTextField {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)aTextField {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[WhoisController textFieldDidBeginEditing:] : Text : %@", aTextField.text));

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
   
   __TRY;
   
   if (NO == kStringIsBlank(aTextField.text)) {
      
      bShouldReturn  = YES;
      
      [self.textField setEnabled:NO];
      [self.rightBarButtonItem setEnabled:NO];
      [self.activityIndicator startAnimating];
      
      [self.textView setText:@""];

      @weakify(self);
      [self.activityIndicator setHidden:NO
                               animated:YES
                               complete:^{
         
         @strongify(self);
         [self postSignal:WhoisController.startSignal
                  onQueue:DISPATCH_GET_MAIN_QUEUE()];
      }];

   } /* End if () */
   else {
      
      bShouldReturn  = NO;
      
   } /* End else */

   __CATCH(nErr);
   
   return bShouldReturn;
}

@end

#pragma mark - IDEA_MAIN
IDEA_MAIN() {
   
   LogDebug((@"WhoisController::IDEA_MAIN"));
   
   [IDEAUIRouter registerURLPattern:@"Whois/create"
                          toHandler:^(NSString *aURL, NSDictionary *aRouter, IDEAUIRouterCompletion aCompletion) {
      
      LogDebug((@"WhoisController::IDEA_MAIN : URL      : %@", aURL));
      LogDebug((@"WhoisController::IDEA_MAIN : Router   : %@", aRouter));
      
      WhoisController   *stController  = [UIStoryboard loadStoryboard:WhoisController.storyboard
                                                       viewController:WhoisController.class
                                                             inBundle:WhoisController.bundle];
      
      if (nil != aCompletion) {
         
         aCompletion(aURL, nil, stController);
         
      } /* End if () */
   }];
   
   return;
}
