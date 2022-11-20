//
//  PingController+Action.m
//  HOME
//
//  Created by Harry on 2022/11/3.
//

#import "PingController+Inner.h"
#import "PingController+Action.h"
#import "PingController+Signal.h"
#import "PingController+Notification.h"
#import "PingController+Theme.h"
#import "PingController+Debug.h"

#pragma mark - IBAction
@implementation PingController (Action)

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
   
   __CATCH(nErr);
   
   return;
}

- (IBAction)onStart:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   //   [self resignFirstResponder];
   //
   //   LogDebug((@"-[PingController onStart:] : aSender : %@", aSender));
   //
   //   // 按钮状态变更。
   //   if (nil == self.pingClient) {
   //
   //      [self.rightBarButtonItem setImage:[UIImage imageNamed:@"UIButtonBarStop"]];
   //      [self.rightBarButtonItem setTintColorPicker:DKColorPickerWithKey([IDEAColor systemRed])];
   //
   //      self.pingClient   = [IDEAPingClient pingWithHostName:self.textField.text
   //                                                    result:^(NSTimeInterval aTime, NSError * _Nonnull aError) {
   //
   //         LogDebug((@"-[PingController onStart:] : ping : Error : %@", aError));
   //         LogDebug((@"-[PingController onStart:] : ping : Time  : %ld", aTime));
   //      }];
   //
   //   } /* End if () */
   //   else {
   //
   //      [self.rightBarButtonItem setImage:[UIImage imageNamed:@"UIButtonBarPlay"]];
   //      [self.rightBarButtonItem setTintColorPicker:DKColorPickerWithKey([IDEAColor systemGreen])];
   //
   //      if (nil != self.pingClient) {
   //
   //         [self.pingClient stopPing];
   //         __RELEASE(_pingClient);
   //
   //      } /* End if () */
   //
   //   } /* End else */
   
   [self postSignal:PingController.startPingSignal
            onQueue:DISPATCH_GET_MAIN_QUEUE()];
   
   __CATCH(nErr);
   
   return;
}

@end

