//
//  DNSModel.h
//  NetworkArch
//
//  Created by Harry on 2021/8/16.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DNSModel : NSObject

@property (nonatomic, copy)                  NSString                            * dnsType;

@property (nonatomic, copy)                  NSString                            * name;
@property (nonatomic, copy)                  NSString                            * ttl;

@property (nonatomic, copy)                  NSString                            * address;
@property (nonatomic, copy)                  NSString                            * target;
@property (nonatomic, copy)                  NSString                            * rawText;
@property (nonatomic, copy)                  NSString                            * admin;
@property (nonatomic, copy)                  NSString                            * host;
@property (nonatomic, copy)                  NSString                            * expire;
@property (nonatomic, copy)                  NSString                            * minimum;
@property (nonatomic, copy)                  NSString                            * retry;
@property (nonatomic, copy)                  NSString                            * refresh;
@property (nonatomic, copy)                  NSString                            * serial;
@property (nonatomic, copy)                  NSString                            * priority;

@property (nonatomic, strong)                NSArray<NSString *>                 * strings;

@end

@interface DNSModel ()

- (NSString *)content;

@end

NS_ASSUME_NONNULL_END
