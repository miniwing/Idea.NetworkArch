//
//  PingController+AD.h
//  Pods
//
//  Created by Harry on 2022/11/11.
//

#import <ADs/AppOpenAdManager.h>

#import "PingController.h"

NS_ASSUME_NONNULL_BEGIN

#define GADAdSizeHeight                            (60)

@interface PingController (AD) <GADBannerViewDelegate, GADAdSizeDelegate>

- (void)loadAd;

@end

NS_ASSUME_NONNULL_END
