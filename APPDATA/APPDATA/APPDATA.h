//
//  APPDATA.h
//  APPDATA
//
//  Created by Harry on 2020/1/14.
//  Copyright © 2020 Harry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface APPDATA : NSObject

+ (NSString *)xmlAPIKey;

+ (NSString *)privacy;
+ (NSString *)introduction;

@end

@interface APPDATA ()

+ (BOOL)whoisXmlApi;

@end

@interface APPDATA ()

+ (NSString *)introductionFile:(NSString *)aIntroductionName;

@end

NS_ASSUME_NONNULL_END


