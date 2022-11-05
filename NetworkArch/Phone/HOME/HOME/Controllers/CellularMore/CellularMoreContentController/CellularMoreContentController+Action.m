//
//  CellularMoreContentController+Action.m
//  Pods
//
//  Created by Harry on 2022/11/1.
//

#import "CellularMoreContentController+Action.h"
#import "CellularMoreContentController+Inner.h"
#import "CellularMoreContentController+Signal.h"
#import "CellularMoreContentController+Notification.h"
#import "CellularMoreContentController+Theme.h"
#import "CellularMoreContentController+Debug.h"

#pragma mark - IBAction
@implementation CellularMoreContentController (Action)

- (IBAction)onWarning:(id)aSender {

   int                            nErr                                     = EFAULT;

   __TRY;

   __CATCH(nErr);

   return;
}

@end
