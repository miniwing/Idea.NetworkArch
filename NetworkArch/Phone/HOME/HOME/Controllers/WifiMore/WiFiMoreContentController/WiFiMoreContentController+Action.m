//
//  WiFiMoreContentController+Action.m
//  HOME
//
//  Created by Harry on 2022/11/1.
//

#import "WiFiMoreContentController+Inner.h"
#import "WiFiMoreContentController+Action.h"
#import "WiFiMoreContentController+Signal.h"
#import "WiFiMoreContentController+Notification.h"
#import "WiFiMoreContentController+Theme.h"
#import "WiFiMoreContentController+Debug.h"

#import "WiFiMoreContentController+AD.h"

#pragma mark - IBAction
@implementation WiFiMoreContentController (Action)

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (IBAction)onWarning:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
      
   __CATCH(nErr);
   
   return;
}

@end
