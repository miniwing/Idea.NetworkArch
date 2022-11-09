//
//  IntroductionController+Action.m
//  INTRODUCTION
//
//  Created by Harry on 2022/11/9.
//

#import "IntroductionController+Inner.h"
#import "IntroductionController+Action.h"
#import "IntroductionController+Notification.h"
#import "IntroductionController+Theme.h"

#pragma mark - IBAction
@implementation IntroductionController (Action)

- (IBAction)onOk:(UIButton *)aButton {
   
   int                            nErr                                     = EFAULT;
   
   __block NSString              *szAPI                                    = nil;
   
   __TRY;
   
   [self dismissViewControllerAnimated:YES
                            completion:^{
      
      [self postNotify:IntroductionController.introductionDoneNotification
               onQueue:DISPATCH_GET_MAIN_QUEUE()];
      
      return;
   }];
   
   __CATCH(nErr);
   
   return;
}

@end
