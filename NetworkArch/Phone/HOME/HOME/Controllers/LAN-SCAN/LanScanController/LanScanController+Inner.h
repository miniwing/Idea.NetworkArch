//
//  LanScanController+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <ADs/AD.h>
#import <ADs/AppOpenAdManager.h>

#import <PhoneNetSDK/PhoneNetSDK.h>

#import "LanScanController.h"

#import "LanScanCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface LanScanController () <PNetMLanScannerDelegate>

@property (nonatomic, weak)   IBOutlet       UINavigationBarX                    * navigationBarX;

@property (nonatomic, strong) IBOutlet       UIBarButtonItem                     * leftBarButtonItem;
@property (nonatomic, strong) IBOutlet       UIButton                            * leftBarButton;

@property (nonatomic, strong) IBOutlet       UIBarButtonItem                     * rightBarButtonItem;
@property (nonatomic, strong) IBOutlet       UIButton                            * rightBarButton;

@property (nonatomic, weak)   IBOutlet       UIView                              * infoView;
@property (nonatomic, weak)   IBOutlet       UILabel                             * ssidLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * ipLabel;

@property (nonatomic, weak)   IBOutlet       UITableView                         * tableView;

@end

@interface LanScanController ()

@property (nonatomic, weak)   IBOutlet       UIView                              * bannerView;
@property (nonatomic, weak)   IBOutlet       NSLayoutConstraint                  * bannerViewWidth;
@property (nonatomic, weak)   IBOutlet       NSLayoutConstraint                  * bannerViewHeight;
@property (nonatomic, weak)   IBOutlet       GADBannerView                       * gadBannerView;

@end

@interface LanScanController ()

@property (nonatomic, strong)                NSMutableArray<NSString *>          * activeIPs;

@end

@interface LanScanController (Inner)

@end

@interface LanScanController (PNetMLanScannerDelegate)

- (void)scanMLan:(PNetMLanScanner *)aScanner activeIp:(NSString *)aIP;

- (void)scanMlan:(PNetMLanScanner *)aScanner percent:(float)aPercent;

- (void)finishedScanMlan:(PNetMLanScanner *)aScanner;

@end

NS_ASSUME_NONNULL_END
