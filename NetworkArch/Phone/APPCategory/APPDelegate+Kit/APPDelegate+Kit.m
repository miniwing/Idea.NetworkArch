//
//  APPDelegate+Kit.m
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "APPDelegate+Inner.h"
#import "APPDelegate+APP.h"
#import "APPDelegate+Kit.h"

@implementation APPDelegate (System)

+ (NSString *)version {
   
   return [NSUserDefaults stringForKey:@"version"];
}

+ (void)setVersion:(NSString *)aVersion {
   
   [NSUserDefaults setObject:aVersion forKey:@"version"];
   
   return;
}

+ (BOOL)isLaunched {
   
   return [NSUserDefaults boolForKey:@"isLaunched"];
}

+ (void)setLaunched:(BOOL)aLaunched {
   
   [NSUserDefaults setBool:aLaunched forKey:@"isLaunched"];
   
   return;
}

+ (BOOL)isTabbarAnimation {
   
   return [NSUserDefaults boolForKey:@"isTabbarAnimation"];
}

+ (void)setTabbarAnimation:(BOOL)aAnimation {
   
   [NSUserDefaults setBool:aAnimation forKey:@"isTabbarAnimation"];
   
   return;
}

+ (BOOL)isAutoTheme {
   
   return [NSUserDefaults boolForKey:@"isAutoTheme"];
}

+ (void)setAutoTheme:(BOOL)aAutoTheme {
   
   [NSUserDefaults setBool:aAutoTheme forKey:@"isAutoTheme"];
   
   return;
}

+ (BOOL)isTracking {
   
   return [NSUserDefaults boolForKey:@"isTracking"];
}

+ (void)setTracking:(BOOL)aTracking {
   
   [NSUserDefaults setBool:aTracking forKey:@"isTracking"];
   
   return;
}

+ (BOOL)isIntroduced {
   
   return [NSUserDefaults boolForKey:@"isIntroduced"];
}

+ (void)setIntroduced:(BOOL)aIntroduced {
   
   [NSUserDefaults setBool:aIntroduced forKey:@"isIntroduced"];
   
   return;
}

@end

@implementation APPDelegate (Storage)

+ (BOOL)isApiKeySetting {
   
   return [NSUserDefaults boolForKey:@"isApiKeySetting"];
}

+ (void)setApiKeySetting:(BOOL)aApiKeySetting {
   
   [NSUserDefaults setBool:aApiKeySetting forKey:@"isApiKeySetting"];
   
   return;
}

+ (BOOL)isApiKeyOpened {
   
   return [NSUserDefaults boolForKey:@"isApiKeyOpened"];
}

+ (void)setApiKeyOpened:(BOOL)aApiKeyOpened {
   
   [NSUserDefaults setBool:aApiKeyOpened forKey:@"isApiKeyOpened"];
   
   return;
}

+ (NSString *)apiKey {
   
   return [NSUserDefaults stringForKey:@"apiKey"];
}

+ (void)setApiKey:(NSString *)aApiKey {
   
   [NSUserDefaults setObject:aApiKey forKey:@"apiKey"];
   
   return;
}

@end

