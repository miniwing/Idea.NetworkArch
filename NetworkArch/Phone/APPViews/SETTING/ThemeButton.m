//
//  ThemeButton.m
//  SETTING
//
//  Created by Harry on 2021/02/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "ThemeButton.h"

const static NSTimeInterval   UIButtonAnimationDuraton   = 0.1f;

@interface ThemeButton ()
//@interface ThemeButton () <XXNibBridge>

//@property (nonatomic, strong)                CALayer                             * maskLayer;

@property (nonatomic, strong)                UIColor                             * titleTextColor;

@end

@implementation ThemeButton

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
   
   [self.imageView setCornerRadius:8];
//   [self.imageView setBorderColor:UIColor.blackColor];
   [self.imageView setBorderColorPicker:DKColorPickerWithKey([IDEAColor systemGray3])];
   [self.imageView setBorderWidth:0.5];
   
   [self.maskView setHidden:YES];
   [self.maskView setCornerRadius:8];
   
   [self addTarget:self action:@selector(onTouchDown:) forControlEvents:UIControlEventTouchDown];
   [self addTarget:self action:@selector(onTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
   [self addTarget:self action:@selector(onTouchUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
   [self addTarget:self action:@selector(onTouchCancel:) forControlEvents:UIControlEventTouchCancel];
   
   [self.titleLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor text])];
   //   [self.titleLabel setFontWithName:[APPFont appFontRegular]];
   [self.titleLabel setBackgroundColor:UIColor.clearColor];
   
   __CATCH(nErr);
   
   return;
}

- (void)onTouchDown:(ThemeButton *)aThemeButton {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [self.maskView setHidden:NO animated:YES duration:UIButtonAnimationDuraton];
   
   self.titleTextColor  = self.titleLabel.textColor;
   
   [UIView transitionWithView:self.titleLabel
                     duration:UIButtonAnimationDuraton
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
//      self.titleLabel.text = rand() % 2 ? @"Nice nice!" : @"Well done!";
      [self.titleLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor text])];
   }
                   completion:nil];
   
   __CATCH(nErr);
   
   return;
}

- (void)onTouchUpInside:(ThemeButton *)aThemeButton {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [self.maskView setHidden:YES animated:YES duration:UIButtonAnimationDuraton];
   
   [UIView transitionWithView:self.titleLabel
                     duration:UIButtonAnimationDuraton
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      [self.titleLabel setTextColor:nil];
   }
                   completion:nil];
   
   [self setSelected:YES];
   
   __CATCH(nErr);
   
   return;
}

- (void)onTouchUpOutside:(ThemeButton *)aThemeButton {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [self.maskView setHidden:YES animated:YES duration:UIButtonAnimationDuraton];
   
   [UIView transitionWithView:self.titleLabel
                     duration:UIButtonAnimationDuraton
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      [self.titleLabel setTextColor:nil];
   }
                   completion:nil];
   
   __CATCH(nErr);
   
   return;
}

- (void)onTouchCancel:(ThemeButton *)aThemeButton {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [self.maskView setHidden:YES animated:YES duration:UIButtonAnimationDuraton];
   
   [UIView transitionWithView:self.titleLabel
                     duration:UIButtonAnimationDuraton
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
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
                   animations:^{
      if (self.isSelected) {
         
         [self.checkImageView setImagePicker:^UIImage *(DKThemeVersion *themeVersion) {
            
            if ([[DKNightVersionManager sharedManager].themeVersion isEqualToString:DKThemeVersionNight]) {
               
               return [UIImage imageNamed:@"ui-selected-on-night"];
               
            } /* End if () */
            else {
               
               return [UIImage imageNamed:@"ui-selected-on-light"];
               
            } /* End else */
         }];
         
      } /* End if () */
      else {
         
         [self.checkImageView setImagePicker:^UIImage *(DKThemeVersion *themeVersion) {
            
            if ([[DKNightVersionManager sharedManager].themeVersion isEqualToString:DKThemeVersionNight]) {
               
               return [UIImage imageNamed:@"ui-selected-off-night"];
               
            } /* End if () */
            else {
               
               return [UIImage imageNamed:@"ui-selected-off-light"];
               
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

@implementation ThemeButton (UINib)

+ (NSString *)nibName {
   
   return @"THEME-BUTTON";
}
@end
