//
//  TodayWidgetController+Theme.m
//  TodayWidget
//
//  Created by Harry on 2021/7/24.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "TodayWidgetController+Theme.h"

@implementation TodayWidgetController (Theme)

- (void)traitCollectionDidChange:(UITraitCollection *)aPreviousTraitCollection {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   if (@available(iOS 13, *)) {
      
      if (UIUserInterfaceStyleDark == self.traitCollection.userInterfaceStyle) {
         
         [[DKNightVersionManager sharedManager] nightFalling];
         
      } /* End if () */
      else {
         
         [[DKNightVersionManager sharedManager] dawnComing];
         
      } /* End else */

   } /* End if () */
   
   __CATCH(nErr);
   
   return;
}

@end
