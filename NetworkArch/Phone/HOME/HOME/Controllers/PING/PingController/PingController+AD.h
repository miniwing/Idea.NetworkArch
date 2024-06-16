//
//  PingController+AD.h
//  HOME
//
//  Created by Harry on 2022/11/11.
//

#import <ADs/AppOpenAdManager.h>

#import "PingController.h"

NS_ASSUME_NONNULL_BEGIN

#define GADAdSizeHeight                            (60)

@interface PingController (AD)
#if ADS_GOOGLE_MOBILE
<GADBannerViewDelegate, GADAdSizeDelegate>
#endif /* ADS_GOOGLE_MOBILE */

- (void)loadAd;

@end

NS_ASSUME_NONNULL_END
