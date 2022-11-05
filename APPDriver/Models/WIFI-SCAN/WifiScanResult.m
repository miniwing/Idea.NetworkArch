//
//  WifiScanResult.m
//  NetworkArch
//
//  Created by Harry on 2021/9/12.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WifiScanResult.h"

@interface WifiScanResult ()

@end

@implementation WifiScanResult

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
            
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (instancetype)initWithDevice:(MMDevice *)aDevice {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;
   
   self  = [super init];
   
   if (nil != self) {
      
      _device  = aDevice;
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

+ (instancetype)scanResultWithDevice:(MMDevice *)aDevice {
   
   return [[WifiScanResult alloc] initWithDevice:aDevice];
}

- (BOOL)isEqual:(id)aObject {
   
   int                            nErr                                     = EFAULT;
   
   BOOL                           bEqual                                   = NO;

   __TRY;

   if ([aObject isKindOfClass:MMDevice.class]) {
      
      bEqual   = [self.device isEqual: aObject];
      
   } /* End if () */
   else {
      
      bEqual   = (self == aObject);
      
   } /* End else */
   
   __CATCH(nErr);
   
   return bEqual;
}

@end
