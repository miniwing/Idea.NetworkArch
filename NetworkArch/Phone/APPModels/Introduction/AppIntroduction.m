//
//  AppIntroduction.m
//  NetworkArch
//
//  Created by Harry on 2021/6/26.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "APPDATA.h"
#import "AppIntroduction.h"

#pragma mark - Introduction
@implementation Introduction

@end

@interface AppIntroduction () <YYModel>

@end

#pragma mark - AppIntroduction
@implementation AppIntroduction

+ (nullable NSDictionary*)modelContainerPropertyGenericClass {
   
   return @{
      @"introductions"   : [Introduction class],
   };
}

- (id)copyWithZone:(NSZone *)aZone {
   
   AppIntroduction *stAppIntroduction = [[AppIntroduction allocWithZone:aZone] init];
   
   if (stAppIntroduction) {
      
      stAppIntroduction  = [self modelCopy];
      
   } /* End if () */
   
   return stAppIntroduction;
}

+ (instancetype)appIntroduction {
   
   int                            nErr                                     = EFAULT;
   
   NSString                      *szJSON                                   = nil;
   
   AppIntroduction               *stAppIntroduction                        = nil;
   
   __TRY;
   
   LogDebug((@"+[AppIntroduction appIntroduction] : introduction : %@", [APPDATA introduction]));
   szJSON   = [APPDATA introductionFile:[APPDATA introduction]];
   
   LogDebug((@"+[AppIntroduction appIntroduction] : JSON : %@", szJSON));
   
   stAppIntroduction  = [AppIntroduction modelWithJSON:szJSON];
   
   __CATCH(nErr);
   
   return stAppIntroduction;
}

@end
