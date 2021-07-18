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
   
   HomeSectionWifi      = 0,
   HomeSectionCellular  = 1,
   HomeSectionUtilities = 2,
   HomeSectionNumber
};

IDEA_ENUM(NSInteger, HomeUtilitiesSection) {
   
   HomeUtilitiesPing    = 0,
   HomeUtilitiesWoL     = 1,
   HomeUtilitiesWhois   = 2,
   HomeUtilitiesDNS     = 3,
   HomeUtilitiesNumber
};

@interface HomeContentController : IDEATableViewController

@property (nonatomic, strong) IBOutletCollection(UITableViewCell) NSArray<UITableViewCell *> * wifiCells;
@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *>          * wifiCellContainerViews;

@property (nonatomic, weak)   IBOutlet       UILabel                             * wifiSSIDLabel;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * wifiSSIDIcon;

@property (nonatomic, weak)   IBOutlet       UILabel                             * wifiIPLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * wifiIP;

@property (nonatomic, weak)   IBOutlet       UILabel                             * wifiMoreLabel;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * wifiMoreIcon;

@property (nonatomic, strong) IBOutletCollection(UITableViewCell) NSArray<UITableViewCell *> * cellularCells;
@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *>          * cellularCellContainerViews;

@property (nonatomic, weak)   IBOutlet       UILabel                             * cellularOperatorLabel;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * cellularOperatorIcon;

@property (nonatomic, weak)   IBOutlet       UILabel                             * cellularIPLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * cellularIP;

@property (nonatomic, weak)   IBOutlet       UILabel                             * cellularMoreLabel;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * cellularMoreIcon;

@property (nonatomic, strong) IBOutletCollection(UITableViewCell) NSArray<UITableViewCell *> * utilitiesCells;
@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *>          * utilitiesCellContainerViews;

@property (nonatomic, weak)   IBOutlet       UILabel                             * utilitiesPingLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * utilitiesWakeOnLanLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * utilitiesWhoisLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * utilitiesDNSLabel;

@property (nonatomic, strong) IBOutletCollection(UIImageView)     NSArray<UIImageView *>     * cellRightImageViews;

@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *>          * cellSeparatorViews;

@end

@interface HomeContentController ()

@end

NS_ASSUME_NONNULL_END
