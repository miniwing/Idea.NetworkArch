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

         [self updateBattery];

         return;
      });

      self.onNotification(SERVICE(IMonitorService).batteryStateNotification, ^(NSNotification *aNotification) {
         
         @strongify(self);

         LogDebug((@"-[MonitorContentController initWithCoder:] : batteryStateNotification : strongify : %@", self));

         [self updateBattery];

         return;
      });

      self.onNotification(SERVICE(IMonitorService).batteryLowPowerModeNotification, ^(NSNotification *aNotification) {
         
         @strongify(self);

         LogDebug((@"-[MonitorContentController initWithCoder:] : batteryLowPowerModeNotification : strongify : %@", self));

         [self updateBattery];

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
      @"battery.100-bolt",
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
   
   /**
    * 电池
    */
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
   
   [self.batteryProgressView setCornerRadius:[UISetting cornerRadiusSmall] clipsToBounds:YES];
   [self.batteryProgressView setTrackTintColorPicker:DKColorPickerWithKey([IDEAColor lightGray])];
   [self.batteryProgressView setProgressTintColor:UIColorX.systemYellowColor];
   
#if TARGET_IPHONE_SIMULATOR
   [self.batteryProgressView setProgress:0.0 animated:NO];
#endif /* TARGET_IPHONE_SIMULATOR */
   
   /**
    * 网络
    */
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
   
   [self.networkUpLabel setBackgroundColor:UIColor.clearColor];
   [self.networkUpLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.networkUpLabel setFont:[UIFont systemFontOfSize:self.networkUpLabel.font.pointSize
                                                  weight:UIFontWeightLight]];
   [self.networkUpLabel setText:__LOCALIZED_STRING(self.class, @"UNKNOW")];
   
   [self.networkUpImageView setBackgroundColor:UIColor.clearColor];
   [self.networkUpImageView setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.networkUpImageView setImage:__IMAGE_NAMED(@"arrow.up.right", self.class)];
   
   [self.networkDownLabel setBackgroundColor:UIColor.clearColor];
   [self.networkDownLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.networkDownLabel setFont:[UIFont systemFontOfSize:self.networkDownLabel.font.pointSize
                                                    weight:UIFontWeightLight]];
   [self.networkDownLabel setText:__LOCALIZED_STRING(self.class, @"UNKNOW")];
   
   [self.networkDownImageView setBackgroundColor:UIColor.clearColor];
   [self.networkDownImageView setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.networkDownImageView setImage:__IMAGE_NAMED(@"arrow.down.right", self.class)];
   
   /**
    * CPU
    */
   //   self.cpuCell;
   [self.cpuNameLabel setBackgroundColor:UIColor.clearColor];
   [self.cpuNameLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cpuNameLabel setFont:[UIFont systemFontOfSize:self.cpuNameLabel.font.pointSize
                                                weight:UIFontWeightLight]];
   [self.cpuNameLabel setText:__LOCALIZED_STRING(self.class, @"CPU")];
   
   [self.cpuCountTitleLabel setBackgroundColor:UIColor.clearColor];
   [self.cpuCountTitleLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cpuCountTitleLabel setFont:[UIFont systemFontOfSize:self.cpuCountTitleLabel.font.pointSize
                                                      weight:UIFontWeightLight]];
   [self.cpuCountTitleLabel setText:__LOCALIZED_STRING(self.class, @"Core: ")];
   
   [self.cpuCountLabel setBackgroundColor:UIColor.clearColor];
   [self.cpuCountLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cpuCountLabel setFont:[UIFont systemFontOfSize:self.cpuCountLabel.font.pointSize
                                                 weight:UIFontWeightLight]];
   [self.cpuCountLabel setText:__LOCALIZED_STRING(self.class, @"UNKNOW")];
   
   [self.cpuAppUsageTitleLabel setBackgroundColor:UIColor.clearColor];
   [self.cpuAppUsageTitleLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cpuAppUsageTitleLabel setFont:[UIFont systemFontOfSize:self.cpuAppUsageTitleLabel.font.pointSize
                                                         weight:UIFontWeightLight]];
   [self.cpuAppUsageTitleLabel setText:__LOCALIZED_STRING(self.class, @"App: ")];
   
   [self.cpuAppUsageLabel setBackgroundColor:UIColor.clearColor];
   [self.cpuAppUsageLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cpuAppUsageLabel setFont:[UIFont systemFontOfSize:self.cpuAppUsageLabel.font.pointSize
                                                    weight:UIFontWeightLight]];
   [self.cpuAppUsageLabel setText:__LOCALIZED_STRING(self.class, @"UNKNOW")];
   
   [self.cpuUsageTitleLabel setBackgroundColor:UIColor.clearColor];
   [self.cpuUsageTitleLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cpuUsageTitleLabel setFont:[UIFont systemFontOfSize:self.cpuUsageTitleLabel.font.pointSize
                                                      weight:UIFontWeightLight]];
   [self.cpuUsageTitleLabel setText:__LOCALIZED_STRING(self.class, @"System: ")];
   
   [self.cpuUsageLabel setBackgroundColor:UIColor.clearColor];
   [self.cpuUsageLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cpuUsageLabel setFont:[UIFont systemFontOfSize:self.cpuUsageLabel.font.pointSize
                                                 weight:UIFontWeightLight]];
   [self.cpuUsageLabel setText:__LOCALIZED_STRING(self.class, @"UNKNOW")];
   
   /**
    * 存储空间
    */
   //   self.driveCell;
   [self.driveNameLabel setBackgroundColor:UIColor.clearColor];
   [self.driveNameLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.driveNameLabel setFont:[UIFont systemFontOfSize:self.driveNameLabel.font.pointSize
                                                  weight:UIFontWeightLight]];
   [self.driveNameLabel setText:__LOCALIZED_STRING(self.class, @"DRIVE")];
   
   [self.driveFreeLabel setBackgroundColor:UIColor.clearColor];
   [self.driveFreeLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.driveFreeLabel setFont:[UIFont systemFontOfSize:self.driveFreeLabel.font.pointSize
                                                  weight:UIFontWeightLight]];
   [self.driveFreeLabel setText:__LOCALIZED_STRING(self.class, @"UNKNOW")];
   
   [self.driveUsedLabel setBackgroundColor:UIColor.clearColor];
   [self.driveUsedLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.driveUsedLabel setFont:[UIFont systemFontOfSize:self.driveUsedLabel.font.pointSize
                                                  weight:UIFontWeightLight]];
   [self.driveUsedLabel setText:__LOCALIZED_STRING(self.class, @"UNKNOW")];
   
   [self.driveTotalLabel setBackgroundColor:UIColor.clearColor];
   [self.driveTotalLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.driveTotalLabel setFont:[UIFont systemFontOfSize:self.driveTotalLabel.font.pointSize
                                                   weight:UIFontWeightLight]];
   [self.driveTotalLabel setText:__LOCALIZED_STRING(self.class, @"UNKNOW")];
   
   [self.driveProgressView setCornerRadius:[UISetting cornerRadiusSmall] clipsToBounds:YES];
   [self.driveProgressView setTrackTintColorPicker:DKColorPickerWithKey([IDEAColor lightGray])];
   [self.driveProgressView setProgressTintColor:UIColorX.systemYellowColor];
#if TARGET_IPHONE_SIMULATOR
   [self.driveProgressView setProgress:0.3 animated:NO];
#endif /* TARGET_IPHONE_SIMULATOR */
   
   /**
    * 内存
    */
   //   self.memoryCell;
   [self.memoryNameLabel setBackgroundColor:UIColor.clearColor];
   [self.memoryNameLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.memoryNameLabel setFont:[UIFont systemFontOfSize:self.memoryNameLabel.font.pointSize
                                                   weight:UIFontWeightLight]];
   [self.memoryNameLabel setText:__LOCALIZED_STRING(self.class, @"MEMORY")];
   
   [self.memoryFreeLabel setBackgroundColor:UIColor.clearColor];
   [self.memoryFreeLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.memoryFreeLabel setFont:[UIFont systemFontOfSize:self.memoryFreeLabel.font.pointSize
                                                   weight:UIFontWeightLight]];
   [self.memoryFreeLabel setText:__LOCALIZED_STRING(self.class, @"UNKNOW")];
   
   [self.memoryUsedLabel setBackgroundColor:UIColor.clearColor];
   [self.memoryUsedLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.memoryUsedLabel setFont:[UIFont systemFontOfSize:self.memoryUsedLabel.font.pointSize
                                                   weight:UIFontWeightLight]];
   [self.memoryUsedLabel setText:__LOCALIZED_STRING(self.class, @"UNKNOW")];
   
   [self.memoryTotalLabel setBackgroundColor:UIColor.clearColor];
   [self.memoryTotalLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.memoryTotalLabel setFont:[UIFont systemFontOfSize:self.memoryTotalLabel.font.pointSize
                                                    weight:UIFontWeightLight]];
   [self.memoryTotalLabel setText:__LOCALIZED_STRING(self.class, @"UNKNOW")];
   
   [self.memoryProgressView setCornerRadius:[UISetting cornerRadiusSmall] clipsToBounds:YES];
   [self.memoryProgressView setTrackTintColorPicker:DKColorPickerWithKey([IDEAColor lightGray])];
   [self.memoryProgressView setProgressTintColor:UIColorX.systemYellowColor];
#if TARGET_IPHONE_SIMULATOR
   [self.memoryProgressView setProgress:0.3 animated:NO];
#endif /* TARGET_IPHONE_SIMULATOR */
   
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
   
   /**
    * 电池信息初始化
    */
   LogDebug((@"-[MonitorContentController viewDidLoad] : BatterLevel : %d", (int)(SERVICE(IMonitorService).batteryLevel * 100)));
   
   [self updateBattery];
   
   [self updateDrive];
   
   [self updateMemory];
   
   [self updateCPU];
   
   [self updateNetwork];
   
   [self.timer fire];
   
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
   
   self.needMonitor  = YES;
   
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

   self.needMonitor  = NO;

   __CATCH(nErr);

   return;
}


- (NSTimer *)timer {
   
   if (nil == _timer) {

      @weakify(self);
      
//      _timer   = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
//      dispatch_source_set_timer(_timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
//      dispatch_source_set_event_handler(_timer, ^{
//
//         @strongify(self);
//
//         if (self.needMonitor) {
//
//            [self updateBattery];
//            [self updateDrive];
//            [self updateMemory];
//            [self updateCPU];
//            [self updateNetwork];
//
//         } /* End if () */
//      });
//      dispatch_resume(_timer);

      _timer   = [NSTimer timerWithTimeInterval:1.0f
                                        repeats:YES
                                          block:^(NSTimer *aTimer) {

         @strongify(self);

         if (self.needMonitor) {

            [self updateBattery];
            [self updateDrive];
            [self updateMemory];
            [self updateCPU];
            [self updateNetwork];

         } /* End if () */

         return;
      }];

      [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];

   } /* End if () */

   return _timer;
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
