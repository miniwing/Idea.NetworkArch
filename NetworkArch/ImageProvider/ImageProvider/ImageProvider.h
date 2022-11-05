//
//  ImageProvider.h
//  ImageProvider
//
//  Created by Harry on 2022/3/11.
//
//  Mail: miniwing.hz@gmail.com
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageProvider : NSObject

@end

@interface ImageProvider ()

//+ (instancetype)sharedInstance;

/**
 *  Unavailable initializer
 */
+ (instancetype)new NS_UNAVAILABLE;

/**
 *  Unavailable initializer
 */
- (instancetype)init NS_UNAVAILABLE;

@end

@interface ImageProvider ()

+ (UIImage *)imageNamed:(NSString *)aImage;

@end

NS_ASSUME_NONNULL_END
