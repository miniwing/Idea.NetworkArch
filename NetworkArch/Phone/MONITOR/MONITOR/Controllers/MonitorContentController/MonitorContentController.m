//
//  MonitorContentController.m
//  MONITOR
//
//  Created by Harry on 2022/11/20.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "MonitorContentController.h"
#import "MonitorContentController+Inner.h"
#import "MonitorContentController+Action.h"
#import "MonitorContentController+Signal.h"
#import "MonitorContentController+Notification.h"
#import "MonitorContentController+Theme.h"
#import "MonitorContentController+Debug.h"

@implementation MonitorContentController

- (void)dealloc {

   __LOG_FUNCTION;

   // Custom dealloc

   [self unobserveAllNotifications];
   [self removeAllSignalResponders];

   __SUPER_DEALLOC;

   return;
}

- (instancetype)initWithCoder:(NSCoder *)aCoder {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   self  = [super initWithCoder:aCoder];
   
   if (self) {
      
      @weakify(self);
      self.onNotification(SERVICE(IMonitorService).batteryLevelNotification, ^(NSNotification *aNotification) {
         
         @strongify(self);

         LogDebug((@"-[MonitorContentController initWithCoder:] : batteryLevelNotification : strongify : %@", self));

         if (SERVICE(IMonitorService).batteryLevel == 1) {
            
            if (SERVICE(IMonitorService).batteryIsCharging) {

               [self.iconImageViews[MonitorSectionBattery] setImage:__IMAGE_NAMED(@"battery-100-bolt", self.class)];

            } /* End if () */
            else {
               
               [self.iconImageViews[MonitorSectionBattery] setImage:__IMAGE_NAMED(@"battery.100", self.class)];

            } /* End else */

         } /* End if () */
         else if (SERVICE(IMonitorService).batteryLevel >= 0.75) {
            
            [self.iconImageViews[MonitorSectionBattery] setImage:__IMAGE_NAMED(@"battery.75", self.class)];

         } /* End if () */
         else if (SERVICE(IMonitorService).batteryLevel >= 0.50) {
            
            [self.iconImageViews[MonitorSectionBattery] setImage:__IMAGE_NAMED(@"battery.50", self.class)];

         } /* End if () */
         else if (SERVICE(IMonitorService).batteryLevel >= 0.25) {
            
            [self.iconImageViews[MonitorSectionBattery] setImage:__IMAGE_NAMED(@"battery.25", self.class)];

         } /* End if () */
         else {
            
            [self.iconImageViews[MonitorSectionBattery] setImage:__IMAGE_NAMED(@"battery.0", self.class)];

            if (SERVICE(IMonitorService).batteryLowPowerModeEnabled) {

               [self.iconImageViews[MonitorSectionBattery] setTintColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {

                  return UIColorX.systemRedColor;
               }];

            } /* End if () */

         } /* End else */

         return;
      });

      self.onNotification(SERVICE(IMonitorService).batteryStateNotification, ^(NSNotification *aNotification) {
         
         @strongify(self);

         LogDebug((@"-[MonitorContentController initWithCoder:] : batteryStateNotification : strongify : %@", self));

         return;
      });

      self.onNotification(SERVICE(IMonitorService).batteryLowPowerModeNotification, ^(NSNotification *aNotification) {
         
         @strongify(self);

         LogDebug((@"-[MonitorContentController initWithCoder:] : batteryLowPowerModeNotification : strongify : %@", self));

         if (SERVICE(IMonitorService).batteryLowPowerModeEnabled) {

            [self.iconImageViews[MonitorSectionBattery] setTintColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {

               return UIColorX.systemYellowColor;
            }];

         } /* End if () */
         else {

            [self.iconImageViews[MonitorSectionBattery] setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];

         } /* End else */

         return;
      });

   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (void)viewDidLoad {
   
   int                            nErr                                     = EFAULT;
   
#if GOOGLE_MOBILE_ADS
   NSDictionary                  *stAdUnitIDs                              = nil;
   NSString                      *szAdUnitID                               = nil;
#endif /* GOOGLE_MOBILE_ADS */

   NSArray<NSString *>           *stIconImages                             = nil;

   __TRY;
   
   [super viewDidLoad];
   
   // Uncomment the following line to preserve selection between presentations.
   self.clearsSelectionOnViewWillAppear = NO;
   
   // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
   // self.navigationItem.rightBarButtonItem = self.editButtonItem;
   
//   [self.tableView setTableHeaderView:[UIView new]];
   [self.tableView setTableFooterView:[UIView new]];
   
   [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
   
   [self.tableView setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
         
      } /* End if () */
      
      return [IDEAColor colorWithKey:[IDEAColor systemGroupedBackground]];
   }];

   stIconImages   = @[
      @"battery-100-bolt",
      @"wifi",
      @"cpu",
      @"drive",
      @"memory"];

   for (int H = 0; H < self.iconImageViews.count; ++H) {
            
      [self.iconImageViews[H] setBackgroundColor:UIColor.clearColor];
      [self.iconImageViews[H] setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];
      [self.iconImageViews[H] setImage:__IMAGE_NAMED(stIconImages[H], self.class)];
      
   } /* End for () */
   
   [self.deviceView setBackgroundColor:UIColor.clearColor];
   [self.deviceView setTranslatesAutoresizingMaskIntoConstraints:NO];
   
//   self.deviceNameLabel;
   [self.deviceNameLabel setBackgroundColor:UIColor.clearColor];
   [self.deviceNameLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.deviceNameLabel setFont:[UIFont systemFontOfSize:self.deviceNameLabel.font.pointSize
                                                    weight:UIFontWeightRegular]];
   [self.deviceNameLabel setText:[UIDevice currentDevice].name];
   
//   self.deviceVersionLabel;
   [self.deviceVersionLabel setBackgroundColor:UIColor.clearColor];
   [self.deviceVersionLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.deviceVersionLabel setFont:[UIFont systemFontOfSize:self.deviceVersionLabel.font.pointSize
                                                    weight:UIFontWeightLight]];
   [self.deviceVersionLabel setText:[NSString stringWithFormat:@"Version : %@", [UIDevice getOSVersion]]];

//   self.deviceBuildLabel;
   [self.deviceBuildLabel setBackgroundColor:UIColor.clearColor];
   [self.deviceBuildLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.deviceBuildLabel setFont:[UIFont systemFontOfSize:self.deviceBuildLabel.font.pointSize
                                                    weight:UIFontWeightLight]];
   [self.deviceBuildLabel setText:[NSString stringWithFormat:@"Build : %@", [UIDevice getSystemBuildVersion]]];

//   self.batteryCell;
   [self.batteryNameLabel setBackgroundColor:UIColor.clearColor];
   [self.batteryNameLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.batteryNameLabel setFont:[UIFont systemFontOfSize:self.batteryNameLabel.font.pointSize
                                                    weight:UIFontWeightLight]];
   [self.batteryNameLabel setText:__LOCALIZED_STRING(self.class, @"BATTERY")];
   
   [self.batteryStateLabel setBackgroundColor:UIColor.clearColor];
   [self.batteryStateLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.batteryStateLabel setFont:[UIFont systemFontOfSize:self.batteryStateLabel.font.pointSize
                                                     weight:UIFontWeightLight]];
   [self.batteryStateLabel setText:__LOCALIZED_STRING(self.class, @"UNKNOW")];
   
   /**
    * 电量信息
    */
   [self.batteryTotalLabel setBackgroundColor:UIColor.clearColor];
   [self.batteryTotalLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.batteryTotalLabel setFont:[UIFont systemFontOfSize:self.batteryTotalLabel.font.pointSize
                                                    weight:UIFontWeightLight]];
   [self.batteryTotalLabel setText:__LOCALIZED_STRING(self.class, @"BATTERY")];
   
   [self.batteryRealLabel setBackgroundColor:UIColor.clearColor];
   [self.batteryRealLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.batteryRealLabel setFont:[UIFont systemFontOfSize:self.batteryRealLabel.font.pointSize
                                                    weight:UIFontWeightLight]];
   [self.batteryRealLabel setText:__LOCALIZED_STRING(self.class, @"BATTERY")];
   
   [self.batteryProgressView setProgress:[UIDevice currentDevice].batteryLevel animated:YES];

//   self.networkCell;
   [self.networkNameLabel setBackgroundColor:UIColor.clearColor];
   [self.networkNameLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.networkNameLabel setFont:[UIFont systemFontOfSize:self.networkNameLabel.font.pointSize
                                                    weight:UIFontWeightLight]];
   [self.networkNameLabel setText:__LOCALIZED_STRING(self.class, @"WIFI")];
   
   [self.networkStateLabel setBackgroundColor:UIColor.clearColor];
   [self.networkStateLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.networkStateLabel setFont:[UIFont systemFontOfSize:self.networkStateLabel.font.pointSize
                                                     weight:UIFontWeightLight]];
   [self.networkStateLabel setText:__LOCALIZED_STRING(self.class, @"UNKNOW")];

//   self.cpuCell;
   [self.cpuNameLabel setBackgroundColor:UIColor.clearColor];
   [self.cpuNameLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cpuNameLabel setFont:[UIFont systemFontOfSize:self.cpuNameLabel.font.pointSize
                                                weight:UIFontWeightLight]];
   [self.cpuNameLabel setText:__LOCALIZED_STRING(self.class, @"CPU")];
   
   [self.cpuStateLabel setBackgroundColor:UIColor.clearColor];
   [self.cpuStateLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cpuStateLabel setFont:[UIFont systemFontOfSize:self.cpuStateLabel.font.pointSize
                                                 weight:UIFontWeightLight]];
   [self.cpuStateLabel setText:__LOCALIZED_STRING(self.class, @"UNKNOW")];

//   self.driveCell;
   [self.driveNameLabel setBackgroundColor:UIColor.clearColor];
   [self.driveNameLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.driveNameLabel setFont:[UIFont systemFontOfSize:self.driveNameLabel.font.pointSize
                                                  weight:UIFontWeightLight]];
   [self.driveNameLabel setText:__LOCALIZED_STRING(self.class, @"DRIVE")];
   
   [self.driveStateLabel setBackgroundColor:UIColor.clearColor];
   [self.driveStateLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.driveStateLabel setFont:[UIFont systemFontOfSize:self.driveStateLabel.font.pointSize
                                                   weight:UIFontWeightLight]];
   [self.driveStateLabel setText:__LOCALIZED_STRING(self.class, @"UNKNOW")];

//   self.memoryCell;
   [self.memoryNameLabel setBackgroundColor:UIColor.clearColor];
   [self.memoryNameLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.memoryNameLabel setFont:[UIFont systemFontOfSize:self.memoryNameLabel.font.pointSize
                                                   weight:UIFontWeightLight]];
   [self.memoryNameLabel setText:__LOCALIZED_STRING(self.class, @"MEMORY")];
   
   [self.memoryStateLabel setBackgroundColor:UIColor.clearColor];
   [self.memoryStateLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.memoryStateLabel setFont:[UIFont systemFontOfSize:self.memoryStateLabel.font.pointSize
                                                    weight:UIFontWeightLight]];
   [self.memoryStateLabel setText:__LOCALIZED_STRING(self.class, @"UNKNOW")];

   self.batteryProgressView;
   self.driveProgressView;
   self.memoryProgressView;

   /**
    * ADs
    */
#if GOOGLE_MOBILE_ADS
   stAdUnitIDs = [AD admobs];
   LogDebug((@"-[MonitorContentController viewDidLoad] : AdUnitIDs : %@", stAdUnitIDs));
   
   szAdUnitID  = [stAdUnitIDs objectForKey:@"HOME-BANNER"];
   
   [self.bannerView setBackgroundColor:UIColor.clearColor];
   [self.gadBannerView setCornerRadius:[UISetting cornerRadiusSmall] clipsToBounds:YES];
   [self.gadBannerView setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor tertiarySystemGroupedBackground]];
         
      } /* End if () */
      
      return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
   }];
   
   [self.bannerViewWidth setConstant:self.tableView.width];

   [self.gadBannerView setAdUnitID:szAdUnitID];
   [self.gadBannerView setAdSize:GADAdSizeBanner];
   [self.gadBannerView setAutoloadEnabled:YES];

   [self.gadBannerView setRootViewController:self];
   [self.gadBannerView setDelegate:self];
   [self.gadBannerView setAdSizeDelegate:self];
   
   [self postSignal:MonitorContentController.loadADSignal
            onQueue:DISPATCH_GET_MAIN_QUEUE()];
