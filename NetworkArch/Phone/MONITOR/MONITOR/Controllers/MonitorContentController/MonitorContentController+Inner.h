//
//  MonitorContentController+Inner.h
//  MONITOR
//
//  Created by Harry on 2022/11/20.
//
//  Mail: miniwing.hz@gmail.com
//

#import <ADs/AD.h>
#import <ADs/AppOpenAdManager.h>

#import <MonitorService/IMonitorService.h>

#import "MonitorContentController.h"

#import "MonitorContentCell.h"

NS_ASSUME_NONNULL_BEGIN

IDEA_ENUM(NSInteger, MonitorSection) {
   
   MonitorSectionBattery   = 0,
   MonitorSectionNetwork,
   MonitorSectionCPU,
   MonitorSectionDrive,
   MonitorSectionMemory,
   MonitorSectionNumber
};

IDEA_ENUM(NSInteger, MonitorCPU) {
   
   MonitorCPUName          = 0,
   MonitorCPUUsage,
   MonitorCPUNumber
};

IDEA_ENUM(NSInteger, MonitorNetwork) {
   
   MonitorNetworkName      = 0,
   MonitorNetworkUsage,
   MonitorNetworkNumber
};

IDEA_ENUM(NSInteger, MonitorBattery) {
   
   MonitorBatteryName      = 0,
   MonitorBatteryUsage,
   MonitorBatteryProgress,
   MonitorBatteryNumber
};

IDEA_ENUM(NSInteger, MonitorDrive) {
   
   MonitorDriveName        = 0,
   MonitorDriveUsage,
   MonitorDriveProgress,
   MonitorDriveNumber
};

IDEA_ENUM(NSInteger, MonitorMemory) {
   
   MonitorMemoryName       = 0,
   MonitorMemoryUsage,
   MonitorMemoryProgress,
   MonitorMemoryNumber
};

@interface MonitorContentController ()

@property (nonatomic, weak)   IBOutlet       UIView                              * bannerView;
@property (nonatomic, weak)   IBOutlet       NSLayoutConstraint                  * bannerViewWidth;
@property (nonatomic, weak)   IBOutlet       NSLayoutConstraint                  * bannerViewHeight;
@property (nonatomic, weak)   IBOutlet       GADBannerView                       * gadBannerView;

@property (nonatomic, weak)   IBOutlet       UIView                              * deviceView;
@property (nonatomic, weak)   IBOutlet       UILabel                             * deviceNameLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * deviceVersionLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * deviceBuildLabel;

@property (nonatomic, weak)   IBOutlet       MonitorContentCell                  * batteryCell;
@property (nonatomic, weak)   IBOutlet       UILabel                             * batteryNameLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * batteryStateLabel;

@property (nonatomic, weak)   IBOutlet       MonitorContentCell                  * networkCell;
@property (nonatomic, weak)   IBOutlet       UILabel                             * networkNameLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * networkStateLabel;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * networkUpImageView;
@property (nonatomic, weak)   IBOutlet       UILabel                             * networkUpLabel;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * networkDownImageView;
@property (nonatomic, weak)   IBOutlet       UILabel                             * networkDownLabel;

@property (nonatomic, weak)   IBOutlet       MonitorContentCell                  * cpuCell;
@property (nonatomic, weak)   IBOutlet       UILabel                             * cpuNameLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * cpuCountTitleLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * cpuCountLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * cpuAppUsageTitleLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * cpuAppUsageLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * cpuUsageTitleLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * cpuUsageLabel;

@property (nonatomic, weak)   IBOutlet       MonitorContentCell                  * driveCell;
@property (nonatomic, weak)   IBOutlet       UILabel                             * driveNameLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * driveFreeLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * driveUsedLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * driveTotalLabel;

@property (nonatomic, weak)   IBOutlet       MonitorContentCell                  * memoryCell;
@property (nonatomic, weak)   IBOutlet       UILabel                             * memoryNameLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * memoryFreeLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * memoryUsedLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * memoryTotalLabel;

@property (nonatomic, strong) IBOutletCollection(UIImageView) NSArray<UIImageView *> * iconImageViews;

@property (nonatomic, weak)   IBOutlet       UIProgressView                      * batteryProgressView;
@property (nonatomic, weak)   IBOutlet       UIProgressView                      * driveProgressView;
@property (nonatomic, weak)   IBOutlet       UIProgressView                      * memoryProgressView;

@end

@interface MonitorContentController ()

@property (nonatomic, assign)                BOOL                                  needMonitor;
@property (nonatomic, strong)                NSTimer                             * timer;
//@property (nonatomic, strong)                dispatch_source_t                     timer;

@end

@interface MonitorContentController (Inner)

- (void)updateBattery;

- (void)updateDrive;

- (void)updateMemory;

- (void)updateCPU;

- (void)updateNetwork;

@end

NS_ASSUME_NONNULL_END
