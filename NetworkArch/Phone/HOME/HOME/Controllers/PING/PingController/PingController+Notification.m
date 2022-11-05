//
//  PingController+Notification.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "PingController+Inner.h"
#import "PingController+Action.h"
#import "PingController+Signal.h"
#import "PingController+Notification.h"
#import "PingController+Theme.h"
#import "PingController+Debug.h"

@implementation PingController (Notification)

#if __Debug__
@def_notification(self);
#endif /* __Debug__ */

- (void)textFieldTextDidChange:(NSNotification *)aSender {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;
   
   LogDebug((@"-[PingController textFieldTextDidChange:] : Text : %@", self.textField.text));
   
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
