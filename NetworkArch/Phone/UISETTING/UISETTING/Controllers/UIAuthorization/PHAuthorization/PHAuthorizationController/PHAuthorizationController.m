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
   
   NSMutableDictionary           *stTitleAttributes                        = nil;
   
   __TRY;
   
   [super viewDidLoad];
   
   // Do any additional setup after loading the view.
   [self.view setBackgroundColor:UIColor.clearColor];
   
   [self.backgroundViewX setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor tertiarySystemBackground]];
         
      } /* End if () */
      else {
         
         return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
         
      } /* End else */
   }];

   [self.navigationView setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor tertiarySystemBackground]];
         
      } /* End if () */
      else {
         
         return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
         
      } /* End else */
   }];
   
   [self.navigationBar setTranslucent:NO];
   [self.navigationBar setShadowColor:UIColor.clearColor];
   [self.navigationBar setShadowImage:[UIImage new]];
   [self.navigationBar setBackgroundColor:UIColor.clearColor];
   [self.navigationBar setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {

      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {

         return [IDEAColor colorWithKey:[IDEAColor tertiarySystemBackground]];

      } /* End if () */
      else {

         return [IDEAColor colorWithKey:[IDEAColor systemBackground]];

      } /* End else */
   }];
   
//   [self.navigationBar setBarTintColor:UIColor.clearColor];
   [self.navigationBar setBarTintColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor tertiarySystemBackground]];
         
      } /* End if () */
      else {
         
         return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
         
      } /* End else */
   }];
   
   [self.navigationBar setBackgroundImage:nil
                            forBarMetrics:UIBarMetricsDefault];
   
//   [self.navigationBar setBackgroundImagePicker:^UIImage *(DKThemeVersion *aThemeVersion) {
//
//      return [UIImage imageWithColor:UIColorX.systemBackgroundColor];
//   }
//                                  forBarMetrics:UIBarMetricsDefault];
   
   [self.navigationItemTitle setTitle:__LOCALIZED_STRING(self.class, @"Permission Title")];
//   [self.navigationItemTitle setTitle:__LOCALIZED_STRING(self.class, @"服务器选择")];

   if (nil == self.navigationBar.titleTextAttributes) {
      
      stTitleAttributes = [NSMutableDictionary dictionary];
      
   } /* End if () */
   else {
      
      stTitleAttributes = [self.navigationBar.titleTextAttributes mutableCopy];
      
   } /* End else */
   
   [stTitleAttributes setObject:[IDEAColor colorWithKey:[IDEAColor label]]
                         forKey:NSForegroundColorAttributeName];
   [stTitleAttributes setObject:[UIFont systemFontOfSize:16 weight:UIFontWeightRegular]
                         forKey:NSFontAttributeName];
   
   [self.navigationBar setTitleTextAttributes:stTitleAttributes];
   
   [self.rightBarButtonItem setTitle:nil];
   [self.rightBarButtonItem setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.rightBarButtonItem setImage:[ImageProvider imageNamed:@"UIButtonBarClose"]];

   /**
    * 主动调整布局
    */
   [self.view setNeedsLayout];
   [self.view layoutIfNeeded];
      
   [self.navigationView setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight
                               radius:8];
      
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
   
   [self.allowButtonX setCornerRadius:5 clipsToBounds:YES];

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
