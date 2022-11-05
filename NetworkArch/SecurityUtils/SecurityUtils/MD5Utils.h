//
//  MD5Utils.h
//  SecurityUtils
//
//  Created by p on 2019/7/15.
//  Copyright © 2019 Reese. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MD5Utils : NSObject

+ (NSData *)getMD5DataWithData:(NSData *)data;
+ (NSData *)getMD5DataWithString:(NSString *)string;
+ (NSString *)getMD5StringWithString:(NSString *)string;
+ (NSString *)getMD5StringWithData:(NSData *)data;

@end

NS_ASSUME_NONNULL_END
