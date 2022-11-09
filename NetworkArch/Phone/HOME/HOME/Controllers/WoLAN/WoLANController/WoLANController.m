//
//  WoLANController.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WoLANRootController.h"

#import "WoLANController.h"
#import "WoLANController+Inner.h"
#import "WoLANController+Signal.h"
#import "WoLANController+Notification.h"
#import "WoLANController+Theme.h"
#import "WoLANController+Debug.h"

#import "WoLANContentController.h"
#import "WoLANContentController+Inner.h"
#import "WoLANContentController+Signal.h"
#import "WoLANContentController+Notification.h"

#import "DeviceAwake.h"

@implementation WoLANController

- (void)dealloc {
   
   __LOG_FUNCTION;
   
   // Custom dealloc
   
   [self.contentController removeAllSignalResponders];

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
      self.onNotification(WoLANContentController.textChangeNotification, ^(NSNotification *aNotification) {
         
         @strongify(self);
         
         LogDebug((@"-[WoLANController initWithCoder:] : Notification : %@", aNotification));

         LogDebug((@"-[WoLANController initWithCoder:] : mac : %@", self.contentController.mac));
         LogDebug((@"-[WoLANController initWithCoder:] : port : %@", self.contentController.port));
         LogDebug((@"-[WoLANController initWithCoder:] : broadcastAddr : %@", self.contentController.broadcastAddr));

         if (kStringIsEmpty(self.contentController.mac) || kStringIsEmpty(self.contentController.broadcastAddr) || kStringIsEmpty(self.contentController.port)) {
            
            [self.rightBarButton setEnabled:NO];

         } /* End if () */
         else {
            
            [self.rightBarButton setEnabled:YES];

         } /* End else */

         return;
      });
      
      self.onNotification(WoLANContentController.doneNotification, ^(NSNotification *aNotification) {
         
         @strongify(self);
         
         LogDebug((@"-[WoLANController initWithCoder:] : Notification : %@", aNotification));

         [self.contentView setUserInteractionEnabled:YES];

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
   
   [self setTitle:__LOCALIZED_STRING(self.class, @"Wake on LAN")];
   LogDebug((@"-[WoLANController viewDidLoad] : Title : %@", __LOCALIZED_STRING(self.class, @"Wake on LAN")));

   [self.view setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor tertiarySystemGroupedBackground])];
   
   [self.navigationController setNavigationBarHidden:YES];
   
#if FULLSCREEN_POP_GESTURE
   [self setPrefersNavigationBarHidden:YES];
#else /* FULLSCREEN_POP_GESTURE */
   self.navigationController.interactivePopGestureRecognizer.delegate = self;
#endif /* !FULLSCREEN_POP_GESTURE */
   
   [self.navigationBarX.navigationBar setTitle:__LOCALIZED_STRING(self.class, @"Wake on LAN")];
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

@end

#pragma mark - UIStoryboardSegue
@implementation WoLANController (UIStoryboardSegue)

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)aSegue sender:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   // Get the new view controller using [aSegue destinationViewController].
   // Pass the selected object to the new view controller.
   
   if ([aSegue.identifier isEqualToString:WoLANContentController.className]) {
      
      self.contentController  = aSegue.destinationViewController;
            
   } /* End if () */
   
   __CATCH(nErr);
   
   return;
}

@end
