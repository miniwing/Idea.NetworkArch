//
//  HomeContentController.h
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "HomeContentCell.h"

NS_ASSUME_NONNULL_BEGIN

IDEA_ENUM(NSInteger, HomeSection) {
   
   HomeSectionWifi         = 0,
//   HomeSectionScan        = 1,
   HomeSectionCellular     = 1,
   HomeSectionUtilities    = 2,
//   HomeSectionCopyright   = 3,
   HomeSectionNumber
};

IDEA_ENUM(NSInteger, HomeWifi) {
   
   HomeWifiSSID            = 0,
   HomeWifiIP              = 1,
   HomeWifiMore            = 2,
   HomeWifiNumber
};

IDEA_ENUM(NSInteger, HomeCellular) {
   
   HomeCellularOperator    = 0,
   HomeCellularIP          = 1,
   HomeCellularMore        = 2,
   HomeCellularNumber
};

IDEA_ENUM(NSInteger, HomeUtilities) {
   
   HomeUtilitiesPing       = 0,
   HomeUtilitiesWoL        = 1,
   HomeUtilitiesWhois      = 2,
   HomeUtilitiesDNS        = 3,
   HomeUtilitiesTraceroute = 4,
   HomeUtilitiesPortScan   = 5,
   HomeUtilitiesLanScan    = 6,
   HomeUtilitiesNumber
};

@interface HomeContentController : IDEATableViewController

@end

NS_ASSUME_NONNULL_END
