//
//  UISettingController.m
//  UISETTING
//
//  Created by Harry on 2021/02/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "UISettingRootController.h"

#import "UISettingController.h"
#import "UISettingController+Inner.h"
#import "UISettingController+Action.h"
#import "UISettingController+Signal.h"
#import "UISettingController+Notification.h"
#import "UISettingController+Theme.h"
#import "UISettingController+Debug.h"

#import "UISettingTableController+Inner.h"

@implementation UISettingController

- (void)dealloc {
   
   __LOG_FUNCTION;
   
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

      [self setHidesBottomBarWhenPushed:YES];

   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (void)viewDidLoad {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;
   
   [super viewDidLoad];
   
//   [self setTitle:__LOCALIZED_STRING(self.class, @"SETTING")];
   [self.navigationItem setTitle:__LOCALIZED_STRING(self.class, @"SETTING")];
   [self.tabBarItem setTitle:__LOCALIZED_STRING(self.class, @"SETTING")];
   LogDebug((@"-[UISettingController viewDidLoad] : Title : %@", __LOCALIZED_STRING(self.class, @"SETTING")));

   [self.navigationController setNavigationBarHidden:YES];

#if FULLSCREEN_POP_GESTURE
   [self setPrefersNavigationBarHidden:YES];
#else /* FULLSCREEN_POP_GESTURE */
   self.navigationController.interactivePopGestureRecognizer.delegate = self;
#endif /* !FULLSCREEN_POP_GESTURE */

   [self.navigationBarX.navigationBar setTitle:__LOCALIZED_STRING(self.class, @"SETTING")];
//   [self.navigationBarX setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
   
   [self.navigationBarX.navigationBar setAllowAnyTitleFontSize:YES];
   [self.navigationBarX.navigationBar setEnableRippleBehavior:NO];
   
//   [self.navigationBarX showLine:YES];

   /// 关闭水波纹效果
   [self.navigationBarX.navigationBar setRippleColor:UIColor.clearColor];
   [self.navigationBarX.navigationBar setInkColor:UIColor.clearColor];
   
   [self.navigationBarX.navigationBar setTintColor:[IDEAColor colorWithKey:[IDEAColor appNavigationBarTint]]];
   [self.navigationBarX.navigationBar setTitleTextColor:[IDEAColor colorWithKey:[IDEAColor label]]];

   [self.navigationBarX setNavigationBarTopInset:[UIWindow topSafeAreaInset]];
   [self.navigationBarX.navigationBarXHeight setConstant:[self.navigationBarX.navigationBar intrinsicContentSize].height + [UIWindow topSafeAreaInset]];

   /**
    * 设置返回按钮
    */
   [self.navigationBarX.navigationBar setLeftBarButtonItem:nil];
   [self.leftBarButtonItem setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.leftBarButtonItem setImage:nil];
   [self.leftBarButtonItem setTitle:nil];
   [self.leftBarButtonItem setWidth:[UISetting leftBarButtonWidth]];

   [self.leftBarButton setImage:[ImageProvider imageNamed:@"UIButtonBarArrowLeft"]
                       forState:UIControlStateNormal];
   
   [self.leftBarButton setImage:[[ImageProvider imageNamed:@"UIButtonBarArrowLeft"] imageRenderWithTintColor:UIColor.systemGrayColor]
                       forState:UIControlStateSelected];
   
   [self.leftBarButton setImage:[[ImageProvider imageNamed:@"UIButtonBarArrowLeft"] imageRenderWithTintColor:UIColor.systemGrayColor]
                       forState:UIControlStateHighlighted];
      
   [self.contentView setBackgroundColor:UIColor.clearColor];
   
   /**
    * 主动调整布局
    */
   [self.view setNeedsLayout];
   [self.view layoutIfNeeded];

   [self.contentView setNeedsLayout];
   [self.contentView layoutIfNeeded];

   [self.contentViewTop setConstant:self.navigationBarX.height];

   __CATCH(nErr);
   
   return;
}

//- (void)viewWillLayoutSubviews {
//
//   int                            nErr                                     = EFAULT;
//
//   __TRY;
//
//   [super viewWillLayoutSubviews];
//
//   __CATCH(nErr);
//
//   return;
//}

//- (void)viewDidLayoutSubviews {
//
//   int                            nErr                                     = EFAULT;
//
//   __TRY;
//
//   [super viewDidLayoutSubviews];
//
//#if MATERIAL_APP_BAR
//   // Dispose of any resources that can be recreated.
//   [self.contentViewTop setConstant:self.appBar.headerViewController.headerView.height];
//#endif /* MATERIAL_APP_BAR */
//
//   LogDebug((@"-[UISettingController viewDidLayoutSubviews] : Width : %.3f", self.leftBarButtonItem.width));
//
//   __CATCH(nErr);
//
//   return;
//}

- (void)didReceiveMemoryWarning {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
   
   //   [self.tableController didReceiveMemoryWarning];
   
   __CATCH(nErr);
   
   return;
}

- (void)viewWillAppear:(BOOL)aAnimated {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewWillAppear:aAnimated];
   
   // Dispose of any resources that can be recreated.
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
   
   //   [self.tableController viewWillDisappear:aAnimated];
   
   __CATCH(nErr);
   
   return;
}

- (void)viewDidDisappear:(BOOL)aAnimated {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewDidDisappear:aAnimated];
   
   //   [self.tableController viewDidDisappear:aAnimated];
   
   __CATCH(nErr);
   
   return;
}

@end

#pragma mark - UIStoryboardSegue
@implementation UISettingController (UIStoryboardSegue)

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)aSegue sender:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   // Get the new view controller using [aSegue destinationViewController].
   // Pass the selected object to the new view controller.
   
   if ([aSegue.identifier isEqualToString:UISettingTableController.className]) {
      
      self.tableController = aSegue.destinationViewController;
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return;
}

@end
