//
//  SettingProvider.h
//  SettingProvider
//
//  Created by Harry on 2022/3/11.
//
//  Mail: miniwing.hz@gmail.com
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingProvider : NSObject

+ (NSString *)version;
+ (void)setVersion:(NSString *)aVersion;

+ (BOOL)isPrivacy;
+ (void)setPrivacy:(BOOL)aPrivacy;

+ (BOOL)isTracking;
+ (void)setTracking:(BOOL)aTracking;

+ (BOOL)isTabbarAnimation;
+ (void)setTabbarAnimation:(BOOL)aAnimation;

+ (BOOL)isAutoTheme;
+ (void)setAutoTheme:(BOOL)aAnimation;

+ (BOOL)isHaptics;
+ (void)setHaptics:(BOOL)aHaptics;

@end

@interface SettingProvider ()

+ (instancetype)sharedInstance;

/**
 *  Unavailable initializer
 */
+ (instancetype)new NS_UNAVAILABLE;

/**
 *  Unavailable initializer
 */
- (instancetype)init NS_UNAVAILABLE;

@end

@interface SettingProvider (Locale)

+ (NSString *)localization;
+ (NSString *)localization:(NSLocale *)aLocale;

@end

@interface SettingProvider (Notification)

+ (NSString *)tabAnimationNotification;
+ (NSString *)hapticsNotification;
+ (NSString *)appRateOnStore;

@end

NS_ASSUME_NONNULL_END
