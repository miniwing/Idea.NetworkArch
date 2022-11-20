//
//  UISettingController+Action.m
//  UISETTING
//
//  Created by Harry on 2022/10/18.
//

#import "UISettingController+Action.h"

@implementation UISettingController (Action)

- (IBAction)onBack:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [self.navigationController popViewControllerAnimated:YES
                                             completion:nil];

   __CATCH(nErr);
   
   return;
}

@end
