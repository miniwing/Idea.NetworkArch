//
//  WiFiMoreContentController+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/8/1.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WiFiMoreContentController+Inner.h"
#import "WiFiMoreContentController+Signal.h"

@implementation WiFiMoreContentController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@def_signal(loadExternalIPv4);

@end

#pragma mark - handleSignal
@implementation WiFiMoreContentController (HandleSignal)

handleSignal(APPDelegate, networkStatusSignal) {

   int                            nErr                                     = EFAULT;
      
   __TRY;

   LogDebug((@"-[WiFiMoreContentController handleSignal:networkStatusSignal:] : status : %@", aSignal.object));

   [self getExternalIPv4];
   
   [UIView transitionWithView:self.tableView
                     duration:[UIView animationDefaultDuration]
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      
      [self.tableView reloadData];
   }
                   completion:^(BOOL finished) {
      
   }];
   
   __CATCH(nErr);
   
   return;
}

handleSignal(WiFiMoreContentController, loadExternalIPv4Signal) {

   int                            nErr                                     = EFAULT;
      
   __TRY;

   LogDebug((@"-[WiFiMoreContentController handleSignal:loadExternalIPv4Signal:]"));

   [self getExternalIPv4];
      
   __CATCH(nErr);
   
   return;
}

@end
