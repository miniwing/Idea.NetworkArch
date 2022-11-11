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

+ (BOOL)isIntroduction;
+ (void)setIntroduction:(BOOL)aIntroduction;

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

+ (BOOL)isApiKeySetting;
+ (void)setApiKeySetting:(BOOL)aApiKeyOpened;

+ (BOOL)isICMPEnable;
+ (void)setICMPEnable:(BOOL)aICMPEnable;

+ (NSTimeInterval)activeTime;
+ (void)setActiveTime:(NSTimeInterval)aActiveTime;

/**
 * 用户自定义 xmlApiKey
 */
+ (NSString *)xmlApiKey;
/**
 * 保存用户自定义 xmlApiKey
 */
+ (void)setXmlApiKey:(NSString *)aXmlApiKey;

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
+ (NSString *)appRateOnStoreNotification;

/**
 * 配置的 apiKey 相关的参数
 */
+ (NSString *)apiKeySettingNotification;

@end

NS_ASSUME_NONNULL_END
