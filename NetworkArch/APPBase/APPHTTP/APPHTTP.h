//
//  APPHTTP.h
//  APPBase
//
//  Created by Harry on 2021/5/6.
//  Copyright © 2021 Harry. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface APPHTTP : NSObject

@end

@interface APPHTTP ()

+ (NSTimeInterval)timeoutInterval;

+ (NSString *)USER_AGENT;
+ (NSString *)AF_USER_AGENT;
+ (NSURLSessionConfiguration *)DEFAULT_SESSION_CONFIGURATION;

@end

NS_ASSUME_NONNULL_END
