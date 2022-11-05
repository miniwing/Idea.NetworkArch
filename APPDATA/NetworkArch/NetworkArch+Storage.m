//
//  NetworkArch+Storage.m
//  APPDATA
//
//  Created by Harry on 2022/11/1.
//

#import "NetworkArch+Storage.h"

@implementation NetworkArch (Storage)

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

+ (BOOL)isICMPEnable {
   
   return [NSUserDefaults boolForKey:@"isApiKeySetting"];
}

+ (void)setICMPEnable:(BOOL)aICMPEnable {
   
   [NSUserDefaults setBool:aICMPEnable forKey:@"isApiKeySetting"];
   
   return;
}

@end
