//
//  PHAuthorizationRootController+Theme.m
//  UISETTING
//
//  Created by Harry on 2022/11/19.
//

#import "PHAuthorizationRootController+Theme.h"

@implementation PHAuthorizationRootController (Theme)

// Controls the application's preferred home indicator auto-hiding when this view controller is shown.
- (BOOL)prefersHomeIndicatorAutoHidden {

   LogView((@"-[%@ prefersHomeIndicatorAutoHidden]", [self class]));

   return YES;
}

- (UIModalPresentationStyle)modalPresentationStyle {
   
   LogView((@"-[%@ modalPresentationStyle]", [self class]));

//   if (@available(iOS 13, *)) {
//
//      return UIModalPresentationPageSheet;
//
//   } /* End if () */

   return UIModalPresentationCustom;
}

@end
