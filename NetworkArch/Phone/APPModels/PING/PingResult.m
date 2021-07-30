//
//  PingResult.m
//  NetworkArch
//
//  Created by Harry on 2021/7/30.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "PingResult.h"

@interface PingResult ()

@end

@implementation PingResult

- (void)dealloc {
   
   __LOG_FUNCTION;

   // Custom dealloc

   __SUPER_DEALLOC;

   return;
}

+ (instancetype)pingResultWithError:(NSError *)aError duration:(NSTimeInterval)aDuration {
   
   return [[PingResult alloc] initWithError:aError duration:aDuration];
}

- (instancetype)initWithError:(NSError *)aError duration:(NSTimeInterval)aDuration {

   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   self  = [super init];
   
   if (self) {

      _error      = aError;
      _duration   = aDuration;
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

@end
