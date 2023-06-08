//
//  AboutController.m
//  Pods
//
//  Created by Harry on 2022/11/26.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "AboutController.h"
#import "AboutController+Inner.h"
#import "AboutController+Action.h"
#import "AboutController+Signal.h"
#import "AboutController+Notification.h"
#import "AboutController+Theme.h"
#import "AboutController+Debug.h"

@implementation AboutController

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
   
   [self setTitle:__LOCALIZED_STRING(self.class, @"ABOUT")];
   LogDebug((@"-[AboutController viewDidLoad] : Title : %@", __LOCALIZED_STRING(self.class, @"ABOUT")));

   [self.navigationController setNavigationBarHidden:YES];

#if FULLSCREEN_POP_GESTURE
   [self setPrefersNavigationBarHidden:YES];
#else /* FULLSCREEN_POP_GESTURE */
   self.navigationController.interactivePopGestureRecognizer.delegate = self;
#endif /* !FULLSCREEN_POP_GESTURE */

   [self.navigationBarX.navigationBar setTitle:__LOCALIZED_STRING(self.class, @"ABOUT")];
//   [self.navigationBarX setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
   
   [self.navigationBarX.navigationBar setAllowAnyTitleFontSize:YES];
   [self.navigationBarX.navigationBar setEnableRippleBehavior:NO];

   [self.view setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
         
      } /* End if () */

      return [IDEAColor colorWithKey:[IDEAColor systemGroupedBackground]];
   }];

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
   [self.navigationBarX.navigationBar setLeftBarButtonItem:self.leftBarButtonItem];
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

   /**
    * 内容设置
    */
   [self.sponsorImageView setBackgroundColor:UIColor.clearColor];
   [self.sponsorImageView setImage:[ImageProvider imageNamed:@"SPONSOR"]];
   
   [self.nameLabel setBackgroundColor:UIColor.clearColor];
   [self.nameLabel setFont:[UIFont systemFontOfSize:self.nameLabel.font.pointSize weight:UIFontWeightRegular]];
   [self.nameLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.nameLabel setText:[UIApplication sharedApplication].appBundleName];
   
   [self.versionLabel setBackgroundColor:UIColor.clearColor];
   [self.versionLabel setFont:[UIFont systemFontOfSize:self.versionLabel.font.pointSize weight:UIFontWeightLight]];
   [self.versionLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.versionLabel setText:[NSString stringWithFormat:@"Version %@", [UIApplication sharedApplication].appVersion]];

   [self.buildLabel setBackgroundColor:UIColor.clearColor];
   [self.buildLabel setFont:[UIFont systemFontOfSize:self.buildLabel.font.pointSize weight:UIFontWeightLight]];
   [self.buildLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.buildLabel setText:[NSString stringWithFormat:@"Build %@", [UIApplication sharedApplication].appBuildVersion]];

   [self.copyrightLabel setBackgroundColor:UIColor.clearColor];
   [self.copyrightLabel setFont:[UIFont systemFontOfSize:self.copyrightLabel.font.pointSize weight:UIFontWeightLight]];
   [self.copyrightLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   
   /**
    * 主动调整布局
    */
   [self.view setNeedsLayout];
   [self.view layoutIfNeeded];

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
@implementation AboutController (UIStoryboardSegue)

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
