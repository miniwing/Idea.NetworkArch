//
//  AD.m
//  AD
//
//  Created by Harry on 2020/1/14.
//  Copyright © 2020 Harry. All rights reserved.
//

#import "AD.h"

@implementation AD

#pragma mark - Bundle
+ (NSString *)bundleName {
   
   return @(BUNDLE);
}

+ (NSBundle *)bundle {
   
   return [self bundleNamed:[AD bundleName]];
}

+ (NSBundle *)bundleNamed:(NSString *)aBundleName {
   
   static   NSBundle       *g_BUNDLE;
   static   dispatch_once_t stOnceToken;
   
   dispatch_once(&stOnceToken, ^{
      
      NSBundle *stBaseBundle  = [NSBundle bundleForClass:AD.class];
      NSString *szBundlePath  = [stBaseBundle pathForResource:aBundleName ofType:@"bundle"];
      g_BUNDLE = [NSBundle bundleWithPath:szBundlePath];
   });
   
   return g_BUNDLE;
}

+ (NSString *)pathForName:(NSString *)aName {
   
   NSBundle *stBundle = [AD bundle];
   NSAssert(stBundle, @"Missing bundle %@ containing icon %@.", stBundle, aName);
   return [stBundle pathForResource:aName ofType:nil];
}

+ (NSDictionary *)admobs {
   
   static dispatch_once_t   onceToken;
   static NSDictionary     *stAdmobs   = nil;
   
   dispatch_once(&onceToken, ^(void) {
      
      NSString *szPath     = [self pathForName:@"Admob.json"];
      LogDebug((@"+[AD admobs:] : ADMOB : %@", szPath));
      
      NSData   *stJSON     = [NSData dataWithContentsOfFile:szPath];
      NSError  *stError    = nil;
      
      stAdmobs = [NSJSONSerialization JSONObjectWithData:stJSON
                                                 options:NSJSONReadingMutableContainers
                                                   error:&stError];
      if (nil != stError) {
         
         LogDebug((@"+[AD admobs:] : json解析失败：%@", stError));
         
      } /* End if () */
   });
   
   return stAdmobs;
}

+ (NSDictionary *)fbans {
   
   static dispatch_once_t   onceToken;
   static NSDictionary     *stFBANs    = nil;
   
   dispatch_once(&onceToken, ^(void) {
      
      NSString *szPath     = [self pathForName:@"FBAN.json"];
      LogDebug((@"+[AD fbans:] : FBAN : %@", szPath));
      
      NSData   *stJSON     = [NSData dataWithContentsOfFile:szPath];
      NSError  *stError    = nil;
      
      stFBANs  = [NSJSONSerialization JSONObjectWithData:stJSON
                                                 options:NSJSONReadingMutableContainers
                                                   error:&stError];
      if (nil != stError) {
         
         LogDebug((@"+[AD fbans:] : json解析失败：%@", stError));
                  
      } /* End if () */
   });
   
   return stFBANs;
}

@end
