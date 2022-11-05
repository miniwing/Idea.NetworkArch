//
//  DeviceAwake.h
//  NetworkArch
//
//  Created by Harry on 2021/8/13.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <Foundation/Foundation.h>

#import "WoLANDevice.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, WakeError) {
   
   SocketNoError           = 0,
   SocketSetupFailed       = 1,
   SetSocketOptionsFailed  = 2,
   SendMagicPacketFailed   = 3
};

@interface DeviceAwake : NSObject

@end

@interface DeviceAwake ()

+ (WakeError)targetWithDevice:(WoLANDevice *)aDevice;

@end

NS_ASSUME_NONNULL_END
