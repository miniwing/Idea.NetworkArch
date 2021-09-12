//
//  WifiScanResult.h
//  NetworkArch
//
//  Created by Harry on 2021/9/12.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <Foundation/Foundation.h>

#import <IDEALanScan/MMDevice.h>

NS_ASSUME_NONNULL_BEGIN

@interface WifiScanResult : NSObject

@property (nonatomic, weak)                  MMDevice                            * device;

@end

@interface WifiScanResult ()

+ (instancetype)scanResultWithDevice:(MMDevice *)aDevice;

@end

@interface WifiScanResult ()

- (BOOL)isEqual:(id)aObject;

@end

NS_ASSUME_NONNULL_END
