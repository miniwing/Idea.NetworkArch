//
//  WhoisController+Notification.m
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

@implementation WhoisController (Notification)

#if __Debug__
@def_notification(self);
#endif /* __Debug__ */

- (void)textFieldTextDidChange:(NSNotification *)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[WhoisController textFieldTextDidChange:] : Text : %@", self.textField.text));
   
   if (!kStringIsEmpty(self.textField.text)) {
      
      [self.rightBarButton setEnabled:YES];
      
   } /* End if () */
   else {
      
      [self.rightBarButton setEnabled:NO];
      
   } /* End else */
   
   __CATCH(nErr);
   
   return;
}

@end
