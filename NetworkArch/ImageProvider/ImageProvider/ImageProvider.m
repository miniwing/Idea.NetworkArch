//
//  ImageProvider.m
//  ImageProvider
//
//  Created by Harry on 2022/3/11.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "ImageProvider.h"

@interface ImageProvider ()

@end

@implementation ImageProvider

+ (UIImage *)imageNamed:(NSString *)aImage {
   
   return __IMAGE_NAMED_IN_BUNDLE(aImage, self.class);
}

@end
