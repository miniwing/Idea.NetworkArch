//
//  HomeSettingController+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/8/15.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "HomeSettingRootController.h"
#import "HomeSettingRootController+Inner.h"
#import "HomeSettingRootController+Signal.h"
#import "HomeSettingRootController+Notification.h"

#import "HomeSettingController+Inner.h"
#import "HomeSettingController+Action.h"
#import "HomeSettingController+Signal.h"
#import "HomeSettingController+Notification.h"
#import "HomeSettingController+Theme.h"
#import "HomeSettingController+Debug.h"

@implementation HomeSettingController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@end

#pragma mark - handleSignal
@implementation HomeSettingController (handleSignal)

//handleSignal(HomeSettingContentController, saveSignal) {
//   
//   int                            nErr                                     = EFAULT;
//   
//   __TRY;
//   
//   LogDebug((@"-[HomeSettingController saveSignal:] : Signal : %@", aSignal));
//   LogDebug((@"-[HomeSettingController saveSignal:] : API KEY : %@", aSignal.object));
//   
//   [self resignFirstResponder];
//   
//   if ([self.navigationController isKindOfClass:HomeSettingRootController.class] || [self.rt_navigationController isKindOfClass:HomeSettingRootController.class]) {
//      
//      [self dismissViewControllerAnimated:YES
//                               completion:nil];
//      
//   } /* End if () */
//   else {
//      
//      [self.navigationController popViewControllerAnimated:YES
//                                                completion:nil];
//      
//   } /* End else */
//      
//   __CATCH(nErr);
//   
//   return;
//}

//handleSignal(HomeSettingContentController, addLinkSignal) {
//   
//   int                            nErr                                     = EFAULT;
//   
//   __TRY;
//   
//   LogDebug((@"-[HomeSettingController addLinkSignal:] : Signal : %@", aSignal));
//   LogDebug((@"-[HomeSettingController addLinkSignal:] : API KEY : %@", aSignal.object));
//   
//   [CATransaction begin];
//   
//   [CATransaction setCompletionBlock:^{
//      
//      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://main.whoisxmlapi.com"]
//                                         options:nil
//                               completionHandler:^(BOOL success) {
//         
//      }];
//   }];
//   
//   [self resignFirstResponder];
//   
//   [CATransaction commit];
//
//   __CATCH(nErr);
//   
//   return;
//}

@end
