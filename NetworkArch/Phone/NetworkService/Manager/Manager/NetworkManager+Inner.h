//
//  NetworkManager+Inner.h
//  NetworkService
//
//  Created by Harry on 2022/10/21.
//

#import "NetworkManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager ()

@end

@interface NetworkManager ()

+ (instancetype)sharedInstance;

/**
 *  Unavailable initializer
 */
+ (instancetype)new NS_UNAVAILABLE;

/**
 *  Unavailable initializer
 */
- (instancetype)init NS_UNAVAILABLE;

@end

@interface NetworkManager (Inner)

@end

NS_ASSUME_NONNULL_END
