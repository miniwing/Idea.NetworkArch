//
//  HomeSettingContentController+Action.m
//  HOME
//
//  Created by Harry on 2022/11/9.
//

#import "HomeSettingContentController+Inner.h"
#import "HomeSettingContentController+Action.h"
#import "HomeSettingContentController+Signal.h"
#import "HomeSettingContentController+Notification.h"
#import "HomeSettingContentController+Theme.h"
#import "HomeSettingContentController+Debug.h"

#pragma mark - IBAction
@implementation HomeSettingContentController (Action)

- (IBAction)onSave:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
//   [self sendSignal:self.saveSignal withObject:self.apiKey];

   [self notify:HomeSettingContentController.saveNotification
     withObject:self.apiKey];
   
   __CATCH(nErr);
   
   return;
}

@end
