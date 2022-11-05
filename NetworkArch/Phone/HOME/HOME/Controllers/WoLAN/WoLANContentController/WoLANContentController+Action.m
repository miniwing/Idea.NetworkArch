//
//  WoLANContentController+Action.m
//  Pods
//
//  Created by Harry on 2022/11/3.
//

#import "WoLANContentController+Inner.h"
#import "WoLANContentController+Action.h"
#import "WoLANContentController+Signal.h"
#import "WoLANContentController+Notification.h"
#import "WoLANContentController+Theme.h"
#import "WoLANContentController+Debug.h"

#pragma mark - IBAction
@implementation WoLANContentController (IBACTION)

#if __Debug__
- (IBAction)onAction:(id)aSender {

   int                            nErr                                     = EFAULT;

   __TRY;

   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

@end
