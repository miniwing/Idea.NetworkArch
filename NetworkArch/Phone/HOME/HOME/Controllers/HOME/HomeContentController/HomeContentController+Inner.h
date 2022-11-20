//
//  HomeContentController+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <ADs/AD.h>
#import <ADs/AppOpenAdManager.h>

#import <IDEAKit/UIDevice+Network.h>
#import <IDEARouter/IDEARouter.h>

#import "HomeContentController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeContentController ()

@property (nonatomic, weak)   IBOutlet       UIView                              * bannerView;
@property (nonatomic, weak)   IBOutlet       NSLayoutConstraint                  * bannerViewWidth;
@property (nonatomic, weak)   IBOutlet       NSLayoutConstraint                  * bannerViewHeight;
@property (nonatomic, weak)   IBOutlet       GADBannerView                       * gadBannerView;

@property (nonatomic, strong) IBOutletCollection(HomeContentCell) NSArray<HomeContentCell *> * wifiCells;
@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *>          * wifiCellContainerViews;

@property (nonatomic, weak)   IBOutlet       UILabel                             * wifiSSIDLabel;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * wifiSSIDIcon;

@property (nonatomic, weak)   IBOutlet       UILabel                             * wifiIPLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * wifiIP;

@property (nonatomic, weak)   IBOutlet       UILabel                             * wifiMoreLabel;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * wifiMoreIcon;

@property (nonatomic, strong) IBOutletCollection(HomeContentCell) NSArray<HomeContentCell *> * cellularCells;
@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *>          * cellularCellContainerViews;

@property (nonatomic, weak)   IBOutlet       UILabel                             * cellularOperatorLabel;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * cellularOperatorIcon;

@property (nonatomic, weak)   IBOutlet       UILabel                             * cellularIPLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * cellularIP;

@property (nonatomic, weak)   IBOutlet       UILabel                             * cellularMoreLabel;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * cellularMoreIcon;

@property (nonatomic, strong) IBOutletCollection(HomeContentCell) NSArray<HomeContentCell *> * utilitiesCells;
@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *>          * utilitiesCellContainerViews;

@property (nonatomic, weak)   IBOutlet       UILabel                             * utilitiesPingLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * utilitiesWakeOnLanLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * utilitiesWhoisLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * utilitiesDNSLabel;

@property (nonatomic, weak)   IBOutlet       UILabel                             * utilitiesTracerouteLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * utilitiesPortScanLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * utilitiesLanScanLabel;

@property (nonatomic, strong) IBOutletCollection(UIImageView)     NSArray<UIImageView *>     * cellRightImageViews;

@end

@interface HomeContentController ()

@property (nonatomic, strong)                NSString                            * SSID;

@end

@interface HomeContentController (Inner)

@end

NS_ASSUME_NONNULL_END
