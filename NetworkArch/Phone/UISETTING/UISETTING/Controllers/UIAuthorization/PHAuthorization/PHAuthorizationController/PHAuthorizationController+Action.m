//
//  PHAuthorizationController+Action.m
//  UISETTING
//
//  Created by Harry on 2022/6/20.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "PHAuthorizationRootController.h"
#import "PHAuthorizationController+Action.h"
#import "PHAuthorizationController+Signal.h"
#import "PHAuthorizationController+Notification.h"

@implementation PHAuthorizationController (Action)

#if __Debug__
- (IBAction)onAction:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

- (IBAction)onClose:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[PHAuthorizationController onClose:] : Sender : %@", aSender));
   LogDebug((@"-[PHAuthorizationController onClose:] : navigationController : %@", self.navigationController));
   LogDebug((@"-[PHAuthorizationController onClose:] : rt_navigationController : %@", self.rt_navigationController));
   
   [self dismissViewControllerAnimated:YES
                            completion:^{
      
   }];
   
   __CATCH(nErr);
   
   return;
}

- (IBAction)onAllow:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [self postNotify:self.allowAccessNotification
            onQueue:DISPATCH_GET_MAIN_QUEUE()
         completion:^{
      
   }];
   
   __CATCH(nErr);
   
   return;
}

@end
