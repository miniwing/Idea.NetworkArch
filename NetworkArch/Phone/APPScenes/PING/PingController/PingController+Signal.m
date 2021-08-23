//
//  PingController+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "PingController+Inner.h"
#import "PingController+Signal.h"

@implementation PingController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@def_signal(startPing);

@end

#pragma mark - handleSignal
@implementation PingController (handleSignal)

handleSignal(PingController, startPingSignal) {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [self resignFirstResponder];
   
   LogDebug((@"-[PingController startPingSignal:] : Signal : %@", aSignal));
   
   // 按钮状态变更。
   if (nil == self.pingClient) {
      
      [self.rightBarButtonItem setImage:[UIImage imageNamed:@"UIButtonBarStop"]];
      [self.rightBarButtonItem setTintColorPicker:DKColorPickerWithKey([IDEAColor systemRed])];
            
      [self.textField setEnabled:NO];
      
      [self.pingResults removeAllObjects];
      
      [self.sections removeAllObjects];

      [UIView transitionWithView:self.tableView
                        duration:UIAViewAnimationDefaultDuraton
                         options:UIViewAnimationOptionTransitionCrossDissolve
                      animations:^{

         [self.tableView reloadData];
      }
                      completion:nil];

      @weakify(self);
      self.pingClient   = [IDEAPingClient pingClientWithHostName:self.textField.text
                                                            ping:^(NSString * _Nonnull aHostName, NSString * _Nullable aIP, NSTimeInterval aTime, NSError * _Nullable aError) {
         
         @strongify(self);
         LogDebug((@"-[PingController startPingSignal:] : ping : Error : %@", aError));
         LogDebug((@"-[PingController startPingSignal:] : ping : Time  : %.3f", aTime));
         LogDebug((@"-[PingController startPingSignal:] : ping : HOST  : %@", aHostName));
         LogDebug((@"-[PingController startPingSignal:] : ping : IP    : %@", aIP));
         
         if (nil != aError) {
            
            return;
            
         } /* End if () */
         
         PingResult  *stPingResult  = [PingResult pingResultWithHostName:aHostName ip:aIP error:aError duration:aTime];
         
         if (nil != stPingResult) {
            
            [self.pingResults addObject:stPingResult];

            dispatch_async_on_main_queue(^{
               
//            [CATransaction begin];
//
//            [self.tableView insertRow:self.pingResults.count - 1
//                            inSection:self.sections.count - 1
//                     withRowAnimation:UITableViewRowAnimationFade];
//
//            [CATransaction commit];
//
//            [CATransaction setCompletionBlock:^{
//               [self.tableView scrollToRow:self.pingResults.count - 1
//                                 inSection:self.sections.count - 1
//                          atScrollPosition:UITableViewScrollPositionBottom
//                                  animated:YES];
//            }];
               
               [UIView transitionWithView:self.tableView
                                 duration:0.1
                                  options:UIViewAnimationOptionTransitionCrossDissolve
                               animations:^{

                  [self.tableView reloadData];
               }
                               completion:^(BOOL finished) {

//               [self.tableView scrollToRow:self.pingResults.count - 1
//                                 inSection:self.sections.count - 1 // PingSectionPing
//                          atScrollPosition:UITableViewScrollPositionBottom
//                                  animated:YES];
               }];
            });

         } /* End if () */
      }
                                                       completed:^(NSString * _Nonnull aHostName, NSString * _Nonnull aIP) {
         
         LogDebug((@"-[PingController startPingSignal:] : completed : HostName : %@", aHostName));
         LogDebug((@"-[PingController startPingSignal:] : completed : IP : %@", aIP));

         dispatch_async_on_main_queue(^{
            
            [self.rightBarButtonItem setImage:[UIImage imageNamed:@"UIButtonBarPlay"]];
            [self.rightBarButtonItem setTintColorPicker:DKColorPickerWithKey([IDEAColor systemGreen])];
            
            [self.textField setEnabled:YES];

            if (0 < self.pingResults.count) {
               
               [self.sections insertObject:@(PingSectionStatistics)
                                   atIndex:PingSectionStatistics];

               [UIView transitionWithView:self.tableView
                                 duration:UIAViewAnimationDefaultDuraton
                                  options:UIViewAnimationOptionTransitionCrossDissolve
                               animations:^{

                  [self.tableView reloadData];
               }
                               completion:^(BOOL finished) {

                  [self.tableView scrollToRow:0
                                    inSection:PingSectionStatistics
                             atScrollPosition:UITableViewScrollPositionTop
                                     animated:YES];
               }];

            } /* End if () */
            else {
               
               [self.sections removeAllObjects];
               
            } /* End else */
            
            __RELEASE(self.pingClient);

         });
      }];

      [self.sections addObject:@(PingSectionPing)];

   } /* End if () */
   else {
            
      if (nil != self.pingClient) {
         
         [self.pingClient stopPing];
         __RELEASE(self.pingClient);
         
      } /* End if () */
      else {
         
         [self.rightBarButtonItem setImage:[UIImage imageNamed:@"UIButtonBarPlay"]];
         [self.rightBarButtonItem setTintColorPicker:DKColorPickerWithKey([IDEAColor systemGreen])];
         
         [self.textField setEnabled:YES];

      } /* End else */
            
   } /* End else */
   
   __CATCH(nErr);
   
   return;
}

@end
