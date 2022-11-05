//
//  WhoisController+Action.m
//  HOME
//
//  Created by Harry on 2022/11/4.
//

#import "WhoisController+Inner.h"
#import "WhoisController+Action.h"
#import "WhoisController+Signal.h"
#import "WhoisController+Notification.h"
#import "WhoisController+Theme.h"
#import "WhoisController+Debug.h"

#pragma mark - IBAction
@implementation WhoisController (Action)

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
   
   [self.textField setEnabled:NO];
   [self.rightBarButtonItem setEnabled:NO];
   [self.activityIndicator startAnimating];
   
   [self.textView setText:@""];

   @weakify(self);
   [self.activityIndicator setHidden:NO
                            animated:YES
                            complete:^{
      
      @strongify(self);
      [self postSignal:WhoisController.startSignal
               onQueue:dispatch_get_main_queue()];
   }];
      
   __CATCH(nErr);
   
   return;
}

@end

