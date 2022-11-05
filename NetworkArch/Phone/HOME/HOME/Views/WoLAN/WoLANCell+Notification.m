//
//  WoLANCell+Notification.m
//  NetworkArch
//
//  Created by Harry on 2021/8/13.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WoLANCell+Notification.h"

@implementation WoLANCell (Notification)

#if __Debug__
@def_notification(self);
#endif /* __Debug__ */

- (void)textFieldTextDidChange:(NSNotification *)aSender {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;
   
   LogDebug((@"-[WoLANCell textFieldTextDidChange:] : NSNotification : %@", aSender.object));
   
   if (nil != self.textChangeBlock) {
      
      self.textChangeBlock(self.indexPath, self);
      
   } /* End if () */

   __CATCH(nErr);
   
   return;
}

@end
