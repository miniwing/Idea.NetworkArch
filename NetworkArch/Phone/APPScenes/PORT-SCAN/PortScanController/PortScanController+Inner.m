//
//  PortScanController+Inner.m
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "PortScanController+Inner.h"
#import "PortScanController+Signal.h"
#import "PortScanController+Notification.h"

@implementation PortScanController (Inner)

@end

#pragma mark - <UITextFieldDelegate>
@implementation PortScanController (UITextFieldDelegate)

- (BOOL)textFieldShouldBeginEditing:(UITextField *)aTextField {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)aTextField {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[PortScanController textFieldDidBeginEditing:] : Text : %@", aTextField.text));

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
   
   if (!kStringIsEmpty(aTextField.text)) {
      
      bShouldReturn  = YES;
      
      [self postSignal:PortScanController.startScanSignal
            withObject:aTextField.text
               onQueue:dispatch_get_main_queue()];

   } /* End if () */
   else {
      
      bShouldReturn  = NO;
      
   } /* End else */

   __CATCH(nErr);
   
   return bShouldReturn;
}

- (void)textFieldTextDidChange:(NSNotification *)aSender {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;
   
   LogDebug((@"-[PortScanController textFieldTextDidChange:] : Text : %@", self.textField.text));
   
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
