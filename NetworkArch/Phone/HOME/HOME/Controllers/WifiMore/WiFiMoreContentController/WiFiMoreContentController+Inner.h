//
//  WiFiMoreContentController+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/8/1.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <ADs/AD.h>
#import <ADs/AppOpenAdManager.h>

#import <IDEAKit/UIDevice+Network.h>

#import <APPDriver/DataUsage.h>

#import "WiFiMoreContentController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WiFiMoreContentController ()

@property (nonatomic, weak)   IBOutlet       UIView                              * bannerView;
@property (nonatomic, weak)   IBOutlet       NSLayoutConstraint                  * bannerViewWidth;
@property (nonatomic, weak)   IBOutlet       NSLayoutConstraint                  * bannerViewHeight;
@property (nonatomic, weak)   IBOutlet       GADBannerView                       * gadBannerView;

@property (nonatomic, strong) IBOutletCollection(WifiMoreCell)    NSArray<WifiMoreCell *>    * detailCells;
@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *>          * detailCellContainerViews;
@property (nonatomic, weak)   IBOutlet       UIImageView                                     * interfacesImageView;

@property (nonatomic, strong) IBOutletCollection(WifiMoreCell)    NSArray<WifiMoreCell *>    * dataUsageCells;
@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *>          * dataUsageCellContainerViews;

@property (nonatomic, strong) IBOutletCollection(WifiMoreCell)    NSArray<WifiMoreCell *>    * warningCells;
@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *>          * warningCellContainerViews;
@property (nonatomic, weak)   IBOutlet       UIImageView                                     * warningImageView;
@property (nonatomic, weak)   IBOutlet       UIButton                                        * warningButton;

@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *>          * separatorViews;

@end

@interface WiFiMoreContentController ()

@property (nonatomic, strong)                NSTimer                             * timer;

@property (nonatomic, strong)                NSString                            * externalIPv4;
@property (nonatomic, assign)                BOOL                                  externalIPv4ing;

@end

@interface WiFiMoreContentController (Inner)

- (void)getExternalIPv4;

@end

NS_ASSUME_NONNULL_END