#endif /* GOOGLE_MOBILE_ADS */

   LogDebug((@"-[MonitorContentController viewDidLoad] : Device Name : %@", [UIDevice currentDevice].name));
   LogDebug((@"-[MonitorContentController viewDidLoad] : Device model : %@", [UIDevice currentDevice].model));
   LogDebug((@"-[MonitorContentController viewDidLoad] : Device localizedModel : %@", [UIDevice currentDevice].localizedModel));
   LogDebug((@"-[MonitorContentController viewDidLoad] : Device systemName : %@", [UIDevice currentDevice].systemName));
   LogDebug((@"-[MonitorContentController viewDidLoad] : Device systemVersion : %@", [UIDevice currentDevice].systemVersion));
   LogDebug((@"-[MonitorContentController viewDidLoad] : Device identifierForVendor : %@", [UIDevice currentDevice].identifierForVendor));

   LogDebug((@"-[MonitorContentController viewDidLoad] : NSProcessInfo environment : %@", [NSProcessInfo processInfo].environment));
   LogDebug((@"-[MonitorContentController viewDidLoad] : NSProcessInfo arguments : %@", [NSProcessInfo processInfo].arguments));
   LogDebug((@"-[MonitorContentController viewDidLoad] : NSProcessInfo hostName : %@", [NSProcessInfo processInfo].hostName));
   LogDebug((@"-[MonitorContentController viewDidLoad] : NSProcessInfo processName : %@", [NSProcessInfo processInfo].processName));
   LogDebug((@"-[MonitorContentController viewDidLoad] : NSProcessInfo processIdentifier : %d", [NSProcessInfo processInfo].processIdentifier));
   LogDebug((@"-[MonitorContentController viewDidLoad] : NSProcessInfo globallyUniqueString : %@", [NSProcessInfo processInfo].globallyUniqueString));

   struct utsname  systemInfo = {0};
   
   uname(&systemInfo);
   
   LogDebug((@"-[MonitorContentController viewDidLoad] : sysname : %@", [NSString stringWithCString:systemInfo.sysname encoding:NSASCIIStringEncoding]));
   LogDebug((@"-[MonitorContentController viewDidLoad] : machine : %@", [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding]));
   LogDebug((@"-[MonitorContentController viewDidLoad] : nodename : %@", [NSString stringWithCString:systemInfo.nodename encoding:NSASCIIStringEncoding]));
   LogDebug((@"-[MonitorContentController viewDidLoad] : release : %@", [NSString stringWithCString:systemInfo.release encoding:NSASCIIStringEncoding]));
   LogDebug((@"-[MonitorContentController viewDidLoad] : version : %@", [NSString stringWithCString:systemInfo.version encoding:NSASCIIStringEncoding]));

   /**
    * 电池信息初始化
    */
   LogDebug((@"-[MonitorContentController viewDidLoad] : BatterLevel : %d", (int)(SERVICE(IMonitorService).batteryLevel * 100)));

   if (SERVICE(IMonitorService).batteryLowPowerModeEnabled) {

      [self.iconImageViews[MonitorSectionBattery] setTintColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {

         return UIColorX.systemYellowColor;
      }];

   } /* End if () */
   
   if (SERVICE(IMonitorService).batteryLevel == 1) {
      
      if (SERVICE(IMonitorService).batteryIsCharging) {

         [self.iconImageViews[MonitorSectionBattery] setImage:__IMAGE_NAMED(@"battery-100-bolt", self.class)];

      } /* End if () */
      else {
         
         [self.iconImageViews[MonitorSectionBattery] setImage:__IMAGE_NAMED(@"battery.100", self.class)];

      } /* End else */

   } /* End if () */
   else if (SERVICE(IMonitorService).batteryLevel >= 0.75) {
      
      [self.iconImageViews[MonitorSectionBattery] setImage:__IMAGE_NAMED(@"battery.75", self.class)];

   } /* End if () */
   else if (SERVICE(IMonitorService).batteryLevel >= 0.50) {
      
      [self.iconImageViews[MonitorSectionBattery] setImage:__IMAGE_NAMED(@"battery.50", self.class)];

   } /* End if () */
   else if (SERVICE(IMonitorService).batteryLevel >= 0.25) {
      
      [self.iconImageViews[MonitorSectionBattery] setImage:__IMAGE_NAMED(@"battery.25", self.class)];

   } /* End if () */
   else {
      
      [self.iconImageViews[MonitorSectionBattery] setImage:__IMAGE_NAMED(@"battery.0", self.class)];

      if (SERVICE(IMonitorService).batteryLowPowerModeEnabled) {

         [self.iconImageViews[MonitorSectionBattery] setTintColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {

            return UIColorX.systemRedColor;
         }];

      } /* End if () */

   } /* End else */

   __CATCH(nErr);
   
   return;
}

