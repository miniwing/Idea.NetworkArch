//
//  WoLANCell+Inner.m
//  NetworkArch
//
//  Created by Harry on 2021/8/13.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WoLANCell+Inner.h"

@implementation WoLANCell (Inner)

@end

#pragma mark - <UITextFieldDelegate>
@implementation WoLANCell (UITextFieldDelegate)

- (BOOL)textFieldShouldBeginEditing:(UITextField *)aTextField {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)aTextField {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[WoLANCell textFieldDidBeginEditing:] : Text : %@", aTextField.text));
   
   if ([aTextField isEqual:self.macTextField]) {
      
      [self.macTextField setReturnKeyType:UIReturnKeyNext];
      
   } /* End if () */
   else if ([aTextField isEqual:self.broadcastTextField]) {
      
      [self.broadcastTextField setReturnKeyType:UIReturnKeyNext];

   } /* End else if () */
   else {

      [self.portTextField setReturnKeyType:UIReturnKeyGo];

   } /* End else */

   if (nil != self.textChangeBlock) {
      
      self.textChangeBlock(self.indexPath, self);

   } /* End if () */

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
      
      if ([aTextField isEqual:self.macTextField]) {
         
         [self.broadcastTextField becomeFirstResponder];
         
      } /* End if () */
      else if ([aTextField isEqual:self.broadcastTextField]) {
         
         [self.portTextField becomeFirstResponder];
                  
      } /* End else if () */
      else {
         
         bShouldReturn  = YES;
         
      } /* End else */
      
   } /* End if () */
   else {
      
      bShouldReturn  = NO;
      
   } /* End else */
   
   __CATCH(nErr);
   
   return bShouldReturn;
}

@end
