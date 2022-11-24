//
//  FleetingWidgetController.m
//  FleetingWidget
//
//  Created by Harry on 2021/7/26.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "OneYear.h"

#import "FleetingWidgetController.h"
#import "FleetingWidgetController+Inner.h"
#import "FleetingWidgetController+Theme.h"

@implementation FleetingWidgetController

- (void)dealloc {
   
   __LOG_FUNCTION;
   
   // Custom dealloc
   
   [_timer invalidate];
   _timer   = nil;
   
   [self removeAllSignalResponders];
   [self unobserveAllNotifications];

   __SUPER_DEALLOC;
   
   return;
}

- (void)viewDidLoad {
   
   int                            nErr                                     = EFAULT;

   __TRY;

   [super viewDidLoad];

   // Do any additional setup after loading the view.

   [self.view setBackgroundColorPicker:nil];
   [self.view setBackgroundColor:UIColor.clearColor];

   LogDebug((@"-[FleetingWidgetController viewDidLoad] : Remaining : ", APP_STR(@"Remaining")));
   [self.titleLabel setText:[NSString stringWithFormat:APP_STR(@"Remaining"), [OneYear sharedInstance].year]];
   [self.titleLabel setFont:[UIFont systemFontOfSize:self.titleLabel.font.pointSize weight:UIFontWeightRegular]];

   [self.progressLabel setFont:[UIFont monospacedDigitSystemFontOfSize:self.progressLabel.font.pointSize weight:UIFontWeightLight]];
   [self.progressLabel setText:[OneYear sharedInstance].currentProgress];

   @weakify(self);
   self.timer  = [NSTimer scheduledTimerWithTimeInterval:0.09
                                                 repeats:YES
                                                   block:^(NSTimer * _Nonnull timer) {
      @strongify(self);
      [self.progressLabel setText:[OneYear sharedInstance].currentProgress];
      
      return;
   }];

   [[NSRunLoop currentRunLoop] addTimer:self.timer
                                forMode:NSDefaultRunLoopMode];
   
   [self.copyrightLabel setText:@"Copyright © 2021-2022 Harry. All rights reserved."];
   [self.copyrightLabel setFont:[UIFont systemFontOfSize:self.copyrightLabel.font.pointSize weight:UIFontWeightLight]];

   if (@available(iOS 13.0, *)) {
      
      if (UIUserInterfaceStyleDark == self.traitCollection.userInterfaceStyle) {

         self.titleLabel.textColor     = UIColor.whiteColor;
         self.progressLabel.textColor  = UIColor.whiteColor;
         self.copyrightLabel.textColor = UIColor.whiteColor;

      } /* End if () */
      else {

         self.titleLabel.textColor     = UIColor.blackColor;
         self.progressLabel.textColor  = UIColor.blackColor;
         self.copyrightLabel.textColor = UIColor.blackColor;

      } /* End else */

   } /* End if () */
   else {
      
      self.titleLabel.textColor     = UIColor.blackColor;
      self.progressLabel.textColor  = UIColor.blackColor;
      self.copyrightLabel.textColor = UIColor.blackColor;

   } /* End else */

//   [self.extensionContext setWidgetLargestAvailableDisplayMode:NCWidgetDisplayModeExpanded];
   
   __CATCH(nErr);

   return;
}

- (void)viewWillAppear:(BOOL)aAnimated {
   
   int                            nErr                                     = EFAULT;

   __TRY;
   
   [super viewWillAppear:aAnimated];
   
   if (@available(iOS 13.0, *)) {
      
      if (UIUserInterfaceStyleDark == self.traitCollection.userInterfaceStyle) {

         self.titleLabel.textColor     = UIColor.whiteColor;
         self.progressLabel.textColor  = UIColor.whiteColor;
         self.copyrightLabel.textColor = UIColor.whiteColor;

      } /* End if () */
      else {

         self.titleLabel.textColor     = UIColor.blackColor;
         self.progressLabel.textColor  = UIColor.blackColor;
         self.copyrightLabel.textColor = UIColor.blackColor;

      } /* End else */

   } /* End if () */
   else {
      
      self.titleLabel.textColor     = UIColor.blackColor;
      self.progressLabel.textColor  = UIColor.blackColor;
      self.copyrightLabel.textColor = UIColor.blackColor;

   } /* End else */
   
   __CATCH(nErr);
   
   return;
}

@end
