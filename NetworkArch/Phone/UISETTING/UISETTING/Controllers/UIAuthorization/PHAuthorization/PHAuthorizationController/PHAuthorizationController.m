//
//  PHAuthorizationController.m
//  UISETTING
//
//  Created by Harry on 2022/6/20.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "PHAuthorizationController.h"
#import "PHAuthorizationController+Inner.h"

@interface PHAuthorizationController ()

@end

@implementation PHAuthorizationController

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
   
   //   [self setTitle:__LOCALIZED_STRING(self.class, @"SETTING")];
   [self.navigationItem setTitle:__LOCALIZED_STRING(self.class, @"Permission Title")];
   [self.tabBarItem setTitle:__LOCALIZED_STRING(self.class, @"Permission Title")];
   LogDebug((@"-[UISettingController viewDidLoad] : Title : %@", __LOCALIZED_STRING(self.class, @"Permission Title")));
   
   [self.navigationController setNavigationBarHidden:YES];
   
#if FULLSCREEN_POP_GESTURE
   [self setPrefersNavigationBarHidden:YES];
#else /* FULLSCREEN_POP_GESTURE */
   self.navigationController.interactivePopGestureRecognizer.delegate = self;
#endif /* !FULLSCREEN_POP_GESTURE */
   
   [self.navigationBarX.navigationBar setTitle:__LOCALIZED_STRING(self.class, @"Permission Title")];
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
   [self.navigationBarX.navigationBar setRightBarButtonItem:self.rightBarButtonItem];
   [self.rightBarButtonItem setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.rightBarButtonItem setImage:nil];
   [self.rightBarButtonItem setTitle:nil];
   [self.rightBarButtonItem setWidth:[UISetting rightBarButtonWidth]];
   
   [self.rightBarButton setImage:[ImageProvider imageNamed:@"UIButtonBarClose"]
                        forState:UIControlStateNormal];
   
   [self.rightBarButton setImage:[[ImageProvider imageNamed:@"UIButtonBarClose"] imageRenderWithTintColor:UIColor.systemGrayColor]
                        forState:UIControlStateSelected];
   
   [self.rightBarButton setImage:[[ImageProvider imageNamed:@"UIButtonBarClose"] imageRenderWithTintColor:UIColor.systemGrayColor]
                        forState:UIControlStateHighlighted];
   
   /**
    * 主动调整布局
    */
   [self.view setNeedsLayout];
   [self.view layoutIfNeeded];
   
   if (@available(iOS 13, *)) {
      
      self.modalInPresentation      = YES;
      
   } /* End if () */
   else {
      
#if FULLSCREEN_POP_GESTURE
      self.interactivePopDisabled   = YES;
#else /* FULLSCREEN_POP_GESTURE */
      self.navigationController.interactivePopGestureRecognizer.enabled = NO;
#endif /* !FULLSCREEN_POP_GESTURE */
      
   } /* End else */
   
   /**
    * 模态状态下，状态栏控制。
    */
   self.modalPresentationCapturesStatusBarAppearance  = YES;
   
   [self.iconImageViewX setImage:__IMAGE_NAMED(@"permission-lock", self.class)];
   
   if (kStringIsBlank(_permissionTip)) {
      
      [self.tipLabelX setText:__LOCALIZED_STRING(self.class, @"No Permission")];
      
   } /* End if () */
   else {
      
      [self.tipLabelX setText:_permissionTip];
      
   } /* End else */
   
   [self.tipLabelX setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   
   [self.allowButtonX setCornerRadius:[UISetting cornerRadiusSmall]
                        clipsToBounds:YES];
   
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

#pragma mark - (PHAuthorizationAnimation *)authorizationAnimation
- (PHAuthorizationAnimation *)authorizationAnimation {
   
   if (nil == _authorizationAnimation) {
      
      _authorizationAnimation = [[PHAuthorizationAnimation alloc] init];
   }
   
   return _authorizationAnimation;
}

- (void)setPermissionTip:(NSString *)aPermissionTip {
   
   _permissionTip = aPermissionTip;
   
   if (kStringIsBlank(_permissionTip)) {
            
   } /* End if () */
   else {
      
      [self.tipLabelX setText:_permissionTip];

   } /* End else */
   
   return;
}

+ (NSString *)PERMISSION_KEY {
   
   return @"PERMISSION.KEY";
}

@end

#pragma mark - UIStoryboardSegue
@implementation PHAuthorizationController (UIStoryboardSegue)

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
