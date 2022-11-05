//
//  WoLANController+Action.m
//  Pods
//
//  Created by Harry on 2022/11/3.
//

#import "WoLANController+Inner.h"
#import "WoLANController+Action.h"
#import "WoLANController+Signal.h"
#import "WoLANController+Notification.h"
#import "WoLANController+Theme.h"
#import "WoLANController+Debug.h"

#import "WoLANContentController+Inner.h"
#import "WoLANContentController+Action.h"
#import "WoLANContentController+Signal.h"
#import "WoLANContentController+Notification.h"
#import "WoLANContentController+Theme.h"
#import "WoLANContentController+Debug.h"

#pragma mark - IBAction
@implementation WoLANController (Action)

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
      
   [self resignFirstResponder];
   
//   [self postSignal:WoLANController.startSignal
//            onQueue:dispatch_get_main_queue()];

   [self.contentView setUserInteractionEnabled:NO];
   
   [self sendSignal:WoLANContentController.startSignal];
   
   __CATCH(nErr);
   
   return;
}

@end

