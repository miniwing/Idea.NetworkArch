//
//  FleetingWidgetController+Theme.m
//  FleetingWidget
//
//  Created by Harry on 2021/7/26.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "FleetingWidgetController+Inner.h"
#import "FleetingWidgetController+Theme.h"

@implementation FleetingWidgetController (Theme)

- (void)traitCollectionDidChange:(UITraitCollection *)aPreviousTraitCollection {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   if (@available(iOS 13.0, *)) {
      
      if (UIUserInterfaceStyleDark == self.traitCollection.userInterfaceStyle) {

         self.titleLabel.textColor     = UIColor.whiteColor;
         self.progressLabel.textColor  = UIColor.whiteColor;
         self.copyrightLabel.textColor = UIColor.whiteColor;

      } /* End if () */
      else {

         self.titleLabel.textColor     = UIColor.blackColor;
         self.progressLabel.textColor  = UIColor.blackColor;
         self.copyrightLabel.textColor = UIColor.blackColor;

      } /* End else */

   } /* End if () */
   else {
      
      self.titleLabel.textColor     = UIColor.blackColor;
      self.progressLabel.textColor  = UIColor.blackColor;
      self.copyrightLabel.textColor = UIColor.blackColor;

   } /* End else */

   __CATCH(nErr);
   
   return;
}

@end
