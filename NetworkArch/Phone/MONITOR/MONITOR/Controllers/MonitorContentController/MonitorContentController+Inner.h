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

#import "MonitorContentController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MonitorContentController ()

@property (nonatomic, weak)   IBOutlet       UIView                              * bannerView;
@property (nonatomic, weak)   IBOutlet       NSLayoutConstraint                  * bannerViewWidth;
@property (nonatomic, weak)   IBOutlet       NSLayoutConstraint                  * bannerViewHeight;
@property (nonatomic, weak)   IBOutlet       GADBannerView                       * gadBannerView;

@end

@interface MonitorContentController (Inner)

@end

NS_ASSUME_NONNULL_END
