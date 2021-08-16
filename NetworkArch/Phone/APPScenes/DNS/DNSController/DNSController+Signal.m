//
//  DNSController+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "DNSController+Inner.h"
#import "DNSController+Signal.h"
#import "DNSController+Notification.h"

@implementation DNSController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@def_signal(start);
@def_signal(done);

@end

#pragma mark - handleSignal
@implementation DNSController (handleSignal)

handleSignal(DNSController, startSignal) {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[DNSController startSignal:] : Signal : %@", aSignal));
   LogDebug((@"-[DNSController startSignal:] : Domain : %@", aSignal.object));
   
   __CATCH(nErr);
   
   return;
}

handleSignal(DNSController, doneSignal) {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[DNSController doneSignal:] : Signal : %@", aSignal));
   LogDebug((@"-[DNSController doneSignal:] : Error  : %@", aSignal.object));
   
   if (nil != aSignal.object) {
      
      // occur some error.
      
   } /* End if () */
   else {
      
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

      [self.textField setEnabled:NO];

      if (nil != aSignal.object) {
         
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
