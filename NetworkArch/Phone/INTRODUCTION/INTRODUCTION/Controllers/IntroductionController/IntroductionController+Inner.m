//
//  IntroductionController+Inner.m
//  INTRODUCTION
//
//  Created by Harry on 2022/11/9.
//

#import "IntroductionController+Inner.h"
#import "IntroductionController+Action.h"
#import "IntroductionController+Notification.h"
#import "IntroductionController+Theme.h"

@implementation IntroductionController (Inner)

@end

#pragma mark - UIStoryboard
@implementation IntroductionController (UIStoryboard)

+ (NSString *)storyboard {
   
   return @(MODULE);
}

+ (NSString *)bundle {

   return @(BUNDLE);
}

@end

#pragma mark - IDEAPresentationControllerDelegate
@implementation IntroductionController (IDEAPresentationControllerDelegate)

- (CGRect)frameOfPresented {
   
   LogDebug((@"-[IntroductionController frameOfPresented] : presentationController : %@", self.presentationController));
   LogDebug((@"-[IntroductionController frameOfPresented] : presentedViewController : %@", self.presentedViewController));

   return CGRectMake(0,
                     [UIWindow topSafeAreaInset] + [self intrinsicNavigationBarSize].height,
                     self.view.width,
                     self.view.height - ([UIWindow topSafeAreaInset] + [self intrinsicNavigationBarSize].height) - ([(UITabBarController *)UIApplication.sharedApplication.delegate.window.rootViewController tabBar].height));
}

- (BOOL)backgroundTouchToClose {
   
   return NO;
}

@end


#pragma mark - IDEA_MAIN
IDEA_MAIN() {
   
   LogDebug((@"IntroductionController::IDEA_MAIN"));
   
   [IDEAUIRouter registerURLPattern:@"INTRODUCTION/create"
                          toHandler:^(NSString *aURL, NSDictionary *aRouter, IDEAUIRouterCompletion aCompletion) {
      
      LogDebug((@"IntroductionController::IDEA_MAIN : URL     : %@", aURL));
      LogDebug((@"IntroductionController::IDEA_MAIN : Router  : %@", aRouter));
      
      UIViewController  *stViewController = [UIStoryboard loadStoryboard:IntroductionController.storyboard
                                                          viewController:IntroductionController.class
                                                                inBundle:IntroductionController.bundle];
      
      if (nil != aCompletion) {
         
         aCompletion(aURL, nil, stViewController);
         
      } /* End if () */
   }];
   
   return;
}
