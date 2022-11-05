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
      
      self.preferredContentSize  = CGSizeMake(0, self.minimumContentSize.height * TodayWidgetSectionNumber);
      
      self.contentController.preferredContentSize  = self.preferredContentSize;
      
   } /* End if () */
   else if (NCWidgetDisplayModeCompact == aActiveDisplayMode) {
      
      self.minimumContentSize    = aMaxSize;
      self.preferredContentSize  = aMaxSize; // CGSizeMake(0, [TodayViewCell CELL_H]);

      self.contentController.preferredContentSize  = self.preferredContentSize;

   } /* End else if () */
   
   [UIView transitionWithView:self.contentController.tableView
                     duration:[UIView animationDefaultDuration]
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      
      [self.contentController.tableView reloadData];
   }
                   completion:^(BOOL finished) {
      
   }];
   
   __CATCH(nErr);
   
   return;
}

//- (NCWidgetDisplayMode)widgetActiveDisplayMode {
//
//   LogDebug((@"-[TodayWidgetController widgetActiveDisplayMode]"));
//
//   return NCWidgetDisplayModeCompact;
//}

@end

#pragma mark - <CLLocationManagerDelegate>
@implementation TodayWidgetController (CLLocationManagerDelegate)

- (void)locationManager:(CLLocationManager *)aManager didChangeAuthorizationStatus:(CLAuthorizationStatus)aStatus {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
      
   [self sendSignal:TodayWidgetContentController.loadWifiInfoSignal];
   
//   [self sendSignal:TodayWidgetContentController.loadCellularInfoSignal];
   
   __CATCH(nErr);
   
   return;
}
@end

