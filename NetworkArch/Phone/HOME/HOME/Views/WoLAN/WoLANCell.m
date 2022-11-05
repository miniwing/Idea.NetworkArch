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
#import "WoLANCell+Signal.h"
#import "WoLANCell+Notification.h"

@implementation WoLANCell

- (void)dealloc {

   __LOG_FUNCTION;

   // Custom dealloc
   
   [self removeAllSignalResponders];
   [self unobserveAllNotifications];

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

   for (UITextFieldX *stTextField in self.textFields) {
      
      [stTextField setBorderColor:UIColor.clearColor];
      [stTextField setBorderStyle:UITextBorderStyleNone];

      [stTextField setBackgroundColor:UIColor.clearColor];
      
      [stTextField setFont:[UIFont systemFontOfSize:stTextField.font.pointSize weight:UIFontWeightLight]];
      [stTextField setPlaceholderColorPicker:DKColorPickerWithKey([IDEAColor placeholderText])];

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
      if ([stTextField respondsToSelector:@selector(setPlaceholderColor:)]) {
         
         [stTextField performSelector:@selector(setPlaceholderColor:) withObject:[IDEAColor colorWithKey:[IDEAColor placeholderText]]];

      } /* End if () */
#pragma clang diagnostic pop

      [stTextField setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
      [stTextField setDelegate:self];
      
      [self addNotificationName:UITextFieldTextDidChangeNotification
                       selector:@selector(textFieldTextDidChange:)
                         object:stTextField];

   } /* End for () */
   
   for (UIView *stView in self.separatorViews) {
      
#if __DEBUG_COLOR__
      [stView setBackgroundColor:UIColorX.systemOrangeColor];
#else /* __DEBUG_COLOR__ */
      [stView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor opaqueSeparator])];
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

- (void)setTextChangeBlock:(WoLANTextChangeBlock)aTextChangeBlock {
   
   _textChangeBlock  = [aTextChangeBlock copy];
   
   return;
}

@end
