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

@implementation APPDelegate (Kit)

+ (NSString *)version {
   
   return [NSUserDefaults stringForKey:@"version"];
}

+ (void)setVersion:(NSString *)aVersion {
   
   [NSUserDefaults setObject:aVersion forKey:@"version"];
   
   return;
}

+ (BOOL)isTabbarAnimation {
   
   return [NSUserDefaults boolForKey:@"isTabbarAnimation"];
}

+ (void)setTabbarAnimation:(BOOL)aAutoTheme {
   
   [NSUserDefaults setBool:aAutoTheme forKey:@"isTabbarAnimation"];
   
   return;
}

+ (BOOL)isAutoTheme {
   
   return [NSUserDefaults boolForKey:@"isAutoTheme"];
}

+ (void)setAutoTheme:(BOOL)aAutoTheme {
   
   [NSUserDefaults setBool:aAutoTheme forKey:@"isAutoTheme"];
   
   return;
}

+ (BOOL)isPrivacy {
   
   return [NSUserDefaults boolForKey:@"isPrivacy"];
}

+ (void)setPrivacy:(BOOL)aPrivacy {
   
   [NSUserDefaults setBool:aPrivacy forKey:@"isPrivacy"];
   
   return;
}

@end
