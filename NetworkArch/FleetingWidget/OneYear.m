//
//  OneYear.m
//  FleetingWidget
//
//  Created by Harry on 2021/7/26.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "OneYear.h"
#import "OneYear+Inner.h"

@interface OneYear ()

@end

@implementation OneYear

+ (instancetype)sharedInstance {

   static dispatch_once_t   stOnce;
   static __strong OneYear *g_OneYear  = nil;
   
   dispatch_once(&stOnce, ^{
      
      g_OneYear = [[OneYear alloc] init];
   });
   
   return g_OneYear;
}

- (void)dealloc {
   
   __LOG_FUNCTION;
   
   // Custom dealloc
   
   __SUPER_DEALLOC;
   
   return;
}

- (instancetype)init {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   self  = [super init];
   
   if (self) {
      
      _timeType      = 0;
      _year          = 2018;
      _secondCount   = 1;

      [self initDateParam];

   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (void)initDateParam {
   
   int                            nErr                                     = EFAULT;
   
   NSUserDefaults                *stUserDefaults                           = nil;
   
   NSCalendar                    *stCalendar                               = nil;
   NSDateComponents              *stCurrentDate                            = nil;
   NSDateComponents              *com1                                     = nil;
   NSDateComponents              *com2                                     = nil;
   
   __TRY;
      
   stCalendar     = [NSCalendar currentCalendar];
   
   stCurrentDate  = [stCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                                  fromDate:[NSDate date]];
   
   if (0 >= stCurrentDate.year) {
      
      _year = 2018;
      
   } /* End if () */
   else {
      
      _year = stCurrentDate.year;
      
   } /* End else */
   
   com1  = [[NSDateComponents alloc] init];
   com1.year         = _year;
   com1.month        = 12;
   com1.day          = 31;
   com1.hour         = 23;
   com1.minute       = 59;
   com1.second       = 59;
   com1.nanosecond   = 999999999;
   
   _lastDate      = [stCalendar dateFromComponents:com1];
   
   _lastInterval  = _lastDate.timeIntervalSince1970 * 1000;
   
   _lastDateComponent   = com1;
   
   com2  = [[NSDateComponents alloc] init];
   com2.year         = _year;
   com2.month        = 1;
   com2.day          = 1;
   com2.hour         = 0;
   com2.minute       = 0;
   com2.second       = 0;
   com2.nanosecond   = 1;
   
   _firstDate     = [stCalendar dateFromComponents:com2];
   _firstInterval = _firstDate.timeIntervalSince1970 * 1000;
   _firstDateComponent  = com2;
   
   _oneYear       = _lastInterval - _firstInterval;
   
   stUserDefaults = [NSUserDefaults standardUserDefaults];
   _timeType      = [stUserDefaults integerForKey:OneYear.timeType];
   
   __CATCH(nErr);
   
   return;
}

- (NSString *)currentProgress {
   
   double    dPer = [self currentProgressValue];
   
   if (self.timeType == 0) {
      
      return [NSString stringWithFormat:@"%.7f%%", dPer];
      
   } /* End if () */
   else{
      
      return [NSString stringWithFormat:@"%.2f%%", dPer];

   } /* End else */
}

- (double)currentProgressValue {
   
   NSTimeInterval  nowInterval   = [NSDate date].timeIntervalSince1970 * 1000;
   
   if (nowInterval > _lastInterval) {
      
      [self initDateParam];
      
      return 100.0f;
      
   } /* End if () */
   
   NSTimeInterval  interval      = nowInterval - _firstInterval;
   double          dPer          = interval / _oneYear * 100;
   
   return dPer;
}

@end
