//
//  LanScanCell.m
//  NetworkArch
//
//  Created by Harry on 2021/10/12.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "LanScanCell.h"

@interface LanScanCell ()

@property (nonatomic, copy)                  NSString                            * IP;

@end

@implementation LanScanCell

- (void)dealloc {

   __LOG_FUNCTION;

   // Custom dealloc

   __SUPER_DEALLOC;

   return;
}

- (instancetype)initWithCoder:(NSCoder *)aCoder {

   int                            nErr                                     = EFAULT;

   __TRY;

   self  = [super initWithCoder:aCoder];
   // Dispose of any resources that can be recreated.
   
   if (self) {

   } /* End if () */

   __CATCH(nErr);

   return self;
}

- (void)awakeFromNib {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super awakeFromNib];
   
   // Initialization code
   [self setBackgroundColor:UIColor.clearColor];
   [self.contentView setBackgroundColor:UIColor.clearColor];
   
   self.selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];// 这句不可省略
//   [self.selectedBackgroundView setSize:CGSizeZero];
   [self.selectedBackgroundView setBackgroundColor:UIColor.clearColor];
   [self.selectedBackgroundView setClipsToBounds:YES];

   LogDebug((@"-[LanScanCell awakeFromNib] : selectionStyle : %d", self.selectionStyle));
   
//   [self.containerView setClipsToBounds:YES];

#if __DEBUG_COLOR__
   [self.containerView setBackgroundColor:UIColor.systemPinkColor];
   [self.separatorView setBackgroundColor:UIColor.whiteColor];
#else /* __DEBUG_COLOR__ */
   [self.containerView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
   [self.separatorView setBackgroundColor:[IDEAColor colorWithKey:[IDEAColor separator]]];
#endif /* !__DEBUG_COLOR__ */

//   [self.containerView setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];
//   [self.containerView setCornerRadius:8 clipsToBounds:YES];

   self.containerView.layer.mask = nil;

   [self.rightIcon setBackgroundColor:UIColor.clearColor];
   [self.rightIcon setTintColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return UIColor.whiteColor;
         
      } /* End if () */
      else {
         
         return UIColor.blackColor;
         
      }/* End else */
   }];
   
   [self.rightIcon setHidden:YES];

   __CATCH(nErr);
   
   return;
}

- (void)setHighlighted:(BOOL)aHighlighted animated:(BOOL)aAnimated {
   
   int                            nErr                                     = EFAULT;

   __TRY;

   LogDebug((@"-[LanScanCell setHighlighted:animated:] : Highlighted : %d", aHighlighted));
   
   if (aHighlighted) {

   } /* End if () */
   else {

      [self.selectedColorView setBackgroundColor:UIColor.clearColor];

   } /* End else */

   // 无法选中
   if (nil == self.selectedColorView) {
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */
   
   [super setHighlighted:aHighlighted animated:aAnimated];

   // Configure the view for the highlighted state
   if (aHighlighted) {

      [self.selectedColorView setBackgroundColor:UIColor.systemBlueColor];

   } /* End if () */

   __CATCH(nErr);
   
   return;
}

- (void)setSelected:(BOOL)aSelected animated:(BOOL)aAnimated {

   int                            nErr                                     = EFAULT;

   __TRY;

   LogDebug((@"-[LanScanCell setSelected:animated:] : Selected : %d", aSelected));

   if (aSelected) {

   } /* End if () */
   else {

      [self.selectedColorView setBackgroundColor:UIColor.clearColor];

   } /* End else */

   // 无法选中
   if (nil == self.selectedColorView) {

      nErr  = noErr;
      
      break;
      
   } /* End if () */

   [super setSelected:aSelected animated:aAnimated];

   // Configure the view for the selected state

   if (aSelected) {

      [self.selectedColorView setBackgroundColor:UIColor.systemBlueColor];

   } /* End if () */
   else {

      [self.selectedColorView setBackgroundColor:UIColor.clearColor];

   } /* End else */
   
   __CATCH(nErr);
   
   return;
}

- (void)setRectCorner:(UIRectCorner)aRectCorner {
   
   _rectCorner = aRectCorner;
   
   [self setNeedsDisplay];

   return;
}

- (void)drawRect:(CGRect)aRect {
   
   int                            nErr                                     = EFAULT;

   __TRY;
   
   [super drawRect:aRect];
   
   if (0 != self.rectCorner) {
      
      [self.containerView setRectCorner:self.rectCorner radius:8];

   } /* End if () */
   else {

      self.containerView.layer.mask = nil;

   } /* End else */
   
   __CATCH(nErr);

   return;
}

- (void)setIP:(NSString *)aIP {
   
   _IP   = aIP;
   
   [self.ipLabel setText:aIP];
   
   return;
}

@end
