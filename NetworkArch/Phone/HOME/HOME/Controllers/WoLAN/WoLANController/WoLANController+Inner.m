//
//  WoLANController+Inner.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WoLANController+Inner.h"
#import "WoLANController+Action.h"
#import "WoLANController+Signal.h"
#import "WoLANController+Notification.h"
#import "WoLANController+Theme.h"
#import "WoLANController+Debug.h"

@implementation WoLANController (Inner)

@end

#pragma mark - UIStoryboard
@implementation WoLANController (UIStoryboard)

+ (NSString *)storyboard {
   
   return @"UTILITIES";
}

+ (NSString *)bundle {

   return @(BUNDLE);
}

@end

#pragma mark - IDEA_MAIN
IDEA_MAIN() {
   
   LogDebug((@"WoLANController::IDEA_MAIN"));
   
   [IDEAUIRouter registerURLPattern:@"WoLAN/create"
                          toHandler:^(NSString *aURL, NSDictionary *aRouter, IDEAUIRouterCompletion aCompletion) {
      
      LogDebug((@"WoLANController::IDEA_MAIN : URL      : %@", aURL));
      LogDebug((@"WoLANController::IDEA_MAIN : Router   : %@", aRouter));
      
      WoLANController   *stController  = [UIStoryboard loadStoryboard:WoLANController.storyboard
                                                       viewController:WoLANController.class
                                                             inBundle:WoLANController.bundle];
      
      if (nil != aCompletion) {
         
         aCompletion(aURL, nil, stController);
         
      } /* End if () */
   }];
   
   return;
}
