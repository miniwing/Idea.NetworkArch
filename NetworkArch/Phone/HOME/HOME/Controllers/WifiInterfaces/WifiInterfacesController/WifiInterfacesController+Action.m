//
//  WifiInterfacesController+Action.m
//  Pods
//
//  Created by Harry on 2022/11/1.
//

#import "WifiInterfacesController+Inner.h"
#import "WifiInterfacesController+Action.h"
#import "WifiInterfacesController+Signal.h"
#import "WifiInterfacesController+Notification.h"
#import "WifiInterfacesController+Theme.h"
#import "WifiInterfacesController+Debug.h"

#pragma mark - IBAction
@implementation WifiInterfacesController (Action)

- (IBAction)onBack:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [self.navigationController popViewControllerAnimated:YES
                                             completion:nil];

   __CATCH(nErr);
   
   return;
}

@end
