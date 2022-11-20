//
//  WiFiMoreContentController+AD.h
//  HOME
//
//  Created by Harry on 2022/11/11.
//

#import "WiFiMoreContentController.h"

NS_ASSUME_NONNULL_BEGIN

#define GADAdSizeHeight                            (60)

@interface WiFiMoreContentController (AD) <GADBannerViewDelegate, GADAdSizeDelegate>

- (void)loadAd;

@end

NS_ASSUME_NONNULL_END
