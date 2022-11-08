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
#import "PingController+Action.h"
#import "PingController+Signal.h"
#import "PingController+Notification.h"
#import "PingController+Theme.h"
#import "PingController+Debug.h"

@implementation PingController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@def_signal(startPing);

@end

#pragma mark - handleSignal
@implementation PingController (handleSignal)

#if __Debug__
handleSignal(PingController, selfSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[PingController selfSignal:] : Signal : %@", aSignal));

   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

handleSignal(PingController, startPingSignal) {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [self resignFirstResponder];
   
   LogDebug((@"-[PingController startPingSignal:] : Signal : %@", aSignal));
   
   // 按钮状态变更。
   if (nil == self.pingClient) {

      [self.textField setEnabled:NO];
      
      [self.pingResults removeAllObjects];
      
      [self.sections removeAllObjects];

      [UIView transitionWithView:self.navigationBarX
                        duration:[UIView animationDefaultDuration]
                         options:UIViewAnimationOptionTransitionCrossDissolve
                      animations:^{

         [self.rightBarButton setImage:[ImageProvider imageNamed:@"UIButtonBarStop"]
                              forState:UIControlStateNormal];
   //      [self.rightBarButton setImage:[[ImageProvider imageNamed:@"UIButtonBarStop"] imageRenderWithTintColor:UIColor.systemGrayColor]
   //                           forState:UIControlStateSelected];
   //      [self.rightBarButton setImage:[[ImageProvider imageNamed:@"UIButtonBarStop"] imageRenderWithTintColor:UIColor.systemGrayColor]
   //                           forState:UIControlStateHighlighted];
         
         [self.rightBarButton setTintColorPicker:DKColorPickerWithKey([IDEAColor systemRed])];

         [self.tableView reloadData];
      }
                      completion:nil];
            
//      [UIView transitionWithView:self.tableView
//                        duration:[UIView animationDefaultDuration]
//                         options:UIViewAnimationOptionTransitionCrossDissolve
//                      animations:^{
//
//      }
//                      completion:nil];

      @weakify(self);
      self.pingClient   = [IDEAPingClient pingClientWithHostName:self.textField.text
                                                            ping:^(NSString * _Nonnull aHostName, NSString * _Nullable aIP, NSTimeInterval aTime, NSError * _Nullable aError) {
         
         PingResult     *stPingResult        = nil;
         
         @strongify(self);
         
         LogDebug((@"-[PingController startPingSignal:] : ping : Error : %@", aError));
         LogDebug((@"-[PingController startPingSignal:] : ping : Time  : %.3f", aTime));
         LogDebug((@"-[PingController startPingSignal:] : ping : HOST  : %@", aHostName));
         LogDebug((@"-[PingController startPingSignal:] : ping : IP    : %@", aIP));
         
         if (nil != aError) {
            
            stPingResult  = [PingResult pingResultWithHostName:aHostName ip:aIP error:aError duration:aTime];
                        
         } /* End if () */
         else {

            stPingResult  = [PingResult pingResultWithHostName:aHostName ip:aIP error:aError duration:aTime];

         } /* End else */
         
         if (nil != stPingResult) {
            
            [self.pingResults addObject:stPingResult];

            DISPATCH_ASYNC_ON_MAIN_QUEUE(^{

               [UIView transitionWithView:self.tableView
                                 duration:[UIView animationDefaultDuration]
                                  options:UIViewAnimationOptionTransitionCrossDissolve
                               animations:^{

                  [self.tableView reloadData];
               }
                               completion:^(BOOL finished) {
               }];
               
               return;
            });

         } /* End if () */
      }
                                                       completed:^(NSString * _Nonnull aHostName, NSString * _Nonnull aIP) {
         
         LogDebug((@"-[PingController startPingSignal:] : completed : HostName : %@", aHostName));
         LogDebug((@"-[PingController startPingSignal:] : completed : IP : %@", aIP));
         LogDebug((@"-[PingController startPingSignal:] : self.pingResults : %d", self.pingResults.count));

         DISPATCH_ASYNC_ON_MAIN_QUEUE(^{
            
            [UIView transitionWithView:self.tableView
                              duration:[UIView animationDefaultDuration]
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:^{

               [self.rightBarButton setImage:[ImageProvider imageNamed:@"UIButtonBarPlay"]
                                    forState:UIControlStateNormal];
   //            [self.rightBarButton setImage:[[ImageProvider imageNamed:@"UIButtonBarPlay"] imageRenderWithTintColor:UIColor.systemGrayColor]
   //                                 forState:UIControlStateSelected];
   //            [self.rightBarButton setImage:[[ImageProvider imageNamed:@"UIButtonBarPlay"] imageRenderWithTintColor:UIColor.systemGrayColor]
   //                                 forState:UIControlStateHighlighted];
               [self.rightBarButton setTintColorPicker:DKColorPickerWithKey([IDEAColor systemGreen])];
               
            }
                            completion:^(BOOL finished) {

               [self.textField setEnabled:YES];
            }];

            if (0 < self.pingResults.count) {
               
               [self.sections insertObject:@(PingSectionStatistics)
                                   atIndex:PingSectionStatistics];

               [UIView transitionWithView:self.tableView
                                 duration:[UIView animationDefaultDuration]
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
         
         [UIView transitionWithView:self.navigationBarX
                           duration:[UIView animationDefaultDuration]
                            options:UIViewAnimationOptionTransitionCrossDissolve
                         animations:^{

            [self.rightBarButton setImage:[ImageProvider imageNamed:@"UIButtonBarPlay"]
                                 forState:UIControlStateNormal];
   //         [self.rightBarButton setImage:[[ImageProvider imageNamed:@"UIButtonBarPlay"] imageRenderWithTintColor:UIColor.systemGrayColor]
   //                              forState:UIControlStateSelected];
   //         [self.rightBarButton setImage:[[ImageProvider imageNamed:@"UIButtonBarPlay"] imageRenderWithTintColor:UIColor.systemGrayColor]
   //                              forState:UIControlStateHighlighted];
            [self.rightBarButton setTintColorPicker:DKColorPickerWithKey([IDEAColor systemGreen])];
         }
                         completion:^(BOOL finished) {

            [self.textField setEnabled:YES];
         }];
         
      } /* End else */
            
   } /* End else */
   
   __CATCH(nErr);
   
   return;
}

@end
