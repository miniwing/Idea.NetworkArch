//
//  PingTextField.m
//  NetworkArch
//
//  Created by Harry on 2021/7/29.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "PingTextField.h"

@interface PingTextField ()

@end

@implementation PingTextField

- (CGRect)textRectForBounds:(CGRect)aBounds {
   
   return CGRectInset(aBounds, 10, 0);
   
}

// 控制文本的位置，左右缩 10

- (CGRect)editingRectForBounds:(CGRect)aBounds {
   
   return CGRectInset(aBounds, 10, 0);
   
}

@end
