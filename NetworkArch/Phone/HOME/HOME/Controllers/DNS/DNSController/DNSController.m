//
//  DNSController.m
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

#import "DNSRootController+Inner.h"

#import "DNSController.h"
#import "DNSController+Action.h"
#import "DNSController+Inner.h"
#import "DNSController+Signal.h"
#import "DNSController+Notification.h"
#import "DNSController+Theme.h"
#import "DNSController+Debug.h"

@implementation DNSController

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
            
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (void)viewDidLoad {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;
   
   [super viewDidLoad];
      
   [self setTitle:__LOCALIZED_STRING(self.class, @"DNS Lookup")];
   LogDebug((@"-[PingController viewDidLoad] : Title : %@", __LOCALIZED_STRING(self.class, @"DNS Lookup")));

   [self.navigationController setNavigationBarHidden:YES];
   
#if FULLSCREEN_POP_GESTURE
   [self setPrefersNavigationBarHidden:YES];
#else /* FULLSCREEN_POP_GESTURE */
   self.navigationController.interactivePopGestureRecognizer.delegate = self;
#endif /* !FULLSCREEN_POP_GESTURE */
   
   [self.navigationBarX.navigationBar setTitle:__LOCALIZED_STRING(self.class, @"DNS Lookup")];
   [self.navigationBarX setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
   
   [self.navigationBarX.navigationBar setAllowAnyTitleFontSize:YES];
   [self.navigationBarX.navigationBar setEnableRippleBehavior:NO];
   
   [self.navigationBarX showLine:YES];
   
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
//   [self.textField setBackground:[UIImage imageNamed:@"CLEAR-IMAGE"]];
   [self.textField setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
   [self.textField setCornerRadius:[UISetting cornerRadiusBig] clipsToBounds:YES];
   
   [self.textField setFont:[UIFont systemFontOfSize:self.textField.font.pointSize weight:UIFontWeightLight]];
   
   [self.textField setPlaceholderColorPicker:DKColorPickerWithKey([IDEAColor placeholderText])];
   
   [self.textField setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   
   [self.textField setDelegate:self];
   [self.textField setPlaceholder:__LOCALIZED_STRING(self.class, @"Domain Name")];
   [self.textField setEdgeX:10 edgeY:0];

   /**
    ContentView
    */
//   [self.contentView setCornerRadius:8 clipsToBounds:YES];
   [self.contentView setHidden:YES];
   [self.contentView setBackgroundColor:UIColor.clearColor];
   
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
   
#if __Debug__
   DISPATCH_ASYNC_ON_MAIN_QUEUE(^{
      
      [self.textField setText:@"www.twitter.com"];
   });
#endif /* __Debug__ */
   
   /**
    注册消息响应
    */
   [self addSignalResponder:self.contentController];
   [self.contentController addSignalResponder:self];
   
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
      
      [self.textField becomeFirstResponder];
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
@implementation DNSController (UIStoryboardSegue)

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)aSegue sender:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   // Get the new view controller using [aSegue destinationViewController].
   // Pass the selected object to the new view controller.
   if ([aSegue.identifier isEqualToString:DNSContentController.className]) {
      
      self.contentController  = aSegue.destinationViewController;
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return;
}

@end
