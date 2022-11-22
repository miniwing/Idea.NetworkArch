//
//  MonitorContentController+Inner.m
//  MONITOR
//
//  Created by Harry on 2022/11/20.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "MonitorContentController+Inner.h"
#import "MonitorContentController+Action.h"
#import "MonitorContentController+Signal.h"
#import "MonitorContentController+Notification.h"
#import "MonitorContentController+Theme.h"
#import "MonitorContentController+Debug.h"

@implementation MonitorContentController (Inner)

- (void)updateBattery {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;

   LogDebug((@"-[MonitorContentController updateBattery] : BatterLevel : %d", (int)(SERVICE(IMonitorService).batteryLevel * 100)));

   /**
    * 省电模式
    */
   if (SERVICE(IMonitorService).batteryLowPowerModeEnabled) {

      [self.iconImageViews[MonitorSectionBattery] setTintColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {

         return UIColorX.systemYellowColor;
      }];

   } /* End if () */
   else {
      
      [self.iconImageViews[MonitorSectionBattery] setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];

   } /* End else */

   if (SERVICE(IMonitorService).batteryLevel == 1) {
      
      if (SERVICE(IMonitorService).batteryIsCharging) {

         [self.iconImageViews[MonitorSectionBattery] setImage:__IMAGE_NAMED(@"battery-100-bolt", self.class)];

      } /* End if () */
      else {
         
         [self.iconImageViews[MonitorSectionBattery] setImage:__IMAGE_NAMED(@"battery.100", self.class)];

      } /* End else */

      [self.batteryProgressView setProgressTintColor:UIColorX.systemGreenColor];

   } /* End if () */
   else if (SERVICE(IMonitorService).batteryLevel >= 0.75) {
      
      [self.iconImageViews[MonitorSectionBattery] setImage:__IMAGE_NAMED(@"battery.75", self.class)];

      [self.batteryProgressView setProgressTintColor:UIColorX.systemGreenColor];

   } /* End if () */
   else if (SERVICE(IMonitorService).batteryLevel >= 0.50) {
      
      [self.iconImageViews[MonitorSectionBattery] setImage:__IMAGE_NAMED(@"battery.50", self.class)];

      [self.batteryProgressView setProgressTintColor:UIColorX.systemGreenColor];

   } /* End if () */
   else if (SERVICE(IMonitorService).batteryLevel >= 0.25) {
      
      [self.iconImageViews[MonitorSectionBattery] setImage:__IMAGE_NAMED(@"battery.25", self.class)];

      [self.batteryProgressView setProgressTintColor:UIColorX.systemGreenColor];

   } /* End if () */
   else {
      
      [self.iconImageViews[MonitorSectionBattery] setImage:__IMAGE_NAMED(@"battery.0", self.class)];

      [self.batteryProgressView setProgressTintColor:UIColorX.systemRedColor];

   } /* End else */

   [self.batteryStateLabel setText:[NSString stringWithFormat:@"%d%%", (int)(SERVICE(IMonitorService).batteryLevel * 100)]];
   
   __CATCH(nErr);

   return;
}

- (void)updateDrive {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;

   LogDebug((@"-[MonitorContentController updateDrive]"));


   __CATCH(nErr);

   return;
}

@end

#pragma mark - UIStoryboard
@implementation MonitorContentController (UIStoryboard)

+ (NSString *)storyboard {

   return @"MONITOR";
}

+ (NSString *)bundle {
   
   return @(BUNDLE);
}

@end

#pragma mark - UITableViewDataSource
@implementation MonitorContentController (UITableViewDataSource)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
   
   return MonitorSectionNumber;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)aSection {
      
   return 1;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   UITableViewCellX              *stTableViewCell                          = nil;

   __TRY;
   
//   MonitorSectionBattery   = 0,
//   MonitorSectionNetwork,
//   MonitorSectionCPU,
//   MonitorSectionDrive,
//   MonitorSectionMemory,
//   MonitorSectionNumber

   if (MonitorSectionBattery == aIndexPath.section) {
      
      stTableViewCell   = self.batteryCell;
      
      if (@available(iOS 13, *)) {

      } /* End if () */
      else {
         
         [stTableViewCell setRectCorner:UIRectCornerAllCorners];

      } /* End else */

   } /* End if () */
   else if (MonitorSectionNetwork == aIndexPath.section) {
      
      stTableViewCell   = self.networkCell;
      
      if (@available(iOS 13, *)) {

      } /* End if () */
      else {
         
         [stTableViewCell setRectCorner:UIRectCornerAllCorners];

      } /* End else */

   } /* End else if () */
   else if (MonitorSectionCPU == aIndexPath.section) {
      
      stTableViewCell   = self.cpuCell;
      
      if (@available(iOS 13, *)) {

      } /* End if () */
      else {
         
         [stTableViewCell setRectCorner:UIRectCornerAllCorners];

      } /* End else */

   } /* End else if () */
   else if (MonitorSectionDrive == aIndexPath.section) {
      
      stTableViewCell   = self.driveCell;
      
      if (@available(iOS 13, *)) {

      } /* End if () */
      else {
         
         [stTableViewCell setRectCorner:UIRectCornerAllCorners];

      } /* End else */

   } /* End else if () */
   else if (MonitorSectionMemory == aIndexPath.section) {
      
      stTableViewCell   = self.memoryCell;
      
      if (@available(iOS 13, *)) {

      } /* End if () */
      else {
         
         [stTableViewCell setRectCorner:UIRectCornerAllCorners];

      } /* End else */

   } /* End else if () */

   __CATCH(nErr);
   
   return stTableViewCell;
}

@end

#pragma mark - UITableViewDelegate
@implementation MonitorContentController (UITableViewDelegate)

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)aSection {
   
   return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)aSection {
   
   if (MonitorSectionMemory == aSection) {
      
      return 0;
      
   } /* End if () */
   
   return 24;
}

@end
