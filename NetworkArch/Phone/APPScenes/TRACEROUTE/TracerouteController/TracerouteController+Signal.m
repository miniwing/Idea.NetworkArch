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
@def_signal(stopScan);

@end

#pragma mark - handleSignal
@implementation TracerouteController (handleSignal)

handleSignal(TracerouteController, startScanSignal) {
   
   int                            nErr                                     = EFAULT;
   
//   __block BOOL                   bAddBeginDes                             = NO;
   
   __TRY;
   
   [self resignFirstResponder];
   
   LogDebug((@"-[TracerouteController startScanSignal:] : Signal : %@", aSignal));
   
   [self.rightBarButtonItem setImage:[UIImage imageNamed:@"UIButtonBarStop"]];
//   [self.rightBarButtonItem setTintColorPicker:DKColorPickerWithKey([IDEAColor systemRed])];
         
   [self.textField setEnabled:NO];

   [self.icmpSwitch setEnabled:NO];

   self.traceDetails = nil;
   [self.textView setText:nil];
   
   // 按钮状态变更。
   if (self.icmpSwitch.isOn) {
      
      [[PhoneNetManager shareInstance] netStartTraceroute:aSignal.object
                                  tracerouteResultHandler:^(NSString * _Nullable aTracert, NSString * _Nullable aDestIp) {
         
         LogDebug((@"-[TracerouteController startScanSignal:] : ICMP : isDoing : %d", [[PhoneNetManager shareInstance] isDoingTraceroute]));
         LogDebug((@"-[TracerouteController startScanSignal:] : ICMP : Tracert : %@", aTracert));
         LogDebug((@"-[TracerouteController startScanSignal:] : ICMP : DestIp  : %@", aDestIp));
         
         if (nil == self.traceDetails) {
            
            self.traceDetails = [NSMutableString stringWithFormat:@"traceroute to %@ \n", aDestIp];
            
         } /* End if () */

         [self.traceDetails appendString:aTracert];
         [self.traceDetails appendString:@"\n"];
         
         dispatch_async_on_main_queue(^{
            
            [self.textView setText:self.traceDetails];
         });
      }
                                        completionHandler:^{
         
         LogDebug((@"-[TracerouteController startScanSignal:] : completionHandler"));

         [self postSignal:TracerouteController.stopScanSignal
                  onQueue:dispatch_get_main_queue()];
      }];

   } /* End if () */
   else {
      
      self.udpTraceroute = [PNUdpTraceroute start:aSignal.object
                                         complete:^(NSMutableString *aTracert) {

         LogDebug((@"-[TracerouteController startScanSignal:] : UDP : isDoing : %d", [self.udpTraceroute isDoingUdpTraceroute]));
         LogDebug((@"-[TracerouteController startScanSignal:] : UDP : Tracert : %@", aTracert));

         dispatch_async_on_main_queue(^{
            
            [self.textView setText:aTracert];
         });
         
         if ([aTracert hasSuffix:@"udp traceroute complete...\n"]) {
            
            [self postSignal:TracerouteController.stopScanSignal
                     onQueue:dispatch_get_main_queue()];
         } /* End if () */
      }];

   } /* End else */
   
   __CATCH(nErr);
   
   return;
}

handleSignal(TracerouteController, stopScanSignal) {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;
   
   [self resignFirstResponder];
   
   [self.rightBarButtonItem setImage:[UIImage imageNamed:@"UIButtonBarPlay"]];
//   [self.rightBarButtonItem setTintColorPicker:DKColorPickerWithKey([IDEAColor systemGreen])];

   [self.textField setEnabled:YES];

   [self.icmpSwitch setEnabled:YES];

   LogDebug((@"-[TracerouteController stopScanSignal:] : Signal : %@", aSignal));

   if (self.icmpSwitch.isOn) {

      [[PhoneNetManager shareInstance] netStopTraceroute];
   }
   else {
      
      [self.udpTraceroute stopUdpTraceroute];
      
   } /* End else */

   __CATCH(nErr);
   
   return;
}

@end
