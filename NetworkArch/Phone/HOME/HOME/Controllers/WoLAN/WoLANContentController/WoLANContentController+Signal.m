//
//  WoLANContentController+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/8/13.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WoLANContentController+Inner.h"
#import "WoLANContentController+Action.h"
#import "WoLANContentController+Signal.h"
#import "WoLANContentController+Notification.h"
#import "WoLANContentController+Theme.h"
#import "WoLANContentController+Debug.h"

#import "WoLANContentController+AD.h"

@implementation WoLANContentController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@def_signal(start);

@def_signal(loadAD);

@end

#pragma mark - handleSignal
@implementation WoLANContentController (handleSignal)

handleSignal(WoLANContentController, startSignal) {
   
   int                            nErr                                     = EFAULT;
   
   WakeError                      eErr                                     = SocketNoError;
   WoLANDevice                   *stWoLANDevice                            = nil;
   UInt16                         nPort                                    = 0;
   WoLANPacket                   *stWoLANPacket                            = nil;
   
   __TRY;
   
   LogDebug((@"-[WoLANContentController startSignal:] : Signal : %@", aSignal));
   
   if (NO == kStringIsEmpty(self.port)) {
      
      nPort = self.port.shortValue;
      
   } /* End if () */
   
   stWoLANDevice  = [WoLANDevice deviceWithMac:self.mac
                                 broadcastAddr:self.broadcastAddr
                                          port:nPort];
   
   eErr  = [DeviceAwake targetWithDevice:stWoLANDevice];
   
   if (SocketNoError == eErr) {
      
      stWoLANPacket  = [WoLANPacket packetWithMac:self.mac sent:YES];
            
   } /* End if () */
   else {
      
      stWoLANPacket  = [WoLANPacket packetWithMac:self.mac sent:NO];
            
   } /* End else */
   
   [self.packets addObject:stWoLANPacket];
   
//   [self postSignal:WoLANContentController.doneSignal
//            onQueue:DISPATCH_GET_MAIN_QUEUE()];

   [self postNotify:WoLANContentController.doneNotification
            onQueue:DISPATCH_GET_MAIN_QUEUE()];
   
   __CATCH(nErr);
   
   return;
}

handleSignal(WoLANContentController, doneSignal) {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[WoLANContentController doneSignal:] : Signal : %@", aSignal));
   
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

handleSignal(WoLANContentController, loadADSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[WoLANContentController loadADSignal:] : Signal : %@", aSignal));

   [self loadAd];
   
   __CATCH(nErr);

   return;
}

@end
