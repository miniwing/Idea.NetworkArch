//
//  PortScanController+Notification.m
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "PortScanController+Inner.h"
#import "PortScanController+Action.h"
#import "PortScanController+Signal.h"
#import "PortScanController+Notification.h"
#import "PortScanController+Theme.h"
#import "PortScanController+Debug.h"

@implementation PortScanController (Notification)

#if __Debug__
@def_notification(self);
#endif /* __Debug__ */

@end

#pragma mark - handleNotification
@implementation PortScanController (handleNotification)

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
