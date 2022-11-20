//
//  PortScanController+Action.m
//  HOME
//
//  Created by Harry on 2022/11/7.
//

#import <PhoneNetSDK/PhoneNetSDK.h>

#import "PortScanController+Inner.h"
#import "PortScanController+Action.h"
#import "PortScanController+Signal.h"
#import "PortScanController+Notification.h"
#import "PortScanController+Theme.h"
#import "PortScanController+Debug.h"

#pragma mark - IBAction
@implementation PortScanController (Action)

- (IBAction)onBack:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
#if APP_CLOSE_KEYBOARD_BEFORE_VIEW_DISAPPEAR

   [CATransaction begin];

   [self resignFirstResponder];

   [CATransaction setCompletionBlock:^{

      [self.navigationController popViewControllerAnimated:YES
                                                completion:nil];
   }];

   [CATransaction commit];

#else /* APP_CLOSE_KEYBOARD_BEFORE_VIEW_DISAPPEAR */

   [self.navigationController popViewControllerAnimated:YES
                                             completion:nil];

#endif /* !APP_CLOSE_KEYBOARD_BEFORE_VIEW_DISAPPEAR */

   [self sendSignal:PortScanController.stopScanSignal];

   __CATCH(nErr);
   
   return;
}

- (IBAction)onStart:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   if (NO == [[PhoneNetManager shareInstance] isDoingPortScan]) {
      
      [self postSignal:PortScanController.startScanSignal
                 input:@{
                    @"ip"    : self.textField.text,
                    @"begin" : self.fromPortTextField.text,
                    @"end"   : self.toPortTextField.text,
                 }
               onQueue:dispatch_get_main_queue()];
      
   } /* End if () */
   else {
      
      [self postSignal:PortScanController.stopScanSignal
               onQueue:DISPATCH_GET_MAIN_QUEUE()];

   } /* End else */
   
   __CATCH(nErr);
   
   return;
}

@end
