//
//  PortScanController.m
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "PortScanRootController.h"

#import "PortScanController.h"
#import "PortScanController+Inner.h"
#import "PortScanController+Action.h"
#import "PortScanController+Signal.h"
#import "PortScanController+Notification.h"
#import "PortScanController+Theme.h"
#import "PortScanController+Debug.h"

@implementation PortScanController

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
            
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (void)viewDidLoad {
   
   int                            nErr                                     = EFAULT;

#if ADS_GOOGLE_MOBILE
   NSDictionary                  *stAdUnitIDs                              = nil;
   NSString                      *szAdUnitID                               = nil;
#endif /* ADS_GOOGLE_MOBILE */

   __TRY;
   
   [super viewDidLoad];
         
   [self setTitle:__LOCALIZED_STRING(self.class, @"Port Scan")];
   LogDebug((@"-[PortScanController viewDidLoad] : Title : %@", __LOCALIZED_STRING(self.class, @"Port Scan")));
   
   [self.navigationController setNavigationBarHidden:YES];
   
#if FULLSCREEN_POP_GESTURE
   [self setPrefersNavigationBarHidden:YES];
#else /* FULLSCREEN_POP_GESTURE */
   self.navigationController.interactivePopGestureRecognizer.delegate = self;
#endif /* !FULLSCREEN_POP_GESTURE */
   
   [self.navigationBarX.navigationBar setTitle:__LOCALIZED_STRING(self.class, @"Port Scan")];
   LogDebug((@"-[TracerouteController viewDidLoad] : Title : %@", __LOCALIZED_STRING(self.class, @"Port Scan")));
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
   [self.textField setPlaceholder:__LOCALIZED_STRING(self.class, @"IP Address / Host Name")];
   [self.textField setEdgeX:[UISetting textFieldEdgeX] edgeY:[UISetting textFieldEdgeY]];
   
   [self addNotificationName:UITextFieldTextDidChangeNotification
                    selector:@selector(textFieldTextDidChange:)
                      object:self.textField];
   /**
    说明 Label
    */
   [self.portLabel setText:__LOCALIZED_STRING(self.class, @"Ports Tetween : ")];
   [self.portLabel setFont:[UIFont systemFontOfSize:self.portLabel.font.pointSize weight:UIFontWeightLight]];
   [self.portLabel setTextColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {

      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor lightText]];
         
      } /* End if () */
      else {

         return [IDEAColor colorWithKey:[IDEAColor darkGray]];

      } /* End else */
   }];

   /**
    开始端口
    */
   [self.fromPortTextField setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
   [self.fromPortTextField setCornerRadius:[UISetting cornerRadiusSmall] clipsToBounds:YES];
   [self.fromPortTextField setFont:[UIFont systemFontOfSize:self.fromPortTextField.font.pointSize weight:UIFontWeightLight]];
   
   [self.fromPortTextField setPlaceholderColorPicker:DKColorPickerWithKey([IDEAColor placeholderText])];
   [self.fromPortTextField setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

   [self.portAndLabel setText:__LOCALIZED_STRING(self.class, @" And ")];
   [self.portAndLabel setFont:[UIFont systemFontOfSize:self.portAndLabel.font.pointSize weight:UIFontWeightLight]];
//   [self.portAndLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor lightText])];
   [self.portAndLabel setTextColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {

      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor lightText]];
         
      } /* End if () */
      else {

         return [IDEAColor colorWithKey:[IDEAColor darkGray]];

      } /* End else */
   }];

   /**
    结束端口
    */
   [self.toPortTextField setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
   [self.toPortTextField setCornerRadius:[UISetting cornerRadiusSmall] clipsToBounds:YES];
   [self.toPortTextField setFont:[UIFont systemFontOfSize:self.toPortTextField.font.pointSize weight:UIFontWeightLight]];
   
   [self.toPortTextField setPlaceholderColorPicker:DKColorPickerWithKey([IDEAColor placeholderText])];
   [self.toPortTextField setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

   /**
    扫描过程
    */
   [self.portView setBackgroundColor:UIColor.clearColor];
   
   [self.portScanLabel setText:__LOCALIZED_STRING(self.class, @"Scaning Port : ")];
//   [self.portScanLabel setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
   [self.portScanLabel setCornerRadius:[UISetting cornerRadiusBig] clipsToBounds:YES];
   [self.portScanLabel setFont:[UIFont systemFontOfSize:self.portScanLabel.font.pointSize weight:UIFontWeightLight]];
   [self.portScanLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

   [self.portScaningLabel setText:__LOCALIZED_STRING(self.class, @"Scaning Port : ")];
   [self.portScaningLabel setCornerRadius:[UISetting cornerRadiusBig] clipsToBounds:YES];
   [self.portScaningLabel setFont:[UIFont systemFontOfSize:self.portScaningLabel.font.pointSize weight:UIFontWeightLight]];
   [self.portScaningLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.portScaningLabel setText:nil];

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

   /**
    * 广告
    */
#if ADS_GOOGLE_MOBILE
   stAdUnitIDs = [AD admobs];
   LogDebug((@"-[PortScanController viewDidLoad] : AdUnitIDs : %@", stAdUnitIDs));
   
   szAdUnitID  = [stAdUnitIDs objectForKey:@"UNIVERSAL-BANNER"];
   
   [self.bannerView setBackgroundColor:UIColor.clearColor];
   [self.gadBannerView setCornerRadius:[UISetting cornerRadiusSmall] clipsToBounds:YES];
   [self.gadBannerView setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor tertiarySystemGroupedBackground]];
         
      } /* End if () */
      
      return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
   }];
   
   [self.bannerViewWidth setConstant:self.view.width];
   [self.bannerViewHeight setConstant:0];
   [self.bannerView setHidden:YES animated:NO];

   [self.gadBannerView setAdUnitID:szAdUnitID];
   [self.gadBannerView setAdSize:GADAdSizeBanner];
   [self.gadBannerView setAutoloadEnabled:YES];

   [self.gadBannerView setRootViewController:self];
   [self.gadBannerView setDelegate:self];
   [self.gadBannerView setAdSizeDelegate:self];
   
   [self postSignal:PortScanController.loadADSignal
            onQueue:DISPATCH_GET_MAIN_QUEUE()];
#endif /* ADS_GOOGLE_MOBILE */

#if __Debug__
   DISPATCH_ASYNC_ON_MAIN_QUEUE(^{
      
      [self.textField setText:@"192.168.3.1"];
      
      [self.fromPortTextField setText:@"80"];
      [self.toPortTextField   setText:@"8888"];

      [self.fromPortTextField setText:nil];
      [self.toPortTextField   setText:nil];
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

@end

#pragma mark - UIStoryboardSegue
@implementation PortScanController (UIStoryboardSegue)

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
