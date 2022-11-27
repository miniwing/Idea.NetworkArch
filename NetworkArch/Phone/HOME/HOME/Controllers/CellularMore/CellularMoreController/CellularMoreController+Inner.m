//
//  CellularMoreController+Inner.m
//  NetworkArch
//
//  Created by Harry on 2021/7/19.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "CellularMoreController+Inner.h"
#import "CellularMoreController+Action.h"
#import "CellularMoreController+Signal.h"
#import "CellularMoreController+Notification.h"
#import "CellularMoreController+Theme.h"
#import "CellularMoreController+Debug.h"

@implementation CellularMoreController (Inner)

@end

#pragma mark - UIStoryboard
@implementation CellularMoreController (UIStoryboard)

+ (NSString *)storyboard {
   
   return @"CELLULAR";
}

+ (NSString *)bundle {

   return @(BUNDLE);
}

@end

#pragma mark - IDEA_MAIN
IDEA_MAIN() {
   
   LogDebug((@"CellularMoreController::IDEA_MAIN"));
   
   [IDEAUIRouter registerURLPattern:@"CELLULAR/create"
                          toHandler:^(NSString *aURL, NSDictionary *aRouter, IDEAUIRouterCompletion aCompletion) {
      
      LogDebug((@"CellularMoreController::IDEA_MAIN : URL      : %@", aURL));
      LogDebug((@"CellularMoreController::IDEA_MAIN : Router   : %@", aRouter));
      
      UIViewController  *stViewController = [UIStoryboard loadStoryboard:CellularMoreController.storyboard
                                                          viewController:CellularMoreController.class
                                                                inBundle:CellularMoreController.bundle];
      
      if (nil != aCompletion) {
         
         aCompletion(aURL, nil, stViewController);
         
      } /* End if () */
   }];
   
   return;
}
