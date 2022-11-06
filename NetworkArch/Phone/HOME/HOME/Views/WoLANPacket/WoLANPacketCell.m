//
//  WoLANPacketCell.m
//  NetworkArch
//
//  Created by Harry on 2021/8/19.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WoLANPacketCell.h"
#import "WoLANPacketCell+Inner.h"

@implementation WoLANPacketCell

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

//   [self.containerView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];

//   [self.containerView setCornerRadius:[UISetting cornerRadiusBig] clipsToBounds:YES];

   [self.macLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

#if __DEBUG_COLOR__
   [self.separatorView setBackgroundColor:UIColor.systemOrangeColor];
#else /* __DEBUG_COLOR__ */
   [self.separatorView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor opaqueSeparator])];
#endif /* !__DEBUG_COLOR__ */

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

- (void)setWoLANPacket:(WoLANPacket *)aWoLANPacket {
   
   int                            nErr                                     = EFAULT;

   __TRY;

   _packet  = aWoLANPacket;
   
   if (kStringIsEmpty(aWoLANPacket.mac)) {
      
      [self.macLabel setText:__LOCALIZED_STRING(self.class, @"N/A")];

   } /* End if () */
   else {
      
      [self.macLabel setText:aWoLANPacket.mac];

   } /* End else */
      
   if (aWoLANPacket.sent) {
      
      [self.sentLabel setText:__LOCALIZED_STRING(self.class, @"SENT")];
      [self.sentLabel setTextColor:UIColor.systemGreenColor];

   } /* End if () */
   else {
      
      [self.sentLabel setText:__LOCALIZED_STRING(self.class, @"FAILED")];
      [self.sentLabel setTextColor:UIColor.systemRedColor];

   } /* End else */

   __CATCH(nErr);
   
   return;
}

@end
