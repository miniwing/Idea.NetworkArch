//
//  AD.h
//  AD
//
//  Created by Harry on 2020/1/14.
//  Copyright © 2020 Harry. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ADMOB_TEST_DEVICE                                            (__Debug__)

NS_ASSUME_NONNULL_BEGIN

@interface AD : NSObject

@end

@interface AD ()

+ (NSDictionary *)admobs;
+ (NSDictionary *)fbans;

@end

NS_ASSUME_NONNULL_END


