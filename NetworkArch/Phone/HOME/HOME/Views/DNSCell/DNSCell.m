//
//  DNSCell.m
//  NetworkArch
//
//  Created by Harry on 2021/8/16.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "DNSCell.h"
#import "DNSCell+Inner.h"
#import "DNSCell+Signal.h"
#import "DNSCell+Notification.h"

@implementation DNSCell

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
   
//   [self.containerView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
//   [self.containerView setCornerRadius:[UISetting cornerRadiusBig] clipsToBounds:YES];

   [self.domainLabel setBackgroundColor:UIColor.clearColor];
   [self.domainLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.domainLabel setFont:[UIFont systemFontOfSize:self.domainLabel.font.pointSize weight:UIFontWeightLight]];

   [self.ttlLabel setBackgroundColor:UIColor.clearColor];
   [self.ttlLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.ttlLabel setFont:[UIFont systemFontOfSize:self.ttlLabel.font.pointSize weight:UIFontWeightLight]];

   [self.dnsLabel setBackgroundColor:UIColor.clearColor];
   [self.dnsLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.dnsLabel setFont:[UIFont systemFontOfSize:self.dnsLabel.font.pointSize weight:UIFontWeightLight]];

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

- (void)setDNSModel:(DNSModel *)aDNSModel {

   int                            nErr                                     = EFAULT;

   __TRY;

   _DNSModel   = aDNSModel;
   
//   @property (nonatomic, weak)   IBOutlet       UILabel                             * domainLabel;
//   @property (nonatomic, weak)   IBOutlet       UILabel                             * ttlLabel;
//
//   @property (nonatomic, weak)   IBOutlet       UILabel                             * dnsLabel;

   [self.domainLabel setText:aDNSModel.name];
   [self.ttlLabel setText:[NSString stringWithFormat:@"TTL: %@", aDNSModel.ttl]];
   
   [self.dnsLabel setText:[aDNSModel content]];
   
   __CATCH(nErr);

   return;
}

@end
