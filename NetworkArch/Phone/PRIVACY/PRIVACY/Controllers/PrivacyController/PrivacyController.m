 //
//  PrivacyController.m
//  NuclearWater
//
//  Created by Harry on 2021/6/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import <SettingProvider/SettingProvider.h>
#import <SettingProvider/UISetting.h>

#import "PrivacyController.h"
#import "PrivacyController+Inner.h"
#import "PrivacyController+Action.h"
#import "PrivacyController+Notification.h"
#import "PrivacyController+Theme.h"

@implementation PrivacyController

- (void)dealloc {

   __LOG_FUNCTION;

   LogDebug((@"-[PrivacyController dealloc] : %p", self));

   // Custom dealloc
   [self unobserveAllNotifications];
   [self removeAllSignalResponders];
   
   [self removeAllNotifications];

   __SUPER_DEALLOC;

   return;
}

- (instancetype)initWithCoder:(NSCoder *)aCoder {

   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   self  = [super initWithCoder:aCoder];
   
   if (self) {
            
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (void)viewDidLoad {

   int                            nErr                                     = EFAULT;

   __TRY;

   [super viewDidLoad];

   // Do any additional setup after loading the view.
   [self.view setBackgroundColor:UIColor.clearColor];
   [self.view setBackgroundColorPicker:nil];
   
   [self.containerView setBackgroundColor:UIColor.clearColor];
   [self.contentView setBackgroundColor:UIColor.clearColor];
   [self.sponsorImageView setBackgroundColor:UIColor.clearColor];

   [self.sponsorImageView setCornerRadius:[UISetting cornerRadiusBig] clipsToBounds:YES];
   [self.containerView setCornerRadius:[UISetting cornerRadiusBig] clipsToBounds:YES];
   [self.continueButton setCornerRadius:[UISetting cornerRadiusSmall] clipsToBounds:YES];
   
   [self.sponsorImageView setImage:[ImageProvider imageNamed:@"SPONSOR"]];

   [self.continueButton setBackgroundColorPicker:DKColorPickerWithKey([UISetting mainColor])];
   [self.continueButton.titleLabel setText:__LOCALIZED_STRING(self.class, @"CONTINUE")];
   [self.continueButton setTitle:__LOCALIZED_STRING(self.class, @"CONTINUE") forState:UIControlStateNormal];
   [self.continueButton.titleLabel setFont:[UIFont systemFontOfSize:self.continueButton.titleLabel.font.pointSize
                                                             weight:UIFontWeightRegular]];

   [self.containerView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor tertiarySystemGroupedBackground])];
   
   [self.titleLabel setBackgroundColor:UIColor.clearColor];
   [self.titleLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

   [self.descLabel setBackgroundColor:UIColor.clearColor];
   [self.descLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

   [self.itemContainerView setCornerRadius:[UISetting cornerRadiusSmall] clipsToBounds:YES];
   [self.itemContainerView setBackgroundColor:UIColor.clearColor];
//   [self.itemContainerView setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
//
//      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
//
////         return [IDEAColor colorWithKey:[IDEAColor lightGray]];
//         return [IDEAColor colorWithKey:[IDEAColor opaqueSeparator]];
//
//      } /* End if () */
//      else {
//
//         return [IDEAColor colorWithKey:[IDEAColor lightText]];
//
//      } /* End else */
//   }];

   /**
    * 初始化内容
    */
   [self.titleLabel setText:[NSString stringWithFormat:__LOCALIZED_STRING(self.class, @"PRIVACY_TITLE_FORMAT"), [UIDevice getOSVersion]]];
   LogDebug((@"-[PrivacyController viewDidLoad] : PRIVACY_TITLE : %@", [NSString stringWithFormat:__LOCALIZED_STRING(self.class, @"PRIVACY_TITLE_FORMAT"), [UIDevice getOSVersion]]));

   [self.descLabel setText:__LOCALIZED_STRING(self.class, @"PRIVACY_DESCRIPT")];
   LogDebug((@"-[PrivacyController viewDidLoad] : PRIVACY_DESCRIPT : %@", __LOCALIZED_STRING(self.class, @"PRIVACY_DESCRIPT")));

   [self.view1 setBackgroundColor:UIColor.clearColor];
   [self.imageView1 setBackgroundColor:UIColor.clearColor];
   [self.imageView1 setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.imageView1 setImage:[ImageProvider imageNamed:@"UIButtonBarGrid"]];
   [self.label1 setBackgroundColor:UIColor.clearColor];
   [self.label1 setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.label1 setText:__LOCALIZED_STRING(self.class, @"PRIVACY_1")];

   [self.view2 setBackgroundColor:UIColor.clearColor];
   [self.imageView2 setBackgroundColor:UIColor.clearColor];
   [self.imageView2 setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.imageView2 setImage:[ImageProvider imageNamed:@"UIButtonBarGrid"]];
   [self.label2 setBackgroundColor:UIColor.clearColor];
   [self.label2 setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.label2 setText:__LOCALIZED_STRING(self.class, @"PRIVACY_2")];

   [self.view3 setBackgroundColor:UIColor.clearColor];
   [self.imageView3 setBackgroundColor:UIColor.clearColor];
   [self.imageView3 setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.imageView3 setImage:[ImageProvider imageNamed:@"UIButtonBarGrid"]];
   [self.label3 setBackgroundColor:UIColor.clearColor];
   [self.label3 setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.label3 setText:__LOCALIZED_STRING(self.class, @"PRIVACY_3")];

   __CATCH(nErr);

   return;
}

- (void)didReceiveMemoryWarning {

   int                            nErr                                     = EFAULT;

   __TRY;

   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.

   __CATCH(nErr);

   return;
}

- (void)viewWillAppear:(BOOL)aAnimated {

   int                            nErr                                     = EFAULT;

   __TRY;

   [super viewWillAppear:aAnimated];

   __CATCH(nErr);

   return;
}

- (void)viewDidAppear:(BOOL)aAnimated {

   int                            nErr                                     = EFAULT;

   __TRY;

   [super viewDidAppear:aAnimated];

   __CATCH(nErr);

   return;
}

- (void)viewWillDisappear:(BOOL)aAnimated {

   int                            nErr                                     = EFAULT;

   __TRY;

   [super viewWillDisappear:aAnimated];

   __CATCH(nErr);

   return;
}

- (void)viewDidDisappear:(BOOL)aAnimated {

   int                            nErr                                     = EFAULT;

   __TRY;

   [super viewDidDisappear:aAnimated];

   __CATCH(nErr);

   return;
}

- (PrivacyAnimation *)privacyAnimation {
   
   if (nil == _privacyAnimation) {
      
      _privacyAnimation = [[PrivacyAnimation alloc] init];
   }
   
   return _privacyAnimation;
}

@end

#pragma mark - UIStoryboardSegue
@implementation PrivacyController (UIStoryboardSegue)

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)aSegue sender:(id)aSender {

   int                            nErr                                     = EFAULT;

   __TRY;

   // Get the new view controller using [aSegue destinationViewController].
   // Pass the selected object to the new view controller.

   __CATCH(nErr);

   return;
}

@end

