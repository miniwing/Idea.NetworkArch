//
//  WoLANCell.m
//  NetworkArch
//
//  Created by Harry on 2021/8/13.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WoLANCell.h"
#import "WoLANCell+Inner.h"

@implementation WoLANCell

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
   [self.selectedBackgroundView setBackgroundColor:UIColor.clearColor];
   [self.selectedBackgroundView setClipsToBounds:YES];

   [self.containerView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];

   [self.containerView setCornerRadius:8 clipsToBounds:YES];
   
//   [self.macTextField setBorderStyle:UITextBorderStyleNone];
//   [self.broadcastTextField setBorderStyle:UITextBorderStyleNone];
//   [self.portTextField setBorderStyle:UITextBorderStyleNone];

   for (UITextField *stTextField in self.textFields) {
      
      [stTextField setBorderStyle:UITextBorderStyleNone];

      [stTextField setBackgroundColor:UIColor.clearColor];
      
      [stTextField setFont:[APPFont regularFontOfSize:stTextField.font.pointSize]];
      [stTextField setTextColorPicker:DKColorPickerWithKey([IDEAColor placeholderText])];
      
      [stTextField setPlaceholderColorPicker:DKColorPickerWithKey([IDEAColor placeholderText])];

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
      if ([stTextField respondsToSelector:@selector(setPlaceholderColor:)]) {
         
         [stTextField performSelector:@selector(setPlaceholderColor:) withObject:[IDEAColor colorWithKey:[IDEAColor placeholderText]]];

      } /* End if () */
#pragma clang diagnostic pop
      
      [stTextField setDelegate:self];

   } /* End for () */
   
   for (UIView *stView in self.separatorViews) {
      
#if __DEBUG_COLOR__
      [stView setBackgroundColor:UIColor.systemOrangeColor];
#else /* __DEBUG_COLOR__ */
      [stView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor separator])];
#endif /* !__DEBUG_COLOR__ */
      
   } /* End for () */

   __CATCH(nErr);

   return;
}

- (void)setSelected:(BOOL)aSelected animated:(BOOL)aAnimated {

   int                            nErr                                     = EFAULT;

   __TRY;

   [super setSelected:aSelected animated:aAnimated];

   // Configure the view for the selected state

   __CATCH(nErr);
   
   return;
}

@end
