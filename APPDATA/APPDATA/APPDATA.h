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

+ (NSString *)tracking;
+ (NSString *)introduction;

@end

@interface APPDATA ()

+ (NSString *)htmlFile:(NSString *)aHtmlName;

+ (NSString *)trackingFile:(NSString *)aTrackingName;
+ (NSString *)introductionFile:(NSString *)aIntroductionName;

@end

NS_ASSUME_NONNULL_END


