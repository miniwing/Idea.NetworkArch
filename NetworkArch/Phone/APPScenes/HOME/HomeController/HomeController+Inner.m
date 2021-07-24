//
//  HomeController+Inner.m
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "HomeController+Inner.h"

#import "HomeContentController+Signal.h"

@implementation HomeController (Inner)

@end

#pragma mark - <CLLocationManagerDelegate>
@implementation HomeController (CLLocationManagerDelegate)

- (void)locationManager:(CLLocationManager *)aManager didChangeAuthorizationStatus:(CLAuthorizationStatus)aStatus {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
      
   [self postSignal:HomeContentController.loadWifiInfoSignal onQueue:dispatch_get_main_queue()];
//   [self postSignal:HomeContentController.loadCellularInfoSignal onQueue:dispatch_get_main_queue()];

   __CATCH(nErr);
   
   return;
}
@end

