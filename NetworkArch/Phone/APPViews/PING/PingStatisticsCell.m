//
//  PingStatisticsCell.m
//  NetworkArch
//
//  Created by Harry on 2021/7/29.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "PingStatisticsCell.h"

@interface PingStatisticsCell ()

@property (nonatomic, assign)                PingStatistics                        pingStatistics;
@property (nonatomic, assign)                NSTimeInterval                        value;

@end

@implementation PingStatisticsCell

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

   [self.titleLabel setBackgroundColor:UIColor.clearColor];
   [self.titleLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

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


/// 填充数据
/// @param aPingStatistics    PingStatisticsMinmum    = 0,
///                           PingStatisticsAverage   = 1,
///                           PingStatisticsMaximum   = 2,

/// @param aValue time
- (void)setStatistics:(PingStatistics)aPingStatistics value:(NSTimeInterval)aValue {

   int                            nErr                                     = EFAULT;

   __TRY;

   _pingStatistics   = aPingStatistics;
   _value            = aValue;
   
   if (PingStatisticsMinmum == aPingStatistics) {
      
      [self.titleLabel setText:APP_STR(@"Minmum")];
      
   } /* End if () */
   else if (PingStatisticsMaximum == aPingStatistics) {
      
      [self.titleLabel setText:APP_STR(@"Maximum")];
      
   } /* End else if () */
   else {

      [self.titleLabel setText:APP_STR(@"Average")];

   } /* End else */
   
   [self.timeLabel setText:[NSString stringWithFormat:@"%.3f ms", aValue]];

   __CATCH(nErr);

   return;
}


@end
