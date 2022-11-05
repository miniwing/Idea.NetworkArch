//
//  WoLANPacket.m
//  NetworkArch
//
//  Created by Harry on 2021/8/19.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WoLANPacket.h"

@interface WoLANPacket ()

@end

@implementation WoLANPacket

- (void)dealloc {
   
   __LOG_FUNCTION;

   // Custom dealloc

   __SUPER_DEALLOC;

   return;
}

- (instancetype)initWithMac:(NSString *)aMAC sent:(BOOL)aSent {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   self  = [super init];
   
   if (self) {
      
      _mac  = aMAC;
      _sent = aSent;
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

+ (instancetype)packetWithMac:(NSString *)aMAC sent:(BOOL)aSent {
   
   return [[WoLANPacket alloc] initWithMac:aMAC sent:aSent];
}

@end
