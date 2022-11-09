//
//  HomeSettingApiKeyCell.m
//  NetworkArch
//
//  Created by Harry on 2021/8/15.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "HomeSettingApiKeyCell.h"
#import "HomeSettingApiKeyCell+Inner.h"
#import "HomeSettingApiKeyCell+Signal.h"
#import "HomeSettingApiKeyCell+Notification.h"

@implementation HomeSettingApiKeyCell

- (void)dealloc {

   __LOG_FUNCTION;

   // Custom dealloc

   [self removeAllNotifications];

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
   
   NSString                      *szApiKey                                 = nil;

   __TRY;

   [super awakeFromNib];
   // Initialization code

   [self setBackgroundColor:UIColor.clearColor];
   [self.contentView setBackgroundColor:UIColor.clearColor];
   
   self.selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];// 这句不可省略
   [self.selectedBackgroundView setBackgroundColor:UIColor.clearColor];
   [self.selectedBackgroundView setClipsToBounds:YES];

//   [self.containerView setCornerRadius:8 clipsToBounds:YES];
//   [self.containerView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
//   [self.containerView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor link])];

   /**
    UITextField
    */
   [self.apiKeytextField setBackgroundColor:UIColor.clearColor];
//   [self.apiKeytextField setCornerRadius:8 clipsToBounds:YES];
   
   [self.apiKeytextField setFont:[UIFont systemFontOfSize:self.apiKeytextField.font.pointSize weight:UIFontWeightLight]];
   
   [self.apiKeytextField setPlaceholderColorPicker:DKColorPickerWithKey([IDEAColor placeholderText])];
   [self.apiKeytextField setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.apiKeytextField setEdgeX:[UISetting textFieldEdgeX] edgeY:[UISetting textFieldEdgeY]];
   
//   [self.apiKeytextField setDelegate:self];
   [self.apiKeytextField setPlaceholder:__LOCALIZED_STRING(self.class, @"API Key")];
   
   [self addNotificationName:UITextFieldTextDidChangeNotification
                    selector:@selector(textFieldTextDidChange:)
                      object:self.apiKeytextField];
   
   [self.apiKeytextField setDelegate:self];
   
//   szApiKey = [APPDelegate apiKey];
   
   if (NO == kStringIsEmpty(szApiKey)) {
      
      [self.apiKeytextField setText:szApiKey];
      
   } /* End if () */

   [self.separatorView setHidden:NO];
   [self.separatorView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor opaqueSeparator])];

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

- (void)setTextChangeBlock:(TextChangeBlock)aTextChangeBlock {
   
   _textChangeBlock  = [aTextChangeBlock copy];
   
   return;
}

@end
