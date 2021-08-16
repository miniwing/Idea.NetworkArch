//
//  WhoisManager.h
//  NetworkArch
//
//  Created by Harry on 2021/8/16.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WhoisManager : NSObject

@end

@interface WhoisManager ()

+ (void)fetchWhoisForDomain:(NSString *)aDomain
          completionHandler:(void (^)(NSData * aData, NSURLResponse * aResponse, NSError * aError))aCompletionHandler;

+ (NSString *)whoisURL;
+ (NSString *)whoisURLWithKey:(NSString *)aKey;

@end

NS_ASSUME_NONNULL_END
