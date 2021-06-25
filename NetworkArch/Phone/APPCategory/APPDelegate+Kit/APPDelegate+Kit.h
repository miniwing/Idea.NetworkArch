//
//  APPDelegate+Kit.h
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "APPDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface APPDelegate (Kit)

+ (NSString *)version;
+ (void)setVersion:(NSString *)aVersion;

+ (BOOL)isTabbarAnimation;
+ (void)setTabbarAnimation:(BOOL)aAnimation;

+ (BOOL)isAutoTheme;
+ (void)setAutoTheme:(BOOL)aAutoTheme;

+ (BOOL)isPrivacy;
+ (void)setPrivacy:(BOOL)aPrivacy;

@end

NS_ASSUME_NONNULL_END
