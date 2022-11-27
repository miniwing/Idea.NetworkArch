//
//  MonitorController+Inner.m
//  PRIVACY
//
//  Created by Harry on 2022/10/14.
//

#import "MonitorRootController.h"

#import "MonitorController+Inner.h"
#import "MonitorController+Action.h"
#import "MonitorController+Notification.h"
#import "MonitorController+Theme.h"

@implementation MonitorController (Inner)

@end

#pragma mark - UIStoryboard
@implementation MonitorController (UIStoryboard)

+ (NSString *)storyboard {
   
   return @(MODULE);
}

+ (NSString *)bundle {

   return @(BUNDLE);
}

@end

IDEA_MAIN() {
   
   LogDebug((@"MonitorController::IDEA_MAIN"));
   
   [IDEAUIRouter registerURLPattern:@"MONITOR/create"
                          toHandler:^(NSString *aURL, NSDictionary *aRouter, IDEAUIRouterCompletion aCompletion) {
      
      LogDebug((@"MonitorController::IDEA_MAIN : URL     : %@", aURL));
      LogDebug((@"MonitorController::IDEA_MAIN : Router  : %@", aRouter));
      
      UIViewController  *stViewController = [UIStoryboard loadStoryboard:MonitorRootController.storyboard
                                                          viewController:MonitorRootController.class
                                                                inBundle:MonitorRootController.bundle];
      
      if (nil != aCompletion) {
         
         aCompletion(aURL, nil, stViewController);
         
      } /* End if () */
   }];
   
   return;
}
