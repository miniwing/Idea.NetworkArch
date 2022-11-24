//
//  TodayWidgetController.m
//  TodayWidget
//
//  Created by Harry on 2021/7/24.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "TodayWidgetController.h"
#import "TodayWidgetController+Inner.h"

@implementation TodayWidgetController

- (void)dealloc {
   
   __LOG_FUNCTION;
   
   // Custom dealloc
   
//   [self removeSignalResponder:self.contentController];
   
   [self removeAllSignalResponders];
   [self unobserveAllNotifications];

   __SUPER_DEALLOC;
   
   return;
}

- (void)viewDidLoad {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewDidLoad];
   
   // Do any additional setup after loading the view.
   
   [self.view setBackgroundColorPicker:nil];
   [self.view setBackgroundColor:UIColor.clearColor];
   
   [self.contentView setBackgroundColorPicker:nil];
   [self.contentView setBackgroundColor:UIColor.clearColor];
   
   [self.locationManager requestAlwaysAuthorization];
   [self addSignalResponder:self.contentController];
   
//   [self.extensionContext setWidgetLargestAvailableDisplayMode:NCWidgetDisplayModeExpanded];
   
   __CATCH(nErr);
   
   return;
}

- (void)viewWillAppear:(BOOL)aAnimated {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewWillAppear:aAnimated];
   
   [self.contentController.tableView reloadData];
   
   __CATCH(nErr);
   
   return;
}

- (void)viewDidAppear:(BOOL)aAnimated {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewDidAppear:aAnimated];
   
   [self.locationManager requestAlwaysAuthorization];
   
   if (@available(iOS 13, *)) {
      
      if (UIUserInterfaceStyleDark == self.traitCollection.userInterfaceStyle) {
         
         [[DKNightVersionManager sharedManager] nightFalling];
         
      } /* End if () */
      else {
         
         [[DKNightVersionManager sharedManager] dawnComing];
         
      } /* End else */
      
   } /* End if () */
   
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
@implementation TodayWidgetController (UIStoryboardSegue)

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)aSegue sender:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   // Get the new view controller using [aSegue destinationViewController].
   // Pass the selected object to the new view controller.
   
   if ([aSegue.identifier isEqualToString:TodayWidgetContentController.className]) {
      
      self.contentController  = aSegue.destinationViewController;
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return;
}

@end
