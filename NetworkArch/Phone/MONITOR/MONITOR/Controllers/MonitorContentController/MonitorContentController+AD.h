//
//  MonitorContentController+AD.h
//  MONITOR
//
//  Created by Harry on 2022/11/11.
//

#import "MonitorContentController.h"

NS_ASSUME_NONNULL_BEGIN

#define GADAdSizeHeight                            (60)

@interface MonitorContentController (AD)
#if ADS_GOOGLE_MOBILE
<GADBannerViewDelegate, GADAdSizeDelegate>
#endif /* ADS_GOOGLE_MOBILE */

- (void)loadAd;

@end

NS_ASSUME_NONNULL_END
