//
//  WoLANDevice.m
//  NetworkArch
//
//  Created by Harry on 2021/8/13.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WoLANDevice.h"

@interface WoLANDevice ()

@end

@implementation WoLANDevice

- (void)dealloc {
   
   __LOG_FUNCTION;

   // Custom dealloc

   __SUPER_DEALLOC;

   return;
}

+ (instancetype)deviceWithMac:(NSString *)aMac broadcastAddr:(NSString *)aBroadcastAddr port:(UInt16)aPort {
 
   return [[WoLANDevice alloc] initWithMac:aMac broadcastAddr:aBroadcastAddr port:aPort];
}

- (instancetype)initWithMac:(NSString *)aMac broadcastAddr:(NSString *)aBroadcastAddr port:(UInt16)aPort {

   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   self  = [super init];
   
   if (self) {

      _mac           = [aMac copy];
      _broadcastAddr = [aBroadcastAddr copy];
      _port          = aPort;
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

@end
