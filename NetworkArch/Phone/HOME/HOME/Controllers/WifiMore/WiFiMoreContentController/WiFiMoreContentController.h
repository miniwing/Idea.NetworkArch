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

#define WIFI_INTERFACES          (__ON__)

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

@end

NS_ASSUME_NONNULL_END
