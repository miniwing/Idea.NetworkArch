//
//  HomeSettingAlertController.m
//  NetworkArch
//
//  Created by Harry on 2021/8/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "HomeSettingAlertController.h"

#import "WebViewController+Inner.h"
#import "WebViewController+Signal.h"
#import "WebViewController+Notification.h"

@implementation HomeSettingAlertController

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
   
   __TRY;

   [super viewDidLoad];

   // Do any additional setup after loading the view.
   [self.view setBackgroundColor:UIColor.clearColor];
   [self.view setBackgroundColorPicker:nil];
   
   [self.containerView setBackgroundColor:UIColor.clearColor];
   [self.contentView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor tertiarySystemGroupedBackground])];
   [self.contentView setCornerRadius:8 clipsToBounds:YES];

   [self.imageView setCornerRadius:8 clipsToBounds:YES];

   [self.titleLabel setBackgroundColor:UIColor.clearColor];
   [self.titleLabel setFont:[APPFont lightFontOfSize:self.titleLabel.font.pointSize]];
   [self.titleLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

   [self.contentLabel setBackgroundColor:UIColor.clearColor];
   [self.contentLabel setFont:[APPFont regularFontOfSize:self.contentLabel.font.pointSize]];
   [self.contentLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

   [self.okButton setCornerRadius:4 clipsToBounds:YES];
   [self.okButton.titleLabel setFont:[APPFont regularFontOfSize:self.okButton.titleLabel.font.pointSize]];
   [self.okButton setTitle:APP_STR(@"OK") forState:UIControlStateNormal];

   [self.cancelButton setCornerRadius:4 clipsToBounds:YES];
   [self.cancelButton.titleLabel setFont:[APPFont regularFontOfSize:self.cancelButton.titleLabel.font.pointSize]];
   [self.cancelButton setTitle:APP_STR(@"CANCEL") forState:UIControlStateNormal];

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

#pragma mark - IDEAPresentationControllerDelegate
- (CGRect)frameOfPresented {
      
   return CGRectMake(0,
                     0,
                     self.view.width,
                     self.view.height);
}

- (BOOL)backgroundTouchToClose {
   
   return YES;
}

@end

#pragma mark - UIStoryboard
@implementation HomeSettingAlertController (UIStoryboard)

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)aSegue sender:(id)aSender {

   int                            nErr                                     = EFAULT;

   __TRY;

   // Get the new view controller using [aSegue destinationViewController].
   // Pass the selected object to the new view controller.

   __CATCH(nErr);

   return;
}

+ (NSString *)storyboard {
   
   return @"HOME";
}

@end

#pragma mark - IBAction
@implementation HomeSettingAlertController (Action)

- (IBAction)onOK:(UIButton *)aButton {
   
   int                            nErr                                     = EFAULT;

//   __block UINavigationController*stNavigationController                   = nil;
//   __block WebViewController     *stWebViewController                      = nil;
   
   __TRY;
   
   [self dismissViewControllerAnimated:YES
                            completion:^{
      
      
//      stNavigationController  = __cast(UINavigationController *, self.presentingViewController);
//      [stNavigationController pushViewController:[WebViewController new] animated:YES];
   }];
   
   __CATCH(nErr);
   
   return;
}

- (IBAction)onCancel:(UIButton *)aButton {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [self dismissViewControllerAnimated:YES
                            completion:^{
      
   }];
   
   __CATCH(nErr);
   
   return;
}

@end
