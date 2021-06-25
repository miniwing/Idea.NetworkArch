//
//  APPDATA.m
//  APPDATA
//
//  Created by Harry on 2020/1/14.
//  Copyright © 2020 Harry. All rights reserved.
//

#import "APPDATA.h"

@implementation APPDATA

#pragma mark - Bundle
+ (NSString *)bundleName {
   
   return @"APPDATA";
}

+ (NSBundle *)bundle {
   
   return [self bundleNamed:[APPDATA bundleName]];
}

+ (NSBundle *)bundleNamed:(NSString *)aBundleName {
   
   static   NSBundle       *g_BUNDLE;
   static   dispatch_once_t stOnceToken;
   
   dispatch_once(&stOnceToken, ^{
      NSBundle *stBaseBundle  = [NSBundle bundleForClass:[APPDATA class]];
      NSString *szBundlePath  = [stBaseBundle pathForResource:aBundleName ofType:@"bundle"];
      g_BUNDLE = [NSBundle bundleWithPath:szBundlePath];
   });
   
   return g_BUNDLE;
}

+ (NSString *)pathForName:(NSString *)aName {
   
   NSBundle *stBundle = [APPDATA bundle];
   NSAssert(stBundle, @"Missing bundle %@ containing icon %@.", stBundle, aName);
   return [stBundle pathForResource:aName ofType:nil];
}

#pragma mark - xmlApi
+ (NSString *)xmlAPIKey {
   
   return @"at_wa51HmNxHCpSNqTTi1UFv38wluCtf";
}

#pragma mark - HTML
+ (NSString *)htmlFile:(NSString *)aHtmlName {
   
   NSString    *szPath     = [self pathForName:aHtmlName];
   LogDebug((@"-[APPDATA htmlFile:] : HTML : %@", szPath));
   
   NSString     *szContent = [NSString stringWithContentsOfFile:szPath
                                                       encoding:NSUTF8StringEncoding
                                                          error:nil];
   
   return szContent;
}

#pragma mark - Tracking
+ (NSString *)tracking {
   
   return @"TRACKING.json";
}

+ (NSString *)trackingFile:(NSString *)aTrackingName {
   
   NSString    *szPath     = [self pathForName:aTrackingName];
   LogDebug((@"-[APPDATA trackingPath:] : HTML : %@", szPath));
   
   NSString     *szContent = [NSString stringWithContentsOfFile:szPath
                                                       encoding:NSUTF8StringEncoding
                                                          error:nil];
   
   return szContent;
}

@end
