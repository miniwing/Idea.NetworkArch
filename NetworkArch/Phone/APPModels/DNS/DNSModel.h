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

@property (nonatomic, copy)                  NSString                            * DNSTypeDomainName;
@property (nonatomic, copy)                  NSString                            * aDNSTypeTTL;

@property (nonatomic, copy)                  NSString                            * DNSTypeAddress;

@end

@interface DNSModel ()

@end

NS_ASSUME_NONNULL_END
