//
//  WiFiMoreContentController.h
//  NetworkArch
//
//  Created by Harry on 2021/8/1.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "WifiMoreCell.h"

NS_ASSUME_NONNULL_BEGIN

IDEA_ENUM(NSInteger, WifiSection) {
   
   WifiSectionDetail       = 0,
   WifiSectionDataUsage    = 1,
   WifiSectionWarning      = 2,
   WifiSectionNumber
};

#define WIFI_INTERFACES          (__OFF__)

IDEA_ENUM(NSInteger, WifiDetail) {
   
   WifiDetailStatus        = 0,
   WifiDetailSSID          = 1,
   WifiDetailBSSID         = 2,
   WifiDetailGateway       = 3,
   WifiDetailSubnet        = 4,
   WifiDetailIPV4          = 5,
   WifiDetailIPV6          = 6,
   WifiDetailExternalIPV4  = 7,
#if WIFI_INTERFACES
   WifiDetailInterfaces    = 8,
#endif /* WIFI_INTERFACES */
   WifiDetailNumber
};

IDEA_ENUM(NSInteger, WifiDataUsage) {
   
   WifiDataUsageReceived   = 0,
   WifiDataUsageSent       = 1,
   WifiDataUsageNumber
};

@interface WiFiMoreContentController : IDEATableViewController

@property (nonatomic, strong) IBOutletCollection(WifiMoreCell)    NSArray<WifiMoreCell *>    * detailCells;
@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *>          * detailCellContainerViews;
@property (nonatomic, weak)   IBOutlet       UIImageView                                     * interfacesImageView;

@property (nonatomic, strong) IBOutletCollection(WifiMoreCell)    NSArray<WifiMoreCell *>    * dataUsageCells;
@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *>          * dataUsageCellContainerViews;

@property (nonatomic, strong) IBOutletCollection(WifiMoreCell)    NSArray<WifiMoreCell *>    * warningCells;
@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *>          * warningCellContainerViews;
@property (nonatomic, weak)   IBOutlet       UIButton                                        * warningButton;

@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *>          * separatorViews;

@end

@interface WiFiMoreContentController ()

@end

NS_ASSUME_NONNULL_END
