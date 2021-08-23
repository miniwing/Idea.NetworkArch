//
//  APPDEBUG.m
//  APPDEBUG
//
//  Created by Harry on 2020/1/14.
//  Copyright © 2020 Harry. All rights reserved.
//

#import "APPDEBUG.h"

@implementation APPDEBUG

+ (NSString *)bundleName {
   
   return @"APPDEBUG";
}

+ (NSBundle *)bundle {
   
   return [self bundleNamed:[APPDEBUG bundleName]];
}

+ (nullable NSBundle *)bundleNamed:(nonnull NSString *)aBundleName {
   
   static   NSBundle       *g_BUNDLE;
   static   dispatch_once_t stOnceToken;
   
   dispatch_once(&stOnceToken, ^{
      NSBundle *stBaseBundle  = [NSBundle bundleForClass:[APPDEBUG class]];
      NSString *szBundlePath  = [stBaseBundle pathForResource:aBundleName ofType:@"bundle"];
      g_BUNDLE = [NSBundle bundleWithPath:szBundlePath];
   });
   
   return g_BUNDLE;
}

+ (nonnull NSString *)pathForName:(nonnull NSString *)aName {
   
   NSBundle *stBundle = [APPDEBUG bundle];
   NSAssert(stBundle, @"Missing bundle %@ containing icon %@.", stBundle, aName);
   return [stBundle pathForResource:aName ofType:nil];
}

+ (nullable UIImage *)imageNamed:(NSString *)aName {
   
   UIImage     *stImage = [UIImage imageNamed:aName
                                     inBundle:[APPDEBUG bundle]
                compatibleWithTraitCollection:nil];
   
   return stImage;
}

+ (nullable UIImage *)imageWithContentsOfFile:(NSString *)aName {
   
   NSString    *szPath  = [self pathForName:aName];
   LogDebug((@"PATH : %@", szPath));
   
   UIImage     *stImage = [UIImage imageWithContentsOfFile:szPath];
   
   return stImage;
}

+ (nullable NSString *)filePath:(NSString *)aFileName {
   
   return [self pathForName:aFileName];
}

+ (nullable NSString *)fileContent:(NSString *)aFileName {
   
   NSString    *szPath     = [self pathForName:aFileName];
   LogDebug((@"-[APPDATA fileContent:] : FilePath : %@", szPath));
   
   NSString     *szContent = [NSString stringWithContentsOfFile:szPath
                                                       encoding:NSUTF8StringEncoding
                                                          error:nil];
   
   return szContent;
}

+ (nullable NSData *)fileData:(NSString *)aFileName {
   
   NSString    *szPath  = [self pathForName:aFileName];
   LogDebug((@"-[APPDATA fileContent:] : FilePath : %@", szPath));
   
   NSData      *stData  = [NSData dataWithContentsOfFile:szPath];
   
   return stData;
}

@end
