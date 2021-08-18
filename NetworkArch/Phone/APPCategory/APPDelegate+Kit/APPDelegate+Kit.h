//
//  APPDelegate+Kit.h
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "APPDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface APPDelegate (System)

+ (NSString *)version;
+ (void)setVersion:(NSString *)aVersion;

+ (BOOL)isTabbarAnimation;
+ (void)setTabbarAnimation:(BOOL)aAnimation;

+ (BOOL)isAutoTheme;
+ (void)setAutoTheme:(BOOL)aAutoTheme;

+ (BOOL)isTracking;
+ (void)setTracking:(BOOL)aTracking;

+ (BOOL)isIntroduced;
+ (void)setIntroduced:(BOOL)aIntroduced;

@end

@interface APPDelegate (Storage)

+ (NSString *)apiKey;
+ (void)setApiKey:(NSString *)aApiKey;

@end

NS_ASSUME_NONNULL_END
