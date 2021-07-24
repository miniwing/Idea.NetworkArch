//
//  TodayWidgetController+Inner.m
//  TodayWidget
//
//  Created by Harry on 2021/7/24.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "TodayWidgetController+Inner.h"
#import "TodayWidgetContentController+Signal.h"

@implementation TodayWidgetController (Inner)

@end

#pragma mark - <NCWidgetProviding>
@implementation TodayWidgetController (NCWidgetProviding)
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
   
   [UIView animateWithDuration:UIAViewAnimationDefaultDuraton
                    animations:^{
      [self.contentController.tableView reloadData];
   }];

   __CATCH(nErr);
   
   return;
}

@end

#pragma mark - <CLLocationManagerDelegate>
@implementation TodayWidgetController (CLLocationManagerDelegate)

- (void)locationManager:(CLLocationManager *)aManager didChangeAuthorizationStatus:(CLAuthorizationStatus)aStatus {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
      
   [self sendSignal:TodayWidgetContentController.loadWifiInfoSignal];
//   [self postSignal:HomeContentController.loadCellularInfoSignal onQueue:dispatch_get_main_queue()];

   __CATCH(nErr);
   
   return;
}
@end

