//
//  IntroductionController.m
//  INTRODUCTION
//
//  Created by Harry on 2021/6/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "IntroductionController.h"
#import "IntroductionController+Inner.h"
#import "IntroductionController+Action.h"
#import "IntroductionController+Notification.h"
#import "IntroductionController+Theme.h"

@implementation IntroductionController

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
   
   if (self) {
            
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (void)viewDidLoad {

   int                            nErr                                     = EFAULT;

   AppIntroduction               *stAppIntroduction                            = nil;
   
   UIImage                       *stIcon                                   = nil;
   NSMutableAttributedString     *stAttributedString                       = nil;

   __TRY;

   [super viewDidLoad];

   // Do any additional setup after loading the view.
   [self.view setBackgroundColor:UIColor.clearColor];
   [self.view setBackgroundColorPicker:nil];
   
   [self.containerView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor tertiarySystemGroupedBackground])];
   [self.contentView setBackgroundColor:UIColor.clearColor];

   [self.titleLabel setBackgroundColor:UIColor.clearColor];
   [self.summaryLabel setBackgroundColor:UIColor.clearColor];

   [self.imageView setCornerRadius:[UISetting cornerRadiusBig] clipsToBounds:YES];
   [self.containerView setCornerRadius:[UISetting cornerRadiusBig] clipsToBounds:YES];
   [self.continueButton setCornerRadius:[UISetting cornerRadiusSmall] clipsToBounds:YES];
   
   stAppIntroduction  = [AppIntroduction appIntroduction];
   LogDebug((@"-[IntroductionController viewDidLoad] : AppIntroduction : %@", stAppIntroduction));
   
   [self.titleLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
//   [self.titleLabel setFont:[UIFont systemFontOfSize:self.titleLabel.font.pointSize weight:UIFontWeightLight]];
   
   [self.titleLabel setText:[NSString stringWithFormat:stAppIntroduction.title, [UIDevice getOSVersion]]];
   
   stAttributedString   = [[NSMutableAttributedString alloc] initWithString:stAppIntroduction.summary];
   [stAttributedString setLineSpacing:5];
   [stAttributedString setAlignment:NSTextAlignmentLeft];

   [self.summaryLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
//   [self.summaryLabel setFont:[UIFont systemFontOfSize:self.summaryLabel.font.pointSize weight:UIFontWeightLight]];
   [self.summaryLabel setAttributedText:stAttributedString];

   for (UIView *stIntroductionView in self.introductionViews) {
      
      [stIntroductionView setBackgroundColor:UIColor.clearColor];
      
   } /* End for () */

//   for (UIImageView *stIntroductionImageView in self.introductionImageViews) {
//
//      [stIntroductionImageView setBackgroundColor:UIColor.clearColor];
//      [stIntroductionImageView setCornerRadius:4 clipsToBounds:YES];
//
//   } /* End for () */

   for (int H = 0; H < stAppIntroduction.introductions.count && H < self.introductionImageViews.count; ++H) {

      [self.introductionImageViews[H] setBackgroundColor:UIColor.clearColor];
//      [self.introductionImageViews[H] setCornerRadius:4 clipsToBounds:YES];
      [self.introductionImageViews[H] setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];

      stIcon   = __IMAGE_NAMED(stAppIntroduction.introductions[H].icon, self.class);
//      if (@available(iOS 13.0, *)) {
//
//         stIcon   = [stIcon imageWithTintColor:UIColor.systemRedColor];
//
//      } /* End if () */
//      else {
//
//         stIcon   = [stIcon imageRenderWithTintColor:UIColor.systemRedColor];
//
//      } /* End else */

      [self.introductionImageViews[H] setImage:stIcon];
      
   } /* End for () */

//   for (UILabel *stIntroductionLabel in self.introductionLabels) {
//
//      [stIntroductionLabel setBackgroundColor:UIColor.clearColor];
//
//      [stIntroductionLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
//      [stIntroductionLabel setFont:[APPFont lightFontOfSize:stIntroductionLabel.font.pointSize]];
//
//   } /* End for () */
   
   for (int H = 0; H < stAppIntroduction.introductions.count && H < self.introductionLabels.count; ++H) {
      
      [self.introductionLabels[H] setBackgroundColor:UIColor.clearColor];
      
      [self.introductionLabels[H] setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
//      [self.introductionLabels[H] setFont:[UIFont systemFontOfSize:self.introductionLabels[H].font.pointSize weight:UIFontWeightLight]];
      
      [self.introductionLabels[H] setText:stAppIntroduction.introductions[H].title];

   } /* End for () */

   for (int H = 0; H < stAppIntroduction.introductions.count && H < self.introductionSummaryLabels.count; ++H) {
      
      [self.introductionSummaryLabels[H] setBackgroundColor:UIColor.clearColor];
      
      [self.introductionSummaryLabels[H] setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
//      [self.introductionSummaryLabels[H] setFont:[UIFont systemFontOfSize:self.introductionLabels[H].font.pointSize weight:UIFontWeightLight]];
      
      [self.introductionSummaryLabels[H] setText:stAppIntroduction.introductions[H].summary];

   } /* End for () */

   [self.imageView setImage:[ImageProvider imageNamed:@"SPONSOR"]];

//   [self.continueButton setBackgroundColor:UIColorX.systemRedColor];
   [self.continueButton setBackgroundColorPicker:DKColorPickerWithKey([UISetting mainColor])];
   [self.continueButton.titleLabel setFont:[UIFont systemFontOfSize:self.continueButton.titleLabel.font.pointSize
                                                             weight:UIFontWeightRegular]];
   [self.continueButton.titleLabel setText:__LOCALIZED_STRING(self.class, @"OK")];
   [self.continueButton setTitle:__LOCALIZED_STRING(self.class, @"OK") forState:UIControlStateNormal];

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

@end

#pragma mark - UIStoryboardSegue
@implementation IntroductionController (UIStoryboardSegue)

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
