//
//  TracerouteController+AD.h
//  Pods
//
//  Created by Harry on 2022/11/11.
//

#import <ADs/AppOpenAdManager.h>

#import "TracerouteController.h"

NS_ASSUME_NONNULL_BEGIN

#define GADAdSizeHeight                            (60)

@interface TracerouteController (AD) <GADBannerViewDelegate, GADAdSizeDelegate>

- (void)loadAd;

@end

NS_ASSUME_NONNULL_END
