//
//  DeviceAwake.m
//  NetworkArch
//
//  Created by Harry on 2021/8/13.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "DeviceAwake.h"

@interface DeviceAwake ()

+ (NSData *)createMagicPacketForMac:(NSString *)aMac;

@end

@implementation DeviceAwake

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

+ (WakeError)targetWithDevice:(WoLANDevice *)aDevice {
   
   int                            nErr                                     = EFAULT;
   WakeError                      eErr                                     = SocketNoError;
   
   int                            nSocket                                  = -1;
   struct sockaddr_in             stTarget                                 = {0};
   BOOL                           bLittleEndian                            = NO;
   
   NSData                        *stPacket                                 = nil;
   
//   socklen_t                      nSockaddrLen                             = sizeof(struct sockaddr);
//   socklen_t                      nIntLen                                  = sizeof(int);
   
   int                            nBroadcast                               = 1;
   ssize_t                        nSent                                    = -1;

   __TRY;
   
   stTarget.sin_family        = (sa_family_t)(AF_INET);
   stTarget.sin_addr.s_addr   = inet_addr([aDevice.broadcastAddr UTF8String]);
   
   bLittleEndian     = (OSHostByteOrder() == OSLittleEndian);
   stTarget.sin_port = bLittleEndian ? _OSSwapInt16(aDevice.port) : aDevice.port;
   
   // Setup the packet socket
   nSocket = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
   if (0 > nSocket) {
      
      nErr  = errno;
      eErr  = SocketSetupFailed;
      
      break;
      
   } /* End if () */
   
   stPacket = [DeviceAwake createMagicPacketForMac:aDevice.mac];
   
   nErr  = setsockopt(nSocket, SOL_SOCKET, SO_BROADCAST, &nBroadcast, sizeof(nBroadcast));
   if (-1 == nErr) {
      
      nErr  = errno;
      eErr  = SetSocketOptionsFailed;
      
      break;
      
   } /* End if () */

   nSent = sendto(nSocket, stPacket.bytes, stPacket.length, 0, (struct sockaddr *)&stTarget, sizeof(struct sockaddr_in));
   if ((-1 == nSent) || (stPacket.length != nSent)) {
      
      nErr  = errno;
      eErr  = SendMagicPacketFailed;
      
      break;
      
   } /* End if () */
   
   __CATCH(nErr);

   if (-1 != nSocket) {
      
      close(nSocket);
      
   } /* End if () */

   return eErr;
}

+ (NSData *)createMagicPacketForMac:(NSString *)aMac {
   
   int                            nErr                                     = EFAULT;
   
   NSMutableData                 *stMagicPacket                            = nil;
   Byte                           byByte                                   = 0xFF;
   
   NSArray<NSString *>           *stBitMasks                               = nil;
   
   __TRY;
   
   stMagicPacket  = [NSMutableData data];
   
   for (int H = 0; H < 6; ++H) {
      
      [stMagicPacket appendBytes:&byByte length:sizeof(byByte)];
      
   } /* End for () */
   
   stBitMasks  = [aMac split:@":"];
   
   for (NSString *szBitMask in stBitMasks) {
      
      byByte   = [[NSString stringWithFormat:@"0x%@", szBitMask] unsignedCharValue];
      
      [stMagicPacket appendBytes:&byByte length:sizeof(byByte)];
      
   } /* End for () */
   
   __CATCH(nErr);
   
   return stMagicPacket;
}

@end
