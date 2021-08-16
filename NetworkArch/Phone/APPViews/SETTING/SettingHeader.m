//
//  SettingHeader.m
//  SETTING
//
//  Created by Harry on 2021/02/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "SettingHeader.h"

@interface SettingHeader ()

@end

@implementation SettingHeader

- (void)dealloc {
   
   __LOG_FUNCTION;
   
   // Custom dealloc
   
   [self removeAllSignalResponders];
   [self unobserveAllNotifications];

   __SUPER_DEALLOC;
   
   return;
}

- (void)awakeFromNib {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super awakeFromNib];
   // Initialization code
   
   [self setBackgroundColor:UIColor.clearColor];
   [self.contentView setBackgroundColor:UIColor.clearColor];
   
   [self.titleLabel setBackgroundColor:UIColor.clearColor];
   [self.titleLabel setFont:[APPFont lightFontOfSize:self.titleLabel.font.pointSize]];

   [self.showAllLabel setBackgroundColor:UIColor.clearColor];
   [self.showAllLabel setFont:[APPFont lightFontOfSize:self.showAllLabel.font.pointSize]];

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
   
   return @"SETTING-HEADER";
}

@end
