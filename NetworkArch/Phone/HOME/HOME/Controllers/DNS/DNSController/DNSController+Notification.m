//
//  DNSController+Notification.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "DNSController+Action.h"
#import "DNSController+Inner.h"
#import "DNSController+Signal.h"
#import "DNSController+Notification.h"
#import "DNSController+Theme.h"
#import "DNSController+Debug.h"

@implementation DNSController (Notification)

#if __Debug__
@def_notification(self);
#endif /* __Debug__ */

@end

#pragma mark - handleNotification
@implementation DNSController (handleNotification)

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

handleNotification(DNSContentController, doneNotification) {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[DNSController doneNotification:] : Signal : %@", aNotification));
   LogDebug((@"-[DNSController doneNotification:] : Error  : %@", aNotification.object));
   
   if (nil != aNotification.object) {
      
      // occur some error.
      [self.contentView setHidden:YES animated:YES];

   } /* End if () */
   else {
      
      [self.contentView setHidden:NO animated:YES];
      
   } /* End else */

   @weakify(self);
   [self.activityIndicator setHidden:YES
                            animated:YES
                            complete:^{
      
      @strongify(self);
      [self.activityIndicator stopAnimating];

      if (!kStringIsEmpty(self.textField.text)) {
         
         [self.rightBarButtonItem setEnabled:YES];

      } /* End if () */

      [self.textField setEnabled:YES];

      if (nil != aNotification.object) {
         
         // occur some error.
         [self.textField becomeFirstResponder];
         
      } /* End if () */
      else {
         
      } /* End else */
   }];
   
   __CATCH(nErr);
   
   return;
}

@end
