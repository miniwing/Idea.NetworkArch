//
//  HomeContentController+Action.m
//  Pods
//
//  Created by Harry on 2022/10/31.
//

#import "HomeContentController+Inner.h"
#import "HomeContentController+Action.h"
#import "HomeContentController+Signal.h"
#import "HomeContentController+Notification.h"
#import "HomeContentController+Theme.h"
#import "HomeContentController+Debug.h"

#import "HomeContentController+AD.h"

#pragma mark - IBAction
@implementation HomeContentController (Action)

#if __Debug__
- (IBAction)onAction:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}
#endif /* __Debug__ */

@end
