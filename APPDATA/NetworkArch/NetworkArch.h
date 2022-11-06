//
//  NetworkArch.h
//  APPDATA
//
//  Created by Harry on 2021/8/24.
//
//  Mail: miniwing.hz@gmail.com
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkArch : NSObject

+ (instancetype)sharedInstance;

@end

@interface NetworkArch ()

+ (NSString *)networkArchApi;

/**
 * 用户自定义 apiKey 开关
 * 1. 用于审核检查。
 * 2. 方便用户主定义参数。
 */
+ (BOOL)apiKey;

/**
 * 服务器配置 apiKey
 * 1. 用于审核检查。
 */
+ (NSString *)xmlApiKey;

@end

NS_ASSUME_NONNULL_END
