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

         [self.iconImageViews[MonitorSectionBattery] setImage:__IMAGE_NAMED(@"battery.100-bolt", self.class)];

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

#if TARGET_IPHONE_SIMULATOR
   [self.batteryStateLabel setText:[NSString stringWithFormat:@"%d%%", 100]];
   [self.batteryProgressView setProgress:1 animated:NO];
#endif /* TARGET_IPHONE_SIMULATOR */

   __CATCH(nErr);

   return;
}

- (void)updateDrive {
   
   int                            nErr                                     = EFAULT;
   
   CGFloat                        fProgress                                = 0.0f;
   
   __TRY;

   LogDebug((@"-[MonitorContentController updateDrive]"));

   [self.driveFreeLabel setText:[NSString stringWithFormat:@"%@%@", __LOCALIZED_STRING(self.class, @"Free: "), [IDEAFileUtils formatFileSize:SERVICE(IMonitorService).diskSpaceFree]]];
   [self.driveUsedLabel setText:[NSString stringWithFormat:@"%@%@", __LOCALIZED_STRING(self.class, @"Used: "), [IDEAFileUtils formatFileSize:SERVICE(IMonitorService).diskSpaceUsed]]];
   [self.driveTotalLabel setText:[NSString stringWithFormat:@"%@%@", __LOCALIZED_STRING(self.class, @"Total: "), [IDEAFileUtils formatFileSize:SERVICE(IMonitorService).diskSpace]]];

   fProgress   = SERVICE(IMonitorService).diskSpaceUsed / (SERVICE(IMonitorService).diskSpace * 1.0f);
   
   [self.driveProgressView setProgress:fProgress];
   
   /**
    * 使用超过70%，要标红。
    */
   if (0.7 < fProgress) {
      
      [self.driveProgressView setProgressTintColor:UIColorX.systemRedColor];

   } /* End if () */
   else {
      
      [self.driveProgressView setProgressTintColor:UIColorX.systemYellowColor];

   } /* End else */
   
   __CATCH(nErr);

   return;
}

- (void)updateMemory {
   
   int                            nErr                                     = EFAULT;
   
   CGFloat                        fProgress                                = 0.0f;
   
   __TRY;

   LogDebug((@"-[MonitorContentController updateMemory]"));

   [self.memoryFreeLabel setText:[NSString stringWithFormat:@"%@%@", __LOCALIZED_STRING(self.class, @"Free: "), [IDEAFileUtils formatFileSize:SERVICE(IMonitorService).memoryFree]]];
   [self.memoryUsedLabel setText:[NSString stringWithFormat:@"%@%@", __LOCALIZED_STRING(self.class, @"Used: "), [IDEAFileUtils formatFileSize:SERVICE(IMonitorService).memoryUsed]]];
   [self.memoryTotalLabel setText:[NSString stringWithFormat:@"%@%@", __LOCALIZED_STRING(self.class, @"Total: "), [IDEAFileUtils formatFileSize:SERVICE(IMonitorService).memoryTotal]]];

   fProgress   = SERVICE(IMonitorService).memoryUsed / (SERVICE(IMonitorService).memoryTotal * 1.0f);
   
   [self.memoryProgressView setProgress:fProgress];
   
   /**
    * 使用超过70%，要标红。
    */
   if (0.7 < fProgress) {
      
      [self.memoryProgressView setProgressTintColor:UIColorX.systemRedColor];

   } /* End if () */
   else {
      
      [self.memoryProgressView setProgressTintColor:UIColorX.systemYellowColor];

   } /* End else */
   
   __CATCH(nErr);

   return;
}

