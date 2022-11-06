//
//  NetworkArch.m
//  APPDATA
//
//  Created by Harry on 2021/8/24.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "NetworkArch.h"

@interface NetworkArch ()

@property (nonatomic, assign)                BOOL                                  apiKey;
@property (nonatomic, copy)                  NSString                            * build;

@property (nonatomic, strong)                NSArray<NSString *>                 * xmlApiKeys;

@end

@implementation NetworkArch

+ (instancetype)sharedInstance {

   static dispatch_once_t         stOnce;
   static __strong NetworkArch   *g_NetworkArch = nil;
   
   dispatch_once(&stOnce, ^{
      
      g_NetworkArch  = [[NetworkArch alloc] init];
   });
   
   return g_NetworkArch;
}

#pragma mark - Bundle
+ (NSString *)bundleName {
   
   return @(BUNDLE);
}

+ (NSBundle *)bundle {
   
   return [self bundleNamed:[self bundleName]];
}

+ (NSBundle *)bundleNamed:(NSString *)aBundleName {
   
   static   NSBundle       *g_BUNDLE;
   static   dispatch_once_t stOnceToken;
   
   dispatch_once(&stOnceToken, ^{
      
      NSBundle *stBaseBundle  = [NSBundle bundleForClass:NetworkArch.class];
      NSString *szBundlePath  = [stBaseBundle pathForResource:aBundleName ofType:@"bundle"];
      g_BUNDLE = [NSBundle bundleWithPath:szBundlePath];
   });
   
   return g_BUNDLE;
}

+ (NSString *)pathForName:(NSString *)aName {
   
   NSBundle *stBundle = [self bundle];
   NSAssert(stBundle, @"Missing bundle %@ containing icon %@.", stBundle, aName);
   return [stBundle pathForResource:aName ofType:nil];
}

+ (NSString *)networkArchApi {
   
   //   return @"https://raw.githubusercontent.com/miniwing/injoy/master/injoy.fun.json";
   //   return @"https://raw.githubusercontent.com/miniwing/APP-DATA/master/NetworkArch/NetworkArch.json";
   //   return @"https://gitlab.com/miniwing/APP-DATA/-/raw/master/NetworkArch/NetworkArch.json";
   return @"https://gitlab.com/miniwing/APP-DATA/-/raw/master/NetworkArch/api-setting.json";
}

+ (BOOL)apiKey {
   
   return [NetworkArch sharedInstance].apiKey;
}

+ (NSArray<NSString *> *)xmlApiKeys {
   
   return [NetworkArch sharedInstance].xmlApiKeys;
}

+ (NSString *)xmlApiKey {
   
   if (0 == [NetworkArch xmlApiKeys].count) {
      
      return nil;
      
   } /* End if () */
   
   return [[NetworkArch xmlApiKeys] objectAtIndex:(arc4random() % [NetworkArch xmlApiKeys].count)];
}

@end
