//
//  AppTracking.m
//  APPDATA
//
//  Created by Harry on 2021/6/26.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "APPDATA.h"
#import "AppTracking.h"

#pragma mark - Tracking
@implementation Tracking

@end

@interface AppTracking () <YYModel>

@end

#pragma mark - AppTracking
@implementation AppTracking

+ (nullable NSDictionary*)modelContainerPropertyGenericClass {
   
   return @{
      @"trackings"   : [Tracking class],
   };
}

- (id)copyWithZone:(NSZone *)aZone {
   
   AppTracking *stAppTracking = [[AppTracking allocWithZone:aZone] init];
   
   if (stAppTracking) {
      
      stAppTracking  = [self modelCopy];
      
   } /* End if () */
   
   return stAppTracking;
}

+ (instancetype)appTracking {
   
   int                            nErr                                     = EFAULT;
   
   NSString                      *szJSON                                   = nil;
   
   AppTracking                   *stAppTracking                            = nil;
   
   __TRY;

   LogDebug((@"+[AppTracking appTracking] : tracking : %@", [APPDATA tracking]));
   szJSON   = [APPDATA trackingFile:[APPDATA tracking]];

   LogDebug((@"+[AppTracking appTracking] : JSON : %@", szJSON));
   
   stAppTracking  = [AppTracking modelWithJSON:szJSON];

   __CATCH(nErr);
   
   return stAppTracking;
}

@end