- (void)updateCPU {
   
   int                            nErr                                     = EFAULT;
   
   CGFloat                        fProgress                                = 0.0f;
   
   __TRY;

//   LogDebug((@"-[MonitorContentController updateCPU]"));
//
//   LogDebug((@"-[MonitorContentController updateCPU] : MaxFrequency : %lluMHz", [UIDevice currentDevice].cpuMaxFrequency / 1024 / 1024));
//   LogDebug((@"-[MonitorContentController updateCPU] : MinFrequency : %lluMHz", [UIDevice currentDevice].cpuMinFrequency / 1024 / 1024));

   [self.cpuCountLabel setText:[NSString stringWithFormat:@"%@%d%", __LOCALIZED_STRING(self.class, @"Core: "), SERVICE(IMonitorService).cpuCoreCount]];
   
//   LogDebug((@"-[MonitorContentController updateCPU] : AppUsage    : %.2f",   SERVICE(IMonitorService).cpuAppUsage));
//   LogDebug((@"-[MonitorContentController updateCPU] : AppUsage    : %.2f%%", SERVICE(IMonitorService).cpuAppUsage * 100));
//   LogDebug((@"-[MonitorContentController updateCPU] : SystemUsage : %.2f",   SERVICE(IMonitorService).cpuSystemUsage));
//   LogDebug((@"-[MonitorContentController updateCPU] : SystemUsage : %.2f%%", SERVICE(IMonitorService).cpuSystemUsage));
   
   if (0 >= SERVICE(IMonitorService).cpuCoreCount) {

      LogError((@"-[MonitorContentController updateCPU] : CpuCoreCount : %d", SERVICE(IMonitorService).cpuCoreCount));

      nErr  = EFAULT;
      
      break;
      
   } /* End if () */
   
   [self.cpuUsageLabel setText:[NSString stringWithFormat:@"%@%.2f%%", __LOCALIZED_STRING(self.class, @"System: "), SERVICE(IMonitorService).cpuSystemUsage * 100]];
   [self.cpuAppUsageLabel setText:[NSString stringWithFormat:@"%@%.2f%%", __LOCALIZED_STRING(self.class, @"App: "), SERVICE(IMonitorService).cpuAppUsage * 100]];
   
   __CATCH(nErr);

   return;
}

- (void)updateNetwork {
   
   int                            nErr                                     = EFAULT;

   NSString                      *szNetwork                                = nil;
   
   NSString                      *szIcon                                   = nil;

   CTTelephonyNetworkInfo        *stTelephonyNetworkInfo                   = nil;
   
   NSDictionary<NSString *, CTCarrier *>  *stCarriers                      = nil;
   CTCarrier                     *stCarrier                                = nil;
   NSString                      *szCarrierName                            = nil;

   __TRY;

   LogDebug((@"-[MonitorContentController updateNetwork]"));

   if ([IDEARouter isWifiConnected]) {

      LogDebug((@"-[MonitorContentController updateNetwork] : [IDEARouter isWifiConnected]"));

      szCarrierName  = [IDEARouter getSSID];
      LogDebug((@"-[MonitorContentController updateNetwork] : SSID : %@", szCarrierName));

      szNetwork      = @"WIFI";
      szIcon         = @"wifi";

   } /* End if () */
   else {
      
      stTelephonyNetworkInfo  = [[CTTelephonyNetworkInfo alloc] init];

      stCarriers              = stTelephonyNetworkInfo.serviceSubscriberCellularProviders;
      
      LogDebug((@"-[MonitorContentController updateNetwork] : Carriers : %@", stCarriers));
      
#if __Debug__
      [stCarriers enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull aKey, CTCarrier * _Nonnull aObject, BOOL * _Nonnull aStop) {
         
         LogDebug((@"-[MonitorContentController updateNetwork] : Carrier : %@:%@", aKey, aObject));
         
         return;
      }];
#endif /* __Debug__ */
      
      stCarrier   = [stCarriers objectForKey:stCarriers.allKeys.firstObject];

      szNetwork   = @"CELLULAR";

      if ((nil == stCarrier) || (YES == kStringIsEmpty(stCarrier.carrierName))) {
         
         szCarrierName  = __LOCALIZED_STRING(self.class, @"No service");
         szIcon         = @"antenna.radiowaves.left.and.right.slash";
         
      } /* End if () */
      else {
         
         szCarrierName  = stCarrier.carrierName;
         szIcon         = @"antenna.radiowaves.left.and.right";
         
      } /* End else */

      LogDebug((@"-[MonitorContentController updateNetwork] : CarrierName : %@", szCarrierName));

   } /* End if () */

   [self.iconImageViews[MonitorSectionNetwork] setImage:[ImageProvider imageNamed:szIcon]];
   [self.networkNameLabel setText:__LOCALIZED_STRING(self.class, szNetwork)];
   [self.networkStateLabel setText:szCarrierName];
   
   [self.networkUpLabel setText:[NSString stringWithFormat:@"%@B /s", [IDEAFileUtils formatFileSize:SERVICE(IMonitorService).uploadSpeed]]];
   [self.networkDownLabel setText:[NSString stringWithFormat:@"%@B /s", [IDEAFileUtils formatFileSize:SERVICE(IMonitorService).downloadSpeed]]];

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
