//
//  LanScanController+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "LanScanController+Inner.h"
#import "LanScanController+Action.h"
#import "LanScanController+Signal.h"
#import "LanScanController+Notification.h"
#import "LanScanController+Theme.h"
#import "LanScanController+Debug.h"

#import "LanScanController+AD.h"

@implementation LanScanController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@def_signal(startScan);
@def_signal(stopScan);

@def_signal(loadAD);

@end

#pragma mark - handleSignal
@implementation LanScanController (handleSignal)

handleSignal(LanScanController, startScanSignal) {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [UIView transitionWithView:self.navigationBarX
                     duration:[UIView animationDefaultDuration]
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{

      [self.rightBarButton setImage:[ImageProvider imageNamed:@"UIButtonBarStop"]
                           forState:UIControlStateNormal];
      [self.rightBarButton setTintColorPicker:DKColorPickerWithKey([IDEAColor systemRed])];
   }
                   completion:^(BOOL finished) {

      [self.activeIPs removeAllObjects];

      [[PNetMLanScanner shareInstance] scan];
   }];

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

handleSignal(LanScanController, stopScanSignal) {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [UIView transitionWithView:self.navigationBarX
                     duration:[UIView animationDefaultDuration]
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{

      [self.rightBarButton setImage:[ImageProvider imageNamed:@"UIButtonBarPlay"]
                           forState:UIControlStateNormal];
      [self.rightBarButton setTintColorPicker:DKColorPickerWithKey([IDEAColor systemGreen])];
   }
                   completion:^(BOOL finished) {

      [[PNetMLanScanner shareInstance] stop];
   }];
   
   __CATCH(nErr);
   
   return;
}

handleSignal(LanScanController, loadADSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[LanScanController loadADSignal:] : Signal : %@", aSignal));

   [self loadAd];
   
   __CATCH(nErr);

   return;
}

@end
