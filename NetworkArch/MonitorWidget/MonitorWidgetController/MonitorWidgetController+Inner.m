//
//  MonitorWidgetController+Inner.m
//  MonitorWidget
//
//  Created by Harry on 2022/11/23.
//  Copyright © 2022 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "MonitorWidgetController+Inner.h"
#import "MonitorWidgetController+Action.h"
#import "MonitorWidgetController+Signal.h"
#import "MonitorWidgetController+Notification.h"
#import "MonitorWidgetController+Theme.h"
#import "MonitorWidgetController+Debug.h"

@implementation MonitorWidgetController (Inner)

@end

#pragma mark - UIStoryboard
@implementation MonitorWidgetController (UIStoryboard)

+ (NSString *)storyboard {

   return @"MONITOR";
}

+ (NSString *)bundle {
   
   return @"MonitorWidget";
}

@end

#pragma mark - <NCWidgetProviding>
@implementation MonitorWidgetController (NCWidgetProviding)

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

//- (NCWidgetDisplayMode)widgetActiveDisplayMode {
//
//   LogDebug((@"-[MonitorWidgetController widgetActiveDisplayMode]"));
//
//   return NCWidgetDisplayModeCompact;
//}

@end
