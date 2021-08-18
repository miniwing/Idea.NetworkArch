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

#import "APPDelegate+Kit.h"

#import "HomeSettingApiKeyCell.h"
#import "HomeSettingApiKeyCell+Inner.h"
#import "HomeSettingApiKeyCell+Signal.h"
#import "HomeSettingApiKeyCell+Notification.h"

@implementation HomeSettingApiKeyCell

- (void)dealloc {

   __LOG_FUNCTION;

   // Custom dealloc

   [self removeAllNotification];

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
   [self.containerView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor link])];

   /**
    UITextField
    */
   [self.apiKeytextField setBackgroundColor:UIColor.clearColor];
//   [self.apiKeytextField setCornerRadius:8 clipsToBounds:YES];
   
   [self.apiKeytextField setFont:[APPFont lightFontOfSize:self.apiKeytextField.font.pointSize]];
   
   [self.apiKeytextField setPlaceholderColorPicker:DKColorPickerWithKey([IDEAColor placeholderText])];
   [self.apiKeytextField setTextColor:UIColor.whiteColor];
   
//   [self.apiKeytextField setDelegate:self];
   [self.apiKeytextField setPlaceholder:APP_STR(@"API Key")];
   
   [self addNotificationName:UITextFieldTextDidChangeNotification
                    selector:@selector(textFieldTextDidChange:)
                      object:self.apiKeytextField];
   
   [self.apiKeytextField setDelegate:self];
   
   szApiKey = [APPDelegate apiKey];
   
   if (NO == kStringIsEmpty(szApiKey)) {
      
      [self.apiKeytextField setText:szApiKey];
      
   } /* End if () */
#if __Debug__
   else {
      dispatch_async_on_main_queue(^{
         
         [self.apiKeytextField setText:[APPDATA xmlAPIKey]];
         
         [self.apiKeytextField becomeFirstResponder];
      });
   }
#endif /* __Debug__ */

   [self.separatorView setHidden:NO];
   [self.separatorView setBackgroundColor:UIColor.whiteColor];
   
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
