//
//  APPDEBUG.h
//  APPDEBUG
//
//  Created by Harry on 2020/1/14.
//  Copyright © 2020 Harry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface APPDEBUG : NSObject

+ (nullable UIImage *)imageNamed:(NSString *)aName;
+ (nullable UIImage *)imageWithContentsOfFile:(NSString *)aName;

+ (nullable NSString *)filePath:(NSString *)aFileName;
+ (nullable NSString *)fileContent:(NSString *)aFileName;
+ (nullable NSData   *)fileData:(NSString *)aFileName;

@end

NS_ASSUME_NONNULL_END
