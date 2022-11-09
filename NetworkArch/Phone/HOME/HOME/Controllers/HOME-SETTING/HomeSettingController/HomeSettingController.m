//
//  HomeSettingController.m
//  NetworkArch
//
//  Created by Harry on 2021/8/15.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "HomeSettingRootController.h"
#import "HomeSettingRootController+Inner.h"
#import "HomeSettingRootController+Signal.h"
#import "HomeSettingRootController+Notification.h"

#import "HomeSettingController.h"
#import "HomeSettingController+Inner.h"
#import "HomeSettingController+Action.h"
#import "HomeSettingController+Signal.h"
#import "HomeSettingController+Notification.h"
#import "HomeSettingController+Theme.h"
#import "HomeSettingController+Debug.h"

#import "HomeSettingContentController+Notification.h"

@implementation HomeSettingController

- (void)dealloc {

   __LOG_FUNCTION;

   // Custom dealloc
   
   [self.contentController removeSignalResponder:self];
   
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
      
      @weakify(self);
      self.onNotification(HomeSettingContentController.saveNotification, ^(NSNotification *aNotification) {
         
         @strongify(self);
         [self resignFirstResponder];
         
         if ([self.navigationController isKindOfClass:HomeSettingRootController.class] || [self.rt_navigationController isKindOfClass:HomeSettingRootController.class]) {
            
            [self dismissViewControllerAnimated:YES
                                     completion:nil];
            
         } /* End if () */
         else {
            
            [self.navigationController popViewControllerAnimated:YES
                                                      completion:nil];
            
         } /* End else */

         return;
      });

      self.onNotification(HomeSettingContentController.addLinkNotification, ^(NSNotification *aNotification) {
         
         @strongify(self);
         [CATransaction begin];
         
         [CATransaction setCompletionBlock:^{
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://main.whoisxmlapi.com"]
                                               options:nil
                                     completionHandler:^(BOOL success) {
               
            }];
         }];
         
         [self resignFirstResponder];
         
         [CATransaction commit];

         return;
      });

   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (void)viewDidLoad {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewDidLoad];
   
   [self setTitle:__LOCALIZED_STRING(self.class, @"API Key")];
   [self.navigationItem setTitle:__LOCALIZED_STRING(self.class, @"API Key")];
   LogDebug((@"-[HomeSettingController viewDidLoad] : Title : %@", __LOCALIZED_STRING(self.class, @"API Key")));
   
   [self.navigationController setNavigationBarHidden:YES];
   
#if FULLSCREEN_POP_GESTURE
   [self setPrefersNavigationBarHidden:YES];
#else /* FULLSCREEN_POP_GESTURE */
   self.navigationController.interactivePopGestureRecognizer.delegate = self;
#endif /* !FULLSCREEN_POP_GESTURE */
   
   [self.navigationBarX.navigationBar setTitle:__LOCALIZED_STRING(self.class, @"API Key")];
   //   [self.navigationBarX setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
   
   [self.navigationBarX.navigationBar setAllowAnyTitleFontSize:YES];
   [self.navigationBarX.navigationBar setEnableRippleBehavior:NO];
   
   ////   [self.navigationBarX showLine:YES];
   
   /// 关闭水波纹效果
   [self.navigationBarX.navigationBar setRippleColor:UIColor.clearColor];
   [self.navigationBarX.navigationBar setInkColor:UIColor.clearColor];
   
   [self.navigationBarX.navigationBar setTintColor:[IDEAColor colorWithKey:[IDEAColor appNavigationBarTint]]];
   [self.navigationBarX.navigationBar setTitleTextColor:[IDEAColor colorWithKey:[IDEAColor label]]];
   
   [self.navigationBarX setNavigationBarTopInset:[UIWindow topSafeAreaInset]];
   [self.navigationBarX.navigationBarXHeight setConstant:[self.navigationBarX.navigationBar intrinsicContentSize].height + [UIWindow topSafeAreaInset]];
   
   if ([SettingProvider isApiKeySetting]) {
      
      [self.navigationBarX.navigationBar setRightBarButtonItem:self.rightBarButtonItem];
      
   } /* End if () */
   else {
      
      [self.navigationBarX.navigationBar setRightBarButtonItem:nil];
      
   } /* End else */
   
   [self.rightBarButtonItem setEnabled:YES];
   [self.rightBarButtonItem setImage:nil];
   [self.rightBarButtonItem setTitle:nil];
   [self.rightBarButtonItem setWidth:[UISetting rightBarButtonWidth]];
   
   [self.rightBarButton setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.rightBarButton.titleLabel setText:nil];
   
   [self.rightBarButton setTitle:nil forState:UIControlStateNormal];
   [self.rightBarButton setTitle:nil forState:UIControlStateSelected];
   [self.rightBarButton setTitle:nil forState:UIControlStateHighlighted];
   
   [self.rightBarButton setImage:[ImageProvider imageNamed:@"UIButtonBarCloseLandscape"] // @"UIButtonBarSetting"
                        forState:UIControlStateNormal];
   //   [self.rightBarButton setImage:[[ImageProvider imageNamed:@"plus.circle"] imageRenderWithTintColor:UIColor.systemBlueColor]
   //                          forState:UIControlStateSelected];
   //   [self.rightBarButton setImage:[[ImageProvider imageNamed:@"plus.circle"] imageRenderWithTintColor:UIColor.systemRedColor]
   //                          forState:UIControlStateHighlighted];
   
   [self.contentView setBackgroundColor:UIColor.clearColor];
   
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

- (BOOL)resignFirstResponder {
   
   int                            nErr                                     = EFAULT;
   BOOL                           bDone                                    = NO;
   
   __TRY;
   
   bDone = [self.contentController resignFirstResponder];
   
   if (!bDone) {
      
      bDone = [super resignFirstResponder];
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return bDone;
}

@end

#pragma mark - UIStoryboardSegue
@implementation HomeSettingController (UIStoryboardSegue)

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)aSegue sender:(id)aSender {

   int                            nErr                                     = EFAULT;

   __TRY;

   // Get the new view controller using [aSegue destinationViewController].
   // Pass the selected object to the new view controller.
   
   if ([aSegue.identifier isEqualToString:HomeSettingContentController.className]) {
      
      self.contentController  = aSegue.destinationViewController;

   } /* End if () */

   __CATCH(nErr);

   return;
}

@end
