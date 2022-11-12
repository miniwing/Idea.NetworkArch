//
//  WhoisController.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import <SettingProvider/SettingProvider.h>
#import <SettingProvider/UISetting.h>

#import "WhoisRootController.h"

#import "WhoisController.h"
#import "WhoisController+Inner.h"
#import "WhoisController+Action.h"
#import "WhoisController+Signal.h"
#import "WhoisController+Notification.h"
#import "WhoisController+Theme.h"
#import "WhoisController+Debug.h"

@implementation WhoisController

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

#if GOOGLE_MOBILE_ADS
   NSDictionary                  *stAdUnitIDs                              = nil;
   NSString                      *szAdUnitID                               = nil;
#endif /* GOOGLE_MOBILE_ADS */

   __TRY;
   
   [super viewDidLoad];
      
   [self setTitle:__LOCALIZED_STRING(self.class, @"Whois")];
   LogDebug((@"-[WhoisController viewDidLoad] : Title : %@", __LOCALIZED_STRING(self.class, @"Whois")));

   [self.view setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
         
      } /* End if () */
      
      return [IDEAColor colorWithKey:[IDEAColor systemGroupedBackground]];
   }];
   [self.navigationController setNavigationBarHidden:YES];
   
#if FULLSCREEN_POP_GESTURE
   [self setPrefersNavigationBarHidden:YES];
#else /* FULLSCREEN_POP_GESTURE */
   self.navigationController.interactivePopGestureRecognizer.delegate = self;
#endif /* !FULLSCREEN_POP_GESTURE */
   
   [self.navigationBarX.navigationBar setTitle:__LOCALIZED_STRING(self.class, @"Whois")];
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
   
   [self.rightBarButton setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];
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
   [self.textField setEdgeX:[UISetting textFieldEdgeX] edgeY:[UISetting textFieldEdgeY]];

   [self.textField setFont:[UIFont systemFontOfSize:self.textField.font.pointSize
                                             weight:UIFontWeightLight]];
      
   [self.textField setDelegate:self];
   [self.textField setPlaceholder:__LOCALIZED_STRING(self.class, @"IP / AS / Domain Name")];

   [self.textField setPlaceholderColorPicker:DKColorPickerWithKey([IDEAColor placeholderText])];
   [self.textField setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

   /**
    UITextView
    */
   [self.textView setCornerRadius:[UISetting cornerRadiusBig] clipsToBounds:YES];
   [self.textView setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor tertiarySystemGroupedBackground]];
         
      } /* End if () */

      return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
   }];
   [self.textView setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.textView setHidden:YES];
   [self.textView setFont:[UIFont systemFontOfSize:self.textView.font.pointSize
                                            weight:UIFontWeightLight]];
   [self.textView setEditable:NO];

   /**
    MDCActivityIndicator
    */
   [self.activityIndicator setBackgroundColor:UIColor.clearColor];
   [self.activityIndicator setIndicatorMode:MDCActivityIndicatorModeIndeterminate];
   [self.activityIndicator setTrackEnabled:YES];
   
   if ([DKThemeVersionNormal isEqualToString:[DKNightVersionManager sharedManager].themeVersion]) {
      
      [self.activityIndicator setCycleColors:@[
         
         [MDCPalette paletteGeneratedFromColor:UIColor.darkGrayColor].tint500, MDCPalette.greyPalette.tint500
      ]];
      
   } /* End if () */
   else {
      
      [self.activityIndicator setCycleColors:@[
         [MDCPalette paletteGeneratedFromColor:UIColor.lightGrayColor].tint500, MDCPalette.greyPalette.tint500
      ]];
      
   } /* End else */
   
   [self.activityIndicator setHidden:YES];

   /**
    监听输入
    */
   [self addNotificationName:UITextFieldTextDidChangeNotification
                    selector:@selector(textFieldTextDidChange:)
                      object:self.textField];
   
   /**
    * 广告
    */
#if GOOGLE_MOBILE_ADS
   stAdUnitIDs = [AD admobs];
   LogDebug((@"-[WhoisController viewDidLoad] : AdUnitIDs : %@", stAdUnitIDs));
   
   szAdUnitID  = [stAdUnitIDs objectForKey:@"UNIVERSAL-BANNER"];
   
#if __Debug__
   [self.bannerView setBackgroundColor:UIColorX.systemYellowColor];
#else /* __Debug__ */
   [self.bannerView setBackgroundColor:UIColor.clearColor];
#endif /* !__Debug__ */
   [self.gadBannerView setCornerRadius:[UISetting cornerRadiusSmall] clipsToBounds:YES];
   [self.gadBannerView setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor tertiarySystemGroupedBackground]];
         
      } /* End if () */
      
      return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
   }];
   
   [self.bannerView setHidden:YES animated:NO];
   [self.bannerViewWidth setConstant:self.view.width];
   [self.bannerViewHeight setConstant:0];

   [self.gadBannerView setAdUnitID:szAdUnitID];
   [self.gadBannerView setAdSize:GADAdSizeBanner];
   [self.gadBannerView setAutoloadEnabled:YES];

   [self.gadBannerView setRootViewController:self];
   [self.gadBannerView setDelegate:self];
   [self.gadBannerView setAdSizeDelegate:self];
   
   [self postSignal:WhoisController.loadADSignal
            onQueue:DISPATCH_GET_MAIN_QUEUE()];
#endif /* GOOGLE_MOBILE_ADS */

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

- (void)viewDidLayoutSubviews {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewDidLayoutSubviews];
   
   [self.activityIndicator setRadius:self.activityIndicator.height / 2];
   
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
   
   dispatch_once(&_firstResponder, ^{
      
      DISPATCH_ASYNC_ON_MAIN_QUEUE(^{
         
#if __Debug__
         [self.textField setText:@"baidu.com"];
#endif /* __Debug__ */
         
         [self.textField becomeFirstResponder];
         
         LogDebug((@"-[WhoisController viewDidAppear] : becomeFirstResponder"));
         
         return;
      });
   });
   
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
   
   _firstResponder   = 0;
   
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
@implementation WhoisController (UIStoryboardSegue)

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