- (void)didReceiveMemoryWarning {

   int                            nErr                                     = EFAULT;

   __TRY;

   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.

   __CATCH(nErr);

   return;
}

- (void)viewWillAppear:(BOOL)aAnimated {

   int                            nErr                                     = EFAULT;

   __TRY;

   [super viewWillAppear:aAnimated];

   __CATCH(nErr);

   return;
}

- (void)viewDidAppear:(BOOL)aAnimated {

   int                            nErr                                     = EFAULT;

   __TRY;

   [super viewDidAppear:aAnimated];

   __CATCH(nErr);

   return;
}

- (void)viewWillDisappear:(BOOL)aAnimated {

   int                            nErr                                     = EFAULT;

   __TRY;

   [super viewWillDisappear:aAnimated];

   __CATCH(nErr);

   return;
}

- (void)viewDidDisappear:(BOOL)aAnimated {

   int                            nErr                                     = EFAULT;

   __TRY;

   [super viewDidDisappear:aAnimated];

   __CATCH(nErr);

   return;
}

@end

#pragma mark - UIStoryboardSegue
@implementation MonitorContentController (UIStoryboardSegue)

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)aSegue sender:(id)aSender {

   int                            nErr                                     = EFAULT;

   __TRY;

   // Get the new view controller using [aSegue destinationViewController].
   // Pass the selected object to the new view controller.

   __CATCH(nErr);

   return;
}

@end
