//
//  SettingProvider.m
//  SettingProvider
//
//  Created by Harry on 2022/3/11.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "SettingProvider/SettingProvider.h"

//__EXPORT_SERVICE(SettingService, SettingProvider);

@interface SettingProvider ()

@property (nonatomic, strong)                NSArray<NSString *>                 * localizations;

@end

@implementation SettingProvider

+ (instancetype)sharedInstance {
   
   static SettingProvider  *g_INSTANCE = nil;
   static dispatch_once_t   onceToken;
   
   dispatch_once(&onceToken, ^(void) {
      
      g_INSTANCE  = (SettingProvider *)objc_getAssociatedObject([NSUserDefaults standardUserDefaults],
                                                                (__bridge const void *)([NSUserDefaults standardUserDefaults]) + 0x07);

      if (nil == g_INSTANCE) {
         
         g_INSTANCE = [[SettingProvider alloc] __init];

         objc_setAssociatedObject([NSUserDefaults standardUserDefaults],
                                  (__bridge const void *)([NSUserDefaults standardUserDefaults]) + 0x07,
                                  g_INSTANCE,
                                  OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                  
      } /* End if () */
   });
   
   return g_INSTANCE;
}

- (void)dealloc {
   
   __LOG_FUNCTION;

   // Custom dealloc

   __SUPER_DEALLOC;

   return;
}

- (instancetype)__init {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   self  = [super init];
   
   if (self) {

      _localizations = [NSArray arrayWithContentsOfFile:__FILE_IN_BUNDLE(@"Localizations.plist", SettingProvider.class)];

   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

+ (NSString *)version {
   
   return [[SettingProvider sharedInstance] version];
}

- (NSString *)version {
   
   return [NSUserDefaults stringForKey:@"version"];
}

+ (void)setVersion:(NSString *)aVersion {
   
   [[SettingProvider sharedInstance] setVersion:aVersion];
   
   return;
}

- (void)setVersion:(NSString *)aVersion {
   
   [NSUserDefaults setObject:aVersion forKey:@"version"];
   
   return;
}

+ (BOOL)isIntroduction {
   
   return [[SettingProvider sharedInstance] isIntroduction];
}

- (BOOL)isIntroduction {
   
   return [NSUserDefaults boolForKey:@"isIntroduction"];
}

+ (void)setIntroduction:(BOOL)aIntroduction {
   
   [[SettingProvider sharedInstance] setIntroduction:aIntroduction];

   return;
}

- (void)setIntroduction:(BOOL)aIntroduction {
   
   [NSUserDefaults setBool:aIntroduction forKey:@"isIntroduction"];

   return;
}

+ (BOOL)isPrivacy {
   
   return [[SettingProvider sharedInstance] isPrivacy];
}

- (BOOL)isPrivacy {
   
   return [NSUserDefaults boolForKey:@"isPrivacy"];
}

+ (void)setPrivacy:(BOOL)aPrivacy {
   
   [[SettingProvider sharedInstance] setPrivacy:aPrivacy];

   return;
}

- (void)setPrivacy:(BOOL)aPrivacy {
   
   [NSUserDefaults setBool:aPrivacy forKey:@"isPrivacy"];

   return;
}

+ (BOOL)isTracking {
   
   return [[SettingProvider sharedInstance] isTracking];
}

- (BOOL)isTracking {
   
   return [NSUserDefaults boolForKey:@"isTracking"];
}

+ (void)setTracking:(BOOL)aTracking {
   
   [[SettingProvider sharedInstance] setTracking:aTracking];

   return;
}

- (void)setTracking:(BOOL)aTracking {
   
   [NSUserDefaults setBool:aTracking forKey:@"isTracking"];

   return;
}

+ (BOOL)isTabbarAnimation {
   
   return [[SettingProvider sharedInstance] isTabbarAnimation];
}

- (BOOL)isTabbarAnimation {
   
   return [NSUserDefaults boolForKey:@"isTabbarAnimation"];
}

+ (void)setTabbarAnimation:(BOOL)aAnimation {
   
   [[SettingProvider sharedInstance] setTabbarAnimation:aAnimation];

   return;
}

- (void)setTabbarAnimation:(BOOL)aAnimation {
   
   [NSUserDefaults setBool:aAnimation forKey:@"isTabbarAnimation"];

   return;
}

+ (BOOL)isAutoTheme {
   
   return [[SettingProvider sharedInstance] isAutoTheme];
}

- (BOOL)isAutoTheme {
   
   return [NSUserDefaults boolForKey:@"isAutoTheme"];
}

+ (void)setAutoTheme:(BOOL)aAnimation {
   
   [[SettingProvider sharedInstance] setAutoTheme:aAnimation];

   return;
}

- (void)setAutoTheme:(BOOL)aAnimation {
   
   [NSUserDefaults setBool:aAnimation forKey:@"isAutoTheme"];

   return;
}

+ (BOOL)isHaptics {
   
   return [[SettingProvider sharedInstance] isHaptics];
}

- (BOOL)isHaptics {
   
   return [NSUserDefaults boolForKey:@"isHaptics"];
}

+ (void)setHaptics:(BOOL)aHaptics {
   
   [[SettingProvider sharedInstance] setHaptics:aHaptics];

   return;
}

- (void)setHaptics:(BOOL)aHaptics {
   
   [NSUserDefaults setBool:aHaptics forKey:@"isHaptics"];

   return;
}

+ (BOOL)isApiKeySetting {
   
   return [[SettingProvider sharedInstance] isApiKeySetting];
}

- (BOOL)isApiKeySetting {
   
   return [NSUserDefaults boolForKey:@"isApiKeySetting"];
}

+ (void)setApiKeySetting:(BOOL)aApiKeyOpened {
   
   [[SettingProvider sharedInstance] setApiKeySetting:aApiKeyOpened];
   
   return;
}

- (void)setApiKeySetting:(BOOL)aApiKeyOpened {
   
   [NSUserDefaults setBool:aApiKeyOpened forKey:@"isApiKeySetting"];
   
   return;
}

+ (BOOL)isICMPEnable {
   
   return [[SettingProvider sharedInstance] isICMPEnable];
}

- (BOOL)isICMPEnable {
   
   return [NSUserDefaults boolForKey:@"isICMPEnable"];
}

+ (void)setICMPEnable:(BOOL)aICMPEnable {
   
   [[SettingProvider sharedInstance] setICMPEnable:aICMPEnable];

   return;
}

- (void)setICMPEnable:(BOOL)aICMPEnable {
   
   [NSUserDefaults setBool:aICMPEnable forKey:@"isICMPEnable"];
   
   return;
}

+ (NSTimeInterval)activeTime {
   
   return [[SettingProvider sharedInstance] activeTime];
}

- (NSTimeInterval)activeTime {
   
   return [NSUserDefaults doubleForKey:@"activeTime"];
}

+ (void)setActiveTime:(NSTimeInterval)aActiveTime {
   
   [[SettingProvider sharedInstance] setActiveTime:aActiveTime];
   
   return;
}

- (void)setActiveTime:(NSTimeInterval)aActiveTime {
   
   [NSUserDefaults setDouble:aActiveTime forKey:@"activeTime"];
   
   return;
}

+ (NSString *)xmlApiKey {
   
   return [[SettingProvider sharedInstance] xmlApiKey];
}

- (NSString *)xmlApiKey {
   
   return [NSUserDefaults stringForKey:@"xmlApiKey"];
}

+ (void)setXmlApiKey:(NSString *)aXmlApiKey {
   
   [[SettingProvider sharedInstance] setXmlApiKey:aXmlApiKey];

   return;
}

- (void)setXmlApiKey:(NSString *)aXmlApiKey {
   
   [NSUserDefaults setObject:aXmlApiKey forKey:@"xmlApiKey"];
   
   return;
}

@end

@implementation SettingProvider (Locale)

+ (NSString *)currentLocalization {
   
   int                            nErr                                     = EFAULT;
   
   NSString                      *szLocalization                           = nil;
   
   NSLocale                      *stLocale                                 = [NSLocale currentLocale];
   NSString                      *szCountryCode                            = nil;
   
   __TRY;
      
   if (!kStringIsBlank(stLocale.collatorIdentifier) && !kStringIsBlank(stLocale.countryCode)) {
      
      szCountryCode  = [NSString stringWithFormat:@"-%@", stLocale.countryCode];
      szLocalization = [stLocale.collatorIdentifier replaceAll:szCountryCode with:@""];
      
   } /* End if () */
   
   __CATCH(nErr);

   return szLocalization;
}

+ (NSArray<NSString *> *)localizations {
   
   return [SettingProvider sharedInstance].localizations;
}

+ (NSString *)localization {
   
   return [SettingProvider localization:NSLocale.currentLocale];
}

+ (NSString *)localization:(NSLocale *)aLocale {

   if ([[SettingProvider localizations] containsObject:[SettingProvider currentLocalization]]) {
      
      return [SettingProvider currentLocalization];
      
   } /* End if () */
      
   return [SettingProvider localizations][0];
}

@end

@implementation SettingProvider (Notification)

+ (NSString *)tabAnimationNotification {
   
   return @"tabAnimation@SettingProvider";
}

+ (NSString *)hapticsNotification {
   
   return @"haptics@SettingProvider";
}

+ (NSString *)appRateOnStoreNotification {
   
   return @"appRateOnStore@SettingProvider";
}

+ (NSString *)apiKeySettingNotification {
   
   return @"apiKeySetting@SettingProvider";
}

@end
