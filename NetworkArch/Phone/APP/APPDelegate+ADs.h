//
//  APPDelegate+ADs.h
//  NetworkArch
//
//  Created by Harry on 2022/11/10.
//  Copyright © 2022 Harry. All rights reserved.
//

#import "APPDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface APPDelegate (Admob)

- (void)requestAppOpenAd;
- (void)tryToPresentAd;

@end

NS_ASSUME_NONNULL_END