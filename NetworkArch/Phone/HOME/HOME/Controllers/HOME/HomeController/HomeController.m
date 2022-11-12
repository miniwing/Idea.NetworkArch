//
//  HomeController.m
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import <NetworkService/INetworkService.h>

#import <APPDATA/APPDATA.h>
#import <APPDATA/NetworkArch.h>

#import <INTRODUCTION/IntroductionController+Notification.h>

#import "HomeContentController+Inner.h"
#import "HomeContentController+Signal.h"

#import "HomeController.h"
#import "HomeController+Inner.h"
#import "HomeController+Action.h"
#import "HomeController+Signal.h"
#import "HomeController+Notification.h"
#import "HomeController+Theme.h"
#import "HomeController+Debug.h"

@implementation HomeController

- (void)dealloc {
   
   __LOG_FUNCTION;
   
   // Custom dealloc
   
//   [self removeSignalResponder:self.contentController];
   
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
      self.onNotification(SERVICE(INetworkService).networkStatusNotification, ^(NSNotification *aNotification) {

         LogDebug((@"-[HomeController initWithCoder:] : networkStatusNotification : %@", aNotification));

         @strongify(self);
         
         if ([SettingProvider isPrivacy]) {
            
            [self sendSignal:HomeContentController.loadWifiInfoSignal];
            [self sendSignal:HomeContentController.loadCellularInfoSignal];

         } /* End if () */

         return;
      });

      self.onNotification(SettingProvider.apiKeySettingNotification, ^(NSNotification *aNotification) {

         LogDebug((@"-[HomeController initWithCoder:] : networkStatusNotification : %@", aNotification));

         @strongify(self);
         [UIView transitionWithView:self.navigationBarX
                           duration:[UIView animationDefaultDuration]
                            options:UIViewAnimationOptionTransitionCrossDissolve
                         animations:^{

            if ([SettingProvider isApiKeySetting]) {

               [self.navigationBarX.navigationBar setRightBarButtonItem:self.rightBarButtonItem];

            } /* End if () */
            else {

               [self.navigationBarX.navigationBar setRightBarButtonItem:nil];

            } /* End else */
         }
                         completion:nil];

         return;
      });
      
#if PRIVACY
      self.onNotification(PrivacyController.trackingDoneNotification, ^(NSNotification *aNotification) {

         LogDebug((@"-[HomeController initWithCoder:] : trackingDoneNotification : %@", aNotification));

         @strongify(self);

         DISPATCH_ASYNC_ON_MAIN_QUEUE(^{

            [self.locationManager requestAlwaysAuthorization];

            [self.contentController sendSignal:HomeContentController.loadWifiInfoSignal];
            [self.contentController sendSignal:HomeContentController.loadCellularInfoSignal];
            
            return;
         });

         return;
      });
#else
      self.onNotification(IntroductionController.introductionDoneNotification, ^(NSNotification *aNotification) {
         
         LogDebug((@"-[HomeController onNotification:] : introductionDoneNotification : %@", aNotification.name));

         @strongify(self);

         DISPATCH_ASYNC_ON_MAIN_QUEUE(^{

            [self.locationManager requestAlwaysAuthorization];

            [self.contentController sendSignal:HomeContentController.loadWifiInfoSignal];
            [self.contentController sendSignal:HomeContentController.loadCellularInfoSignal];
            
            return;
         });

         return;
      });
#endif /* PRIVACY */
      
      self.onNotification(HomeController.settingNotification, ^(NSNotification *aNotification) {

         LogDebug((@"-[HomeController initWithCoder:] : settingNotification : %@", aNotification));

         @strongify(self);
         [IDEAUIRouter openURL:@"HOME.SETTING/create"
                    completion:^(NSString *aURL, NSError *aError, UIViewController *aViewController) {

            if (nil != aViewController) {

               LogDebug((@"-[HomeController initWithCoder:] : %@ : %@", aURL, aViewController));
               
               [aViewController setModalPresentationStyle:UIModalPresentationFullScreen];

               [self presentViewController:aViewController
                                  animated:YES
                                completion:^{
                  
               }];
            } /* End if () */
         }];

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
   
//   [self setTitle:__LOCALIZED_STRING(self.class, @"HOME")];
   [self.navigationItem setTitle:__LOCALIZED_STRING(self.class, @"HOME")];
   [self.tabBarItem setTitle:__LOCALIZED_STRING(self.class, @"HOME")];
   LogDebug((@"-[HomeController viewDidLoad] : Title : %@", __LOCALIZED_STRING(self.class, @"HOME")));
   
   [self.navigationController setNavigationBarHidden:YES];

#if FULLSCREEN_POP_GESTURE
   [self setPrefersNavigationBarHidden:YES];
#else /* FULLSCREEN_POP_GESTURE */
   self.navigationController.interactivePopGestureRecognizer.delegate = self;
#endif /* !FULLSCREEN_POP_GESTURE */

   [self.navigationBarX.navigationBar setTitle:__LOCALIZED_STRING(self.class, @"HOME")];
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
   
   [self.rightBarButton setImage:[ImageProvider imageNamed:@"plus.circle"] // @"UIButtonBarSetting"
                          forState:UIControlStateNormal];
//   [self.rightBarButton setImage:[[ImageProvider imageNamed:@"plus.circle"] imageRenderWithTintColor:UIColor.systemBlueColor]
//                          forState:UIControlStateSelected];
//   [self.rightBarButton setImage:[[ImageProvider imageNamed:@"plus.circle"] imageRenderWithTintColor:UIColor.systemRedColor]
//                          forState:UIControlStateHighlighted];

   [self.contentView setBackgroundColor:UIColor.clearColor];

   if ([SettingProvider isPrivacy]) {
      
      [self.locationManager requestAlwaysAuthorization];

   } /* End if () */
   
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
   
//   [self.contentController viewWillAppear:aAnimated];
   
//   if ([APPDelegate isApiKeySetting]) {
//      
//      [self.rightBarButtonItem setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];
//      [self.rightBarButtonItem setImage:[UIImage imageNamed:@"UIButtonBarSetting"]];
//
//      [self.rightBarButtonItem setEnabled:YES];
//      [self.appBar.navigationBar.rightBarButtonItem setEnabled:YES];
//
//   } /* End if () */
//   else {
//
//      [self.rightBarButtonItem setTintColor:UIColor.clearColor];
//      [self.rightBarButtonItem setImage:nil];
//
//      [self.rightBarButtonItem setEnabled:NO];
//      [self.appBar.navigationBar.rightBarButtonItem setEnabled:NO];
//
//   } /* End else */

   __CATCH(nErr);
   
   return;
}

- (void)viewDidAppear:(BOOL)aAnimated {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewDidAppear:aAnimated];
   
   if ([SettingProvider isPrivacy]) {
      
      [self.locationManager requestAlwaysAuthorization];

   } /* End if () */
   
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

#pragma mark - (CLLocationManager *)locationManager
- (CLLocationManager *)locationManager {
   
   if (nil == _locationManager) {
      
      _locationManager  = [[CLLocationManager alloc] init];
      
      [_locationManager setDelegate:self];
      
   } /* End if () */
   
   return _locationManager;
}

@end

#pragma mark - UIStoryboardSegue
@implementation HomeController (UIStoryboardSegue)

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)aSegue sender:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   // Get the new view controller using [aSegue destinationViewController].
   // Pass the selected object to the new view controller.
   
   if ([aSegue.identifier isEqualToString:HomeContentController.className]) {
      
      self.contentController  = aSegue.destinationViewController;

   } /* End if () */
   
   __CATCH(nErr);
   
   return;
}

@end
