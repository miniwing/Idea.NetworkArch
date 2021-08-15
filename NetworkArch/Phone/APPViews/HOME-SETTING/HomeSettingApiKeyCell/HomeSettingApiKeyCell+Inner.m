//
//  HomeSettingApiKeyCell+Inner.m
//  NetworkArch
//
//  Created by Harry on 2021/8/15.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "HomeSettingApiKeyCell.h"
#import "HomeSettingApiKeyCell+Inner.h"
#import "HomeSettingApiKeyCell+Signal.h"
#import "HomeSettingApiKeyCell+Notification.h"

@implementation HomeSettingApiKeyCell (Inner)

@end

#pragma mark - <UITextFieldDelegate>
@implementation HomeSettingApiKeyCell (UITextFieldDelegate)

- (BOOL)textFieldShouldBeginEditing:(UITextField *)aTextField {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)aTextField {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[HomeSettingApiKeyCell textFieldDidBeginEditing:] : Text : %@", aTextField.text));

   if (nil != self.textChangeBlock) {
      
      self.textChangeBlock(self.indexPath, aTextField.text);
      
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
   
   __CATCH(nErr);
   
   return bShouldReturn;
}

- (void)textFieldTextDidChange:(NSNotification *)aSender {
   
   int                            nErr                                     = EFAULT;
   
   UITextField                   *stTextField                              = nil;
   
   __TRY;
   
   LogDebug((@"-[HomeSettingApiKeyCell textFieldTextDidChange:] : NSNotification : %@", aSender.object));

   stTextField = aSender.object;
   
   if (nil != self.textChangeBlock) {
      
      self.textChangeBlock(self.indexPath, stTextField.text);
      
   } /* End if () */

   __CATCH(nErr);
   
   return;
}

@end
