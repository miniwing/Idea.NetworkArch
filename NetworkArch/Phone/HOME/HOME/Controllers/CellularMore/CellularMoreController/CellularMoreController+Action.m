//
//  CellularMoreController+Action.m
//  Pods
//
//  Created by Harry on 2022/11/1.
//

#import "CellularMoreController+Inner.h"
#import "CellularMoreController+Action.h"
#import "CellularMoreController+Signal.h"
#import "CellularMoreController+Notification.h"
#import "CellularMoreController+Theme.h"
#import "CellularMoreController+Debug.h"

#pragma mark - IBAction
@implementation CellularMoreController (Action)

- (IBAction)onBack:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [self.navigationController popViewControllerAnimated:YES
                                             completion:nil];

   __CATCH(nErr);
   
   return;
}

@end
