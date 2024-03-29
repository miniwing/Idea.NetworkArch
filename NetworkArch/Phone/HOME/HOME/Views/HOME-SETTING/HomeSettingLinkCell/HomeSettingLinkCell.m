//
//  HomeSettingLinkCell.m
//  NetworkArch
//
//  Created by Harry on 2021/8/15.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "HomeSettingLinkCell.h"
#import "HomeSettingLinkCell+Inner.h"
#import "HomeSettingLinkCell+Signal.h"
#import "HomeSettingLinkCell+Notification.h"

@implementation HomeSettingLinkCell

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

//   [self.containerView setCornerRadius:8 clipsToBounds:YES];
//   [self.containerView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor link])];

   /**
    UIButton
    */
   [self.addButton setBackgroundColor:UIColor.clearColor];
//   [self.addButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
   [self.addButton setTitleColorPicker:DKColorPickerWithKey([IDEAColor label]) forState:UIControlStateNormal];
   [self.addButton.titleLabel setFont:[UIFont systemFontOfSize:self.addButton.titleLabel.font.pointSize weight:UIFontWeightLight]];
   [self.addButton setTitle:__LOCALIZED_STRING(self.class, @"Click To Get (FREE)") forState:UIControlStateNormal];
   
   [self.separatorView setHidden:YES];
   [self.separatorView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor opaqueSeparator])];
//   [self.separatorView setBackgroundColor:UIColor.whiteColor];

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

- (void)setAddLinkBlock:(AddLinkBlock)aAddLinkBlock {
   
   _addLinkBlock  = [aAddLinkBlock copy];
   
   return;
}

@end

#pragma mark - IBAction
@implementation HomeSettingLinkCell (Action)

- (IBAction)onAddLink:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;

   if (nil != self.addLinkBlock) {
      
      self.addLinkBlock(self.indexPath);
      
   } /* End if () */

   __CATCH(nErr);
   
   return;
}

@end
