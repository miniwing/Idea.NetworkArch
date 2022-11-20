//
//  DNSController+Action.m
//  HOME
//
//  Created by Harry on 2022/11/5.
//

#import <APPDATA/APPDATA.h>
#import <APPDATA/NetworkArch.h>

#import "DNSController+Action.h"
#import "DNSController+Inner.h"
#import "DNSController+Signal.h"
#import "DNSController+Notification.h"
#import "DNSController+Theme.h"
#import "DNSController+Debug.h"

#import "DNSContentController+Signal.h"

#pragma mark - IBAction
@implementation DNSController (Action)

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
   
   @weakify(self);
   [self.activityIndicator setHidden:NO
                            animated:YES
                            complete:^{
      
      @strongify(self);
      [self.contentController postSignal:DNSContentController.startSignal
                              withObject:self.textField.text
                                 onQueue:DISPATCH_GET_MAIN_QUEUE()];
   }];
      
   __CATCH(nErr);
   
   return;
}

@end

