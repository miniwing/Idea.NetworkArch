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

+ (nullable NSString *)htmlPath:(NSString * _Nonnull)aHtmlName;
+ (nullable NSString *)htmlFile:(NSString * _Nonnull)aHtmlName;

@end

NS_ASSUME_NONNULL_END
