//
//  UIThemeButton.m
//  SETTING
//
//  Created by Harry on 2021/02/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import <SettingProvider/SettingProvider.h>
#import <SettingProvider/UISetting.h>

#import "UIThemeButton.h"

const static NSTimeInterval   UIButtonAnimationDuraton   = 0.1f;

@interface UIThemeButton ()
//@interface UIThemeButton () <XXNibBridge>

//@property (nonatomic, strong)                CALayer                             * maskLayer;

@property (nonatomic, strong)                UIColor                             * titleTextColor;

@end

@implementation UIThemeButton

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
   
   [self.imageView setBackgroundColor:UIColor.clearColor];
   [self.titleLabel setBackgroundColor:UIColor.clearColor];
   [self.checkImageView setBackgroundColor:UIColor.clearColor];
   
   [self.imageView setCornerRadius:[UISetting cornerRadiusBig]];
//   [self.imageView setBorderColor:UIColor.blackColor];
   [self.imageView setBorderColorPicker:DKColorPickerWithKey([IDEAColor systemGray3])];
   [self.imageView setBorderWidth:0.5];
   
   [self.maskView setHidden:YES];
   [self.maskView setCornerRadius:[UISetting cornerRadiusBig]];
   
   [self addTarget:self action:@selector(onTouchDown:) forControlEvents:UIControlEventTouchDown];
   [self addTarget:self action:@selector(onTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
   [self addTarget:self action:@selector(onTouchUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
   [self addTarget:self action:@selector(onTouchCancel:) forControlEvents:UIControlEventTouchCancel];
   
   [self.titleLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor text])];
   //   [self.titleLabel setFontWithName:[APPFont appFontRegular]];
   [self.titleLabel setBackgroundColor:UIColor.clearColor];
   
   [self.titleLabel setFont:[UIFont systemFontOfSize:self.titleLabel.font.pointSize
                                              weight:UIFontWeightLight]];

   __CATCH(nErr);
   
   return;
}

- (void)onTouchDown:(UIThemeButton *)aUIThemeButton {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [self.maskView setHidden:NO animated:YES duration:UIButtonAnimationDuraton];
   
   self.titleTextColor  = self.titleLabel.textColor;
   
   [UIView transitionWithView:self.titleLabel
                     duration:UIButtonAnimationDuraton
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^ {
      
      [self.titleLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor text])];
   }
                   completion:nil];
   
   __CATCH(nErr);
   
   return;
}

- (void)onTouchUpInside:(UIThemeButton *)aUIThemeButton {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [self.maskView setHidden:YES animated:YES duration:UIButtonAnimationDuraton];
   
   [UIView transitionWithView:self.titleLabel
                     duration:UIButtonAnimationDuraton
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^ {
      
      [self.titleLabel setTextColor:nil];
   }
                   completion:nil];
   
   [self setSelected:YES];
   
   __CATCH(nErr);
   
   return;
}

- (void)onTouchUpOutside:(UIThemeButton *)aUIThemeButton {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [self.maskView setHidden:YES animated:YES duration:UIButtonAnimationDuraton];
   
   [UIView transitionWithView:self.titleLabel
                     duration:UIButtonAnimationDuraton
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^ {
      
      [self.titleLabel setTextColor:nil];
   }
                   completion:nil];
   
   __CATCH(nErr);
   
   return;
}

- (void)onTouchCancel:(UIThemeButton *)aUIThemeButton {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [self.maskView setHidden:YES animated:YES duration:UIButtonAnimationDuraton];
   
   [UIView transitionWithView:self.titleLabel
                     duration:UIButtonAnimationDuraton
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^ {
   
      [self.titleLabel setTextColor:nil];
   }
                   completion:nil];
   
   __CATCH(nErr);
   
   return;
}

- (void)setSelected:(BOOL)aSelected {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super setSelected:aSelected];
   
   [UIView transitionWithView:self.checkImageView
                     duration:UIButtonAnimationDuraton
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^ {
   
      if (self.isSelected) {
         
         [self.checkImageView setImagePicker:^UIImage *(DKThemeVersion *themeVersion) {
            
            if ([[DKNightVersionManager sharedManager].themeVersion isEqualToString:DKThemeVersionNight]) {
               
               return __IMAGE_NAMED_IN_BUNDLE(@"ui-selected-on-night", self.class);
               
            } /* End if () */
            else {
               
               return __IMAGE_NAMED_IN_BUNDLE(@"ui-selected-on-light", self.class);
               
            } /* End else */
         }];
         
      } /* End if () */
      else {
         
         [self.checkImageView setImagePicker:^UIImage *(DKThemeVersion *themeVersion) {
            
            if ([[DKNightVersionManager sharedManager].themeVersion isEqualToString:DKThemeVersionNight]) {
               
               return __IMAGE_NAMED_IN_BUNDLE(@"ui-selected-off-night", self.class);
               
            } /* End if () */
            else {
                              
               return __IMAGE_NAMED_IN_BUNDLE(@"ui-selected-off-light", self.class);
               
            } /* End else */
         }];
         
      } /* End else */
   }
                   completion:nil];
   
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

@end

@implementation UIThemeButton (UINib)

+ (NSString *)nibName {
   
   return @"UITHEME-BUTTON";
}
@end
