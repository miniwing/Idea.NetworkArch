//
//  TracerouteController+Notification.m
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "TracerouteController+Inner.h"
#import "TracerouteController+Action.h"
#import "TracerouteController+Signal.h"
#import "TracerouteController+Notification.h"
#import "TracerouteController+Theme.h"
#import "TracerouteController+Debug.h"

@implementation TracerouteController (Notification)

#if __Debug__
@def_notification(self);
#endif /* __Debug__ */

@end

#pragma mark - handleNotification
@implementation TracerouteController (handleNotification)

- (void)textFieldTextDidChange:(NSNotification *)aSender {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;
   
   LogDebug((@"-[TracerouteController textFieldTextDidChange:] : Text : %@", self.textField.text));
   
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
