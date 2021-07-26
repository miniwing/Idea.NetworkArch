//
//  FleetingWidgetController+Inner.m
//  FleetingWidget
//
//  Created by Harry on 2021/7/26.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "FleetingWidgetController+Inner.h"

@implementation FleetingWidgetController (Inner)

@end

#pragma mark - <NCWidgetProviding>
@implementation FleetingWidgetController (NCWidgetProviding)

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
   
   int                            nErr                                     = EFAULT;

   __TRY;

   // Perform any setup necessary in order to update the view.
   
   // If an error is encountered, use NCUpdateResultFailed
   // If there's no update required, use NCUpdateResultNoData
   // If there's an update, use NCUpdateResultNewData
   
   completionHandler(NCUpdateResultNewData);
   
   __CATCH(nErr);
   
   return;
}

- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)aActiveDisplayMode withMaximumSize:(CGSize)aMaxSize {
   int                            nErr                                     = EFAULT;
      
   __TRY;
   
   if (NCWidgetDisplayModeExpanded == aActiveDisplayMode) {
      
      self.preferredContentSize  = CGSizeMake(0, 200);
      
   } /* End if () */
   else if (NCWidgetDisplayModeCompact == aActiveDisplayMode) {
      
      self.preferredContentSize  = aMaxSize; // CGSizeMake(0, [TodayViewCell CELL_H]);
      
   } /* End else if () */
   
   __CATCH(nErr);
   
   return;
}

@end
