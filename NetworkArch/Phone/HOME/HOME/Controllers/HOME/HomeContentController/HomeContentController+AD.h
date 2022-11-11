//
//  HomeContentController+AD.h
//  Pods
//
//  Created by Harry on 2022/11/11.
//

#import "HomeContentController.h"

NS_ASSUME_NONNULL_BEGIN

#define GADAdSizeHeight                            (60)

@interface HomeContentController (AD) <GADBannerViewDelegate, GADAdSizeDelegate>

- (void)loadAd;

@end

NS_ASSUME_NONNULL_END
