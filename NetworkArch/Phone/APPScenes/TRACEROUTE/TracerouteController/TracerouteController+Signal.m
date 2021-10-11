//
//  TracerouteController+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "TracerouteController+Inner.h"
#import "TracerouteController+Signal.h"
#import "TracerouteController+Notification.h"

@implementation TracerouteController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@def_signal(startScan);

@end

#pragma mark - handleSignal
@implementation TracerouteController (handleSignal)

handleSignal(TracerouteController, startScanSignal) {
   
   int                            nErr                                     = EFAULT;
   
   __block BOOL                   bAddBeginDes                             = NO;
   
   __TRY;
   
   [self resignFirstResponder];
   
   LogDebug((@"-[TracerouteController startScanSignal:] : Signal : %@", aSignal));
   
   // 按钮状态变更。
   if (self.icmpSwitch.isOn) {
      
      [[PhoneNetManager shareInstance] netStartTraceroute:aSignal.object
                                  tracerouteResultHandler:^(NSString * _Nullable aTracert, NSString * _Nullable aDestIp) {
         
         LogDebug((@"-[TracerouteController startScanSignal:] : Tracert : %@", aTracert));
         LogDebug((@"-[TracerouteController startScanSignal:] : DestIp  : %@", aDestIp));

         if (!bAddBeginDes) {

            bAddBeginDes = YES;
         }
                  
      }];

   } /* End if () */
   else {
      
      self.udpTraceroute = [PNUdpTraceroute start:aSignal.object complete:^(NSMutableString *aTracert) {

         LogDebug((@"-[TracerouteController startScanSignal:] : Tracert : %@", aTracert));

      }];

   } /* End else */
   
   __CATCH(nErr);
   
   return;
}

@end
