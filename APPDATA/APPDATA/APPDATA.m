//
//  APPDATA.m
//  APPDATA
//
//  Created by Harry on 2020/1/14.
//  Copyright © 2020 Harry. All rights reserved.
//

#import "APPDATA.h"

@implementation APPDATA

+ (NSString *)bundleName {
   
   return @"APPDATA";
}

+ (NSBundle *)bundle {
   
   return [self bundleNamed:[APPDATA bundleName]];
}

+ (nullable NSBundle *)bundleNamed:(nonnull NSString *)aBundleName {
   
   static   NSBundle       *g_BUNDLE;
   static   dispatch_once_t stOnceToken;
   
   dispatch_once(&stOnceToken, ^{
      NSBundle *stBaseBundle  = [NSBundle bundleForClass:[APPDATA class]];
      NSString *szBundlePath  = [stBaseBundle pathForResource:aBundleName ofType:@"bundle"];
      g_BUNDLE = [NSBundle bundleWithPath:szBundlePath];
   });
   
   return g_BUNDLE;
}

+ (nonnull NSString *)pathForName:(nonnull NSString *)aName {
   
   NSBundle *stBundle = [APPDATA bundle];
   NSAssert(stBundle, @"Missing bundle %@ containing icon %@.", stBundle, aName);
   return [stBundle pathForResource:aName ofType:nil];
}

+ (nullable NSString *)htmlPath:(NSString *)aHtmlName {
   
   return [self pathForName:aHtmlName];
}

+ (nullable NSString *)htmlFile:(NSString *)aHtmlName {
   
   NSString    *szPath     = [self pathForName:aHtmlName];
   LogDebug((@"-[APPDATA htmlFile:] : HTML : %@", szPath));
   
   NSString     *szContent = [NSString stringWithContentsOfFile:szPath
                                                       encoding:NSUTF8StringEncoding
                                                          error:nil];
   
   return szContent;
}

@end
