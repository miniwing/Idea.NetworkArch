//
//  PingResultCell.m
//  NetworkArch
//
//  Created by Harry on 2021/7/29.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "PingResultCell.h"

@interface PingResultCell ()

@property (nonatomic, strong)                PingResult                          * pingResult;

@end

@implementation PingResultCell

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
   
   [self.statusView setCornerRadius:[UISetting cornerRadiusSmall] clipsToBounds:YES];

   [self.statusLabel setBackgroundColor:UIColor.clearColor];
   [self.statusLabel setTextColor:UIColor.whiteColor];
   
   [self.hostLabel setBackgroundColor:UIColor.clearColor];
   [self.hostLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

   [self.ipLabel setBackgroundColor:UIColor.clearColor];
   [self.ipLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

   [self.timeLabel setBackgroundColor:UIColor.clearColor];
   [self.timeLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

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

- (void)setPingResult:(PingResult *)aPingResult {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;

   _pingResult = aPingResult;
   
   if (nil != aPingResult.error) {
      
      [self.statusLabel setText:__LOCALIZED_STRING(self.class, @"Offline")];
      [self.statusView setBackgroundColor:UIColor.systemRedColor];

      [self.timeLabel setText:__LOCALIZED_STRING(self.class, @"N/A")];

   } /* End if () */
   else {
      
      [self.statusLabel setText:__LOCALIZED_STRING(self.class, @"Online")];
      [self.statusView setBackgroundColor:UIColor.systemGreenColor];

      [self.timeLabel setText:[NSString stringWithFormat:@"%.3f ms", aPingResult.duration]];

   } /* End else */
   
   [self.hostLabel setText:aPingResult.hostName];
   
   if (kStringIsEmpty(aPingResult.ip)) {
      
      [self.ipLabel setText:__LOCALIZED_STRING(self.class, @"N/A")];
      
   } /* End if () */
   else {

      [self.ipLabel setText:aPingResult.ip];

   } /* End else */
   
   __CATCH(nErr);
   
   return;
}

@end
