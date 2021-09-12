//
//  WifiScanCell.m
//  NetworkArch
//
//  Created by Harry on 2021/9/12.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WifiScanCell.h"

@interface WifiScanCell ()

@property (nonatomic, strong)                WifiScanResult                      * wifiScanResult;
@property (nonatomic, assign)                BOOL                                  canSelected;

@end

@implementation WifiScanCell

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

      _canSelected   = NO;
      
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

#if __DEBUG_COLOR__
   [self.containerView setBackgroundColor:UIColor.systemBlueColor];
#else /* __DEBUG_COLOR__ */
   [self.containerView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
#endif /* !__DEBUG_COLOR__ */

   [self.selectedColorView setClipsToBounds:YES];
   [self.selectedColorView setBackgroundColor:UIColor.clearColor];

   [self.ipLabel setBackgroundColor:UIColor.clearColor];
   [self.ipLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

   [self.deviceLabel setBackgroundColor:UIColor.clearColor];
   [self.deviceLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

   __CATCH(nErr);

   return;
}

- (void)setHighlighted:(BOOL)aHighlighted animated:(BOOL)aAnimated {
   
   int                            nErr                                     = EFAULT;

   __TRY;

   LogDebug((@"-[WifiScanCell setHighlighted:animated:] : Highlighted : %d", aHighlighted));
   
   if (aHighlighted) {

   } /* End if () */
   else {

      [self.selectedColorView setBackgroundColor:UIColor.clearColor];

   } /* End else */

   if (NO == self.canSelected) {
      
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

   LogDebug((@"-[WifiScanCell setSelected:animated:] : Selected : %d", aSelected));

   if (aSelected) {

   } /* End if () */
   else {

      [self.selectedColorView setBackgroundColor:UIColor.clearColor];

   } /* End else */

   if (NO == self.canSelected) {
      
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

- (void)setStatistics:(WifiScanResult *)aWifiScanResult {

   int                            nErr                                     = EFAULT;

   __TRY;

   _wifiScanResult   = aWifiScanResult;

   __CATCH(nErr);

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

- (void)setScanResult:(WifiScanResult *)aScanResult {
   
   int                            nErr                                     = EFAULT;

   __TRY;

   _wifiScanResult   = aScanResult;
   
   [self.ipLabel setText:aScanResult.device.ipAddress];
   [self.deviceLabel setText:aScanResult.device.brand];

   __CATCH(nErr);

   return;
}

@end
