//
//  TracerouteController.m
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "TracerouteRootController.h"

#import "TracerouteController.h"
#import "TracerouteController+Inner.h"
#import "TracerouteController+Action.h"
#import "TracerouteController+Signal.h"
#import "TracerouteController+Notification.h"
#import "TracerouteController+Theme.h"
#import "TracerouteController+Debug.h"

@implementation TracerouteController

- (void)dealloc {
   
   __LOG_FUNCTION;
   
   // Custom dealloc
   
   [self removeAllNotifications];

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
      
#if MATERIAL_APP_BAR
      _appBar  = [[MDCAppBar alloc] init];
      
      [_appBar.headerViewController.headerView setShadowColor:[IDEAColor colorWithKey:[IDEAColor systemBackground]]];
      [_appBar.headerViewController.headerView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
      
//      [_appBar.headerViewController setShowsHairline:YES];
//      [_appBar.headerViewController setHairlineColor:[IDEAColor colorWithKey:[IDEAColor separator]]];

      [_appBar.headerViewController setShowsHairline:NO];
      [_appBar.headerViewController setHairlineColor:UIColor.clearColor];

      [self addChildViewController:_appBar.headerViewController];
#endif /* MATERIAL_APP_BAR */
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (void)viewDidLoad {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;
   
   [super viewDidLoad];
   
   if ([SettingProvider isICMPEnable]) {
      
      [self setTitle:__LOCALIZED_STRING(self.class, @"ICMP traceroute")];
      LogDebug((@"-[TracerouteController viewDidLoad] : Title : %@", __LOCALIZED_STRING(self.class, @"ICMP traceroute")));

   } /* End if () */
   else {
      
      [self setTitle:__LOCALIZED_STRING(self.class, @"UDP traceroute")];
      LogDebug((@"-[TracerouteController viewDidLoad] : Title : %@", __LOCALIZED_STRING(self.class, @"UDP traceroute")));

   } /* End else */

   [self.navigationController setNavigationBarHidden:YES];
   
#if FULLSCREEN_POP_GESTURE
   [self setPrefersNavigationBarHidden:YES];
#else /* FULLSCREEN_POP_GESTURE */
   self.navigationController.interactivePopGestureRecognizer.delegate = self;
#endif /* !FULLSCREEN_POP_GESTURE */
   
   if ([SettingProvider isICMPEnable]) {
      
      [self.navigationBarX.navigationBar setTitle:__LOCALIZED_STRING(self.class,@"ICMP traceroute")];
      LogDebug((@"-[TracerouteController viewDidLoad] : Title : %@", __LOCALIZED_STRING(self.class, @"ICMP traceroute")));

   } /* End if () */
   else {
      
      [self.navigationBarX.navigationBar setTitle:__LOCALIZED_STRING(self.class, @"UDP traceroute")];
      LogDebug((@"-[TracerouteController viewDidLoad] : Title : %@", __LOCALIZED_STRING(self.class, @"UDP traceroute")));

   } /* End else */
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
    * Left
    */
   [self.navigationBarX.navigationBar setLeftBarButtonItem:self.leftBarButtonItem];
   [self.leftBarButtonItem setEnabled:YES];
   [self.leftBarButtonItem setImage:nil];
   [self.leftBarButtonItem setTitle:nil];
   [self.leftBarButtonItem setWidth:[UISetting leftBarButtonWidth]];
   
   [self.leftBarButton setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.leftBarButton.titleLabel setText:nil];
   
   [self.leftBarButton setTitle:nil forState:UIControlStateNormal];
   [self.leftBarButton setTitle:nil forState:UIControlStateSelected];
   [self.leftBarButton setTitle:nil forState:UIControlStateHighlighted];
   
   [self.leftBarButton setImage:[ImageProvider imageNamed:@"UIButtonBarArrowLeft"]
                        forState:UIControlStateNormal];
//   [self.leftBarButton setImage:[[ImageProvider imageNamed:@"UIButtonBarArrowLeft"] imageRenderWithTintColor:UIColor.systemGrayColor]
//                        forState:UIControlStateSelected];
//   [self.leftBarButton setImage:[[ImageProvider imageNamed:@"UIButtonBarArrowLeft"] imageRenderWithTintColor:UIColor.systemGrayColor]
//                        forState:UIControlStateHighlighted];
   
   [self.leftBarButtonItem setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];

   /**
    * Right
    */
   [self.navigationBarX.navigationBar setRightBarButtonItem:self.rightBarButtonItem];
   [self.rightBarButtonItem setEnabled:YES];
   [self.rightBarButtonItem setImage:nil];
   [self.rightBarButtonItem setTitle:nil];
   [self.rightBarButtonItem setWidth:[UISetting rightBarButtonWidth]];
   
   [self.rightBarButton setTintColorPicker:DKColorPickerWithKey([IDEAColor systemGreen])];
   [self.rightBarButton.titleLabel setText:nil];
   
   [self.rightBarButton setTitle:nil forState:UIControlStateNormal];
   [self.rightBarButton setTitle:nil forState:UIControlStateSelected];
   [self.rightBarButton setTitle:nil forState:UIControlStateHighlighted];
   
   [self.rightBarButton setImage:[ImageProvider imageNamed:@"UIButtonBarPlay"]
                        forState:UIControlStateNormal];
//   [self.rightBarButton setImage:[[ImageProvider imageNamed:@"UIButtonBarPlay"] imageRenderWithTintColor:UIColor.systemGrayColor]
//                        forState:UIControlStateSelected];
//   [self.rightBarButton setImage:[[ImageProvider imageNamed:@"UIButtonBarPlay"] imageRenderWithTintColor:UIColor.systemGrayColor]
//                        forState:UIControlStateHighlighted];
   
   [self.rightBarButton setTintColorPicker:DKColorPickerWithKey([IDEAColor systemGreen])];
   [self.rightBarButton setEnabled:NO];

   [self.icmpSwitch setOn:[SettingProvider isICMPEnable]];

   /**
    * Background Color
    */
   [self.view setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
         
      } /* End if () */
      
      return [IDEAColor colorWithKey:[IDEAColor systemGroupedBackground]];
   }];

   /**
    UITextField
    */
   [self.inputView setBackgroundColor:UIColor.clearColor];
   [self.textField setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor tertiarySystemGroupedBackground]];
         
      } /* End if () */

      return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
   }];
   [self.textField setCornerRadius:[UISetting cornerRadiusBig] clipsToBounds:YES];
   
   [self.textField setFont:[UIFont systemFontOfSize:self.textField.font.pointSize weight:UIFontWeightLight]];

   [self.textField setPlaceholderColorPicker:DKColorPickerWithKey([IDEAColor placeholderText])];

   [self.textField setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   
   [self.textField setDelegate:self];
   [self.textField setPlaceholder:APP_STR(@"IP Address / Host Name")];
   [self.textField setEdgeX:[UISetting textFieldEdgeX] edgeY:[UISetting textFieldEdgeY]];
   
   [self addNotificationName:UITextFieldTextDidChangeNotification
                    selector:@selector(textFieldTextDidChange:)
                      object:self.textField];
   
   [self.icmpLabel setFont:[UIFont systemFontOfSize:self.icmpLabel.font.pointSize weight:UIFontWeightLight]];
   [self.icmpLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor lightText])];
   [self.icmpLabel setTextColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {

      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor lightText]];
         
      } /* End if () */
      else {

         return [IDEAColor colorWithKey:[IDEAColor darkGray]];

      } /* End else */
   }];

   [self.textView setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor tertiarySystemGroupedBackground]];
         
      } /* End if () */

      return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
   }];
   [self.textView setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.textView setCornerRadius:[UISetting cornerRadiusBig] clipsToBounds:YES];
   [self.textView setText:nil];
   [self.textView setEditable:NO];

#if __Debug__
   DISPATCH_ASYNC_ON_MAIN_QUEUE(^{

      [self.textField setText:@"www.baidu.com"];
   });
#endif /* __Debug__ */
   
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
   
   bDone = [self.textField resignFirstResponder];
   
   if (!bDone) {
      
      bDone = [super resignFirstResponder];
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return bDone;
}

@end

#pragma mark - UIStoryboardSegue
@implementation TracerouteController (UIStoryboardSegue)

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
