//
//  NetworkArch.h
//  Pods
//
//  Created by Harry on 2021/8/24.
//
//  Mail: miniwing.hz@gmail.com
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkArch : NSObject

@property (nonatomic, assign)                BOOL                                  apiKey;
@property (nonatomic, copy)                  NSString                            * version;
@property (nonatomic, copy)                  NSString                            * build;

@end

@interface NetworkArch ()

+ (NSString *)networkArchApi;

@end

NS_ASSUME_NONNULL_END
