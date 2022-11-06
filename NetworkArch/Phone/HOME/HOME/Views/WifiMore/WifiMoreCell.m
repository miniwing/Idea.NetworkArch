//
//  WifiMoreCell.m
//  NetworkArch
//
//  Created by Harry on 2021/8/1.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WifiMoreCell.h"
#import "WifiMoreCell+Inner.h"
#import "WifiMoreCell+Signal.h"
#import "WifiMoreCell+Notification.h"

@implementation WifiMoreCell

- (void)dealloc {

   __LOG_FUNCTION;

   // Custom dealloc

   [self unobserveAllNotifications];
   [self removeAllSignalResponders];

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
   
   LogDebug((@"-[WifiMoreCell awakeFromNib] : selectionStyle : %d", self.selectionStyle));
   
   [self setBackgroundColor:UIColor.clearColor];
   [self.contentView setBackgroundColor:UIColor.clearColor];
   
   self.selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];// 这句不可省略
   [self.selectedBackgroundView setBackgroundColor:UIColor.clearColor];
   [self.selectedBackgroundView setClipsToBounds:YES];

   [self.selectedColorView setBackgroundColor:UIColor.clearColor];

   [self.selectedColorView setClipsToBounds:YES];
   [self.selectedColorView setBackgroundColor:UIColor.clearColor];
   
   [self.titleLabel setFont:[UIFont systemFontOfSize:self.titleLabel.font.pointSize
                                              weight:UIFontWeightLight]];
   
   [self.titleLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

   if (nil != self.infoView) {
      
      [self.infoView setCornerRadius:[UISetting cornerRadiusSmall] clipsToBounds:YES];
   
      [self.infoLabel setTextColor:UIColor.whiteColor];

   } /* End if () */
   else {

      [self.infoLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

   } /* End else */
   
   [self.infoLabel setFont:[UIFont systemFontOfSize:self.infoLabel.font.pointSize
                                             weight:UIFontWeightLight]];

   __CATCH(nErr);

   return;
}

- (void)setHighlighted:(BOOL)aHighlighted animated:(BOOL)aAnimated {
   
   int                            nErr                                     = EFAULT;

   __TRY;

   LogDebug((@"-[WifiMoreCell setHighlighted:animated:] : Highlighted : %d", aHighlighted));
   
   if (aHighlighted) {

   } /* End if () */
   else {

      [self.selectedColorView setBackgroundColor:UIColor.clearColor];

   } /* End else */

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

   LogDebug((@"-[WifiMoreCell setSelected:animated:] : Selected : %d", aSelected));

   if (aSelected) {

   } /* End if () */
   else {

      [self.selectedColorView setBackgroundColor:UIColor.clearColor];

   } /* End else */

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

@end
