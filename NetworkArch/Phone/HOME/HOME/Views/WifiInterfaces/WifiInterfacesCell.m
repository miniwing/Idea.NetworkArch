//
//  WifiInterfacesCell.m
//  NetworkArch
//
//  Created by Harry on 2021/8/11.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WifiInterfacesCell.h"
#import "WifiInterfacesCell+Inner.h"
#import "WifiInterfacesCell+Signal.h"
#import "WifiInterfacesCell+Notification.h"

@implementation WifiInterfacesCell

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
   
   // Initialization code
   [self setBackgroundColor:UIColor.clearColor];
   [self.contentView setBackgroundColor:UIColor.clearColor];
   
   self.selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];// 这句不可省略
//   [self.selectedBackgroundView setSize:CGSizeZero];
   [self.selectedBackgroundView setBackgroundColor:UIColor.clearColor];
   
   [self.topView setBackgroundColor:UIColor.clearColor];
   [self.separatorView setBackgroundColor:[IDEAColor colorWithKey:[IDEAColor separator]]];
   [self.bottomView setBackgroundColor:UIColor.clearColor];
   
   [self.upView setBackgroundColor:UIColor.clearColor];
   [self.upLabel setBackgroundColor:UIColor.clearColor];
   [self.runingView setBackgroundColor:UIColor.clearColor];
   [self.runingLabel setBackgroundColor:UIColor.clearColor];
   [self.deviceView setBackgroundColor:UIColor.clearColor];
   [self.deviceLabel setBackgroundColor:UIColor.clearColor];

   [self.addressLabel setBackgroundColor:UIColor.clearColor];
   [self.ipLabel setBackgroundColor:UIColor.clearColor];
   
   [self.upLabel setFont:[UIFont systemFontOfSize:self.upLabel.font.pointSize weight:UIFontWeightLight]];
   [self.runingLabel setFont:[UIFont systemFontOfSize:self.runingLabel.font.pointSize weight:UIFontWeightLight]];
   [self.deviceLabel setFont:[UIFont systemFontOfSize:self.deviceLabel.font.pointSize weight:UIFontWeightLight]];

   [self.addressLabel setFont:[UIFont systemFontOfSize:self.addressLabel.font.pointSize weight:UIFontWeightLight]];
   [self.ipLabel setFont:[UIFont systemFontOfSize:self.ipLabel.font.pointSize weight:UIFontWeightLight]];

   [self.upLabel setTextColor:UIColor.whiteColor];
   [self.runingLabel setTextColor:UIColor.whiteColor];
   [self.deviceLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

   [self.addressLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.ipLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   
   [self.upView setCornerRadius:4 clipsToBounds:YES];
   [self.runingView setCornerRadius:4 clipsToBounds:YES];
   [self.deviceView setCornerRadius:4 clipsToBounds:YES];

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

- (void)setInterface:(IDEANetInterface *)aNetInterface {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   _interface  = aNetInterface;
   
   if (aNetInterface.isUp) {
      
      [self.upLabel setText:@"Up"];
      [self.upView setBackgroundColor:UIColor.systemGreenColor];
      
   } /* End if () */
   else {
      
      [self.upLabel setText:@"Not Up"];
      [self.upView setBackgroundColor:UIColor.systemRedColor];

   } /* End else */
//   [self.upLabel setText:aNetInterface.isUp? @"Up" : @"Not up"];
   
   if (aNetInterface.isRunning) {
      
      [self.runingLabel setText:@"Runing"];
      [self.runingView setBackgroundColor:UIColor.systemGreenColor];
      
   } /* End if () */
   else {
      
      [self.runingLabel setText:@"Not Runing"];
      [self.runingView setBackgroundColor:UIColor.systemRedColor];

   } /* End else */
//   [self.runingLabel setText:aNetInterface.isRunning ? @"Runing" : @"Not Runing"];

   if (kStringIsBlank(aNetInterface.name)) {
      
      [self.deviceLabel setText:@"N/"];
//      [self.deviceButton setBackgroundColor:UIColor.systemGreenColor];
      
   } /* End if () */
   else {
      
      [self.deviceLabel setText:[NSString stringWithFormat:@"%@/%@", aNetInterface.name, [IDEANetInterface familyToString:aNetInterface.family]]];
//      [self.deviceButton setBackgroundColor:UIColor.systemRedColor];

   } /* End else */
//   [self.deviceLabel setText:kStringIsBlank(aNetInterface.name) ? @"N/A" : aNetInterface.name];
   
   [self.addressLabel setText:@"Address"];
   [self.ipLabel setText:aNetInterface.address];

   __CATCH(nErr);
   
   return;
}

@end
