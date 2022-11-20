//
//  LanScanController+Action.m
//  HOME
//
//  Created by Harry on 2022/11/7.
//

#import "LanScanController+Inner.h"
#import "LanScanController+Action.h"
#import "LanScanController+Signal.h"
#import "LanScanController+Notification.h"
#import "LanScanController+Theme.h"
#import "LanScanController+Debug.h"

#pragma mark - IBAction
@implementation LanScanController (Action)

- (IBAction)onBack:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
#if APP_CLOSE_KEYBOARD_BEFORE_VIEW_DISAPPEAR

   [CATransaction begin];

   [CATransaction setCompletionBlock:^{

      [self.navigationController popViewControllerAnimated:YES
                                                completion:nil];
   }];

   [self resignFirstResponder];

   [CATransaction commit];

#else /* APP_CLOSE_KEYBOARD_BEFORE_VIEW_DISAPPEAR */

   [self.navigationController popViewControllerAnimated:YES
                                             completion:nil];

#endif /* !APP_CLOSE_KEYBOARD_BEFORE_VIEW_DISAPPEAR */

   [self sendSignal:LanScanController.stopScanSignal];

   __CATCH(nErr);
   
   return;
}

- (IBAction)onStart:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   if (NO == [[PNetMLanScanner shareInstance] isScanning]) {
      
      [self postSignal:LanScanController.startScanSignal
               onQueue:DISPATCH_GET_MAIN_QUEUE()];
      
   } /* End if () */
   else {
      
      [self postSignal:LanScanController.stopScanSignal
               onQueue:DISPATCH_GET_MAIN_QUEUE()];

   } /* End else */
   
   __CATCH(nErr);
   
   return;
}

@end
