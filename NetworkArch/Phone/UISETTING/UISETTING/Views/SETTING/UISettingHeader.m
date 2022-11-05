//
//  UISettingHeader.m
//  SETTING
//
//  Created by Harry on 2021/02/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "UISettingHeader.h"

@interface UISettingHeader ()

@end

@implementation UISettingHeader

- (void)dealloc {
   
   __LOG_FUNCTION;
   
   // Custom dealloc
   [self unobserveAllNotifications];
   [self removeAllSignalResponders];
      
   [self removeAllNotifications];

   __SUPER_DEALLOC;
   
   return;
}

- (void)awakeFromNib {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super awakeFromNib];
// Initialization code
   
   [self setBackgroundColor:UIColor.clearColor];
   [self setBackgroundView:[UIView new]];
   [self.contentView setBackgroundColor:UIColor.clearColor];
   
   [self.titleLabel setBackgroundColor:UIColor.clearColor];
//   [self.titleLabel setFont:[APPFont lightFontOfSize:self.titleLabel.font.pointSize]];
   [self.titleLabel setFont:[UIFont systemFontOfSize:self.titleLabel.font.pointSize
                                              weight:UIFontWeightRegular]];

   [self.showAllLabel setBackgroundColor:UIColor.clearColor];
//   [self.showAllLabel setFont:[APPFont lightFontOfSize:self.showAllLabel.font.pointSize]];
   [self.showAllLabel setFont:[UIFont systemFontOfSize:self.showAllLabel.font.pointSize
                                                weight:UIFontWeightRegular]];

   [self.iconImageView setBackgroundColor:UIColor.clearColor];
   
   __CATCH(nErr);
   
   return;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)aRect {
 
 // Drawing code
 }
 */

#pragma mark - NIB
+ (NSString *)nibName {
   
   return @"UISETTING-HEADER";
}

@end
