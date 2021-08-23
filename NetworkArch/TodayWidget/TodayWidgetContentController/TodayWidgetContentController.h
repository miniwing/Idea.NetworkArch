//
//  TodayWidgetContentController.h
//  TodayWidget
//
//  Created by Harry on 2021/7/24.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "TodayWidgetCell.h"

IDEA_ENUM(NSInteger, TodayWidgetSection) {
   
   TodayWidgetSectionWifi      = 0,
   TodayWidgetSectionCellular  = 1,
   TodayWidgetSectionNumber
};

IDEA_ENUM(NSInteger, TodayWidgetWifi) {
   
   TodayWidgetWifiSSID         = 0,
   TodayWidgetWifiIP           = 1,
   TodayWidgetWifiMore         = 2,
   TodayWidgetWifiNumber
};

IDEA_ENUM(NSInteger, TodayWidgetCellular) {
   
   TodayWidgetCellularOperator = 0,
   TodayWidgetCellularIP       = 1,
   TodayWidgetCellularMore     = 2,
   TodayWidgetCellularNumber
};

IDEA_ENUM(NSInteger, TodayWidgetUtilities) {
   
   TodayWidgetUtilitiesPing    = 0,
   TodayWidgetUtilitiesWoL     = 1,
   TodayWidgetUtilitiesWhois   = 2,
   TodayWidgetUtilitiesDNS     = 3,
   TodayWidgetUtilitiesNumber
};
NS_ASSUME_NONNULL_BEGIN

@interface TodayWidgetContentController : IDEATableViewController

@property (nonatomic, strong) IBOutletCollection(TodayWidgetCell) NSArray<TodayWidgetCell *> * wifiCells;
@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *>          * wifiCellContainerViews;

@property (nonatomic, weak)   IBOutlet       UILabel                             * wifiSSIDLabel;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * wifiSSIDIcon;

@property (nonatomic, weak)   IBOutlet       UILabel                             * wifiIPLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * wifiIP;

@property (nonatomic, weak)   IBOutlet       UILabel                             * wifiMoreLabel;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * wifiMoreIcon;

@property (nonatomic, strong) IBOutletCollection(TodayWidgetCell) NSArray<TodayWidgetCell *> * cellularCells;
@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *>          * cellularCellContainerViews;

@property (nonatomic, weak)   IBOutlet       UILabel                             * cellularOperatorLabel;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * cellularOperatorIcon;

@property (nonatomic, weak)   IBOutlet       UILabel                             * cellularIPLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * cellularIP;

@property (nonatomic, weak)   IBOutlet       UILabel                             * cellularMoreLabel;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * cellularMoreIcon;

@property (nonatomic, strong) IBOutletCollection(TodayWidgetCell) NSArray<TodayWidgetCell *> * utilitiesCells;
@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *>          * utilitiesCellContainerViews;

@property (nonatomic, weak)   IBOutlet       UILabel                             * utilitiesPingLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * utilitiesWakeOnLanLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * utilitiesWhoisLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * utilitiesDNSLabel;

@property (nonatomic, strong) IBOutletCollection(UIImageView)     NSArray<UIImageView *>     * cellRightImageViews;

@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *>          * cellSeparatorViews;

@end

@interface TodayWidgetContentController ()

@end

NS_ASSUME_NONNULL_END
