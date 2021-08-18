//
//  AppIntroduction.h
//  NetworkArch
//
//  Created by Harry on 2021/6/26.
//
//  Mail: miniwing.hz@gmail.com
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Introduction : NSObject

@property (nonatomic, strong)                NSString                            * icon;

@property (nonatomic, strong)                NSString                            * title;
@property (nonatomic, strong)                NSString                            * summary;

@end

@interface AppIntroduction : NSObject

@property (nonatomic, strong)                NSString                            * title;
@property (nonatomic, strong)                NSString                            * summary;
@property (nonatomic, strong)                NSArray<Introduction *>             * introductions;

@end

@interface AppIntroduction ()

+ (instancetype)appIntroduction;

@end

NS_ASSUME_NONNULL_END
