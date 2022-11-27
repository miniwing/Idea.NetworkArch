//
//  AboutController+Inner.m
//  Pods
//
//  Created by Harry on 2022/11/26.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "AboutController+Inner.h"
#import "AboutController+Action.h"
#import "AboutController+Signal.h"
#import "AboutController+Notification.h"
#import "AboutController+Theme.h"
#import "AboutController+Debug.h"

@implementation AboutController (Inner)

@end

#pragma mark - UIStoryboard
@implementation AboutController (UIStoryboard)

+ (NSString *)storyboard {

   return @"UISETTING";
}

+ (NSString *)bundle {
   
   return @(BUNDLE);
}

@end

#pragma mark - IDEA_MAIN
IDEA_MAIN() {
   
   LogDebug((@"AboutController::IDEA_MAIN"));
   
   [IDEAUIRouter registerURLPattern:@"ABOUT/create"
                          toHandler:^(NSString *aURL, NSDictionary *aRouter, IDEAUIRouterCompletion aCompletion) {
      
      LogDebug((@"AboutController::IDEA_MAIN : URL      : %@", aURL));
      LogDebug((@"AboutController::IDEA_MAIN : Router   : %@", aRouter));
      
      UIViewController  *stViewController = [UIStoryboard loadStoryboard:AboutController.storyboard
                                                          viewController:AboutController.class
                                                                inBundle:AboutController.bundle];
      
      if (nil != aCompletion) {
         
         aCompletion(aURL, nil, stViewController);
         
      } /* End if () */
   }];
   
   return;
}
