//
//  PingController+Inner.m
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

#pragma mark - handleSignal
@implementation PingController (Inner)

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
      
      @weakify(self);
      self.pingClient   = [IDEAPingClient pingWithHostName:self.textField.text
                                                    result:^(NSTimeInterval aTime, NSError * _Nonnull aError) {
         
         @strongify(self);
         LogDebug((@"-[PingController startPingSignal:] : ping : Error : %@", aError));
         LogDebug((@"-[PingController startPingSignal:] : ping : Time  : %.3f", aTime));
         
         PingResult  *stPingResult  = [PingResult pingResultWithError:aError duration:aTime];
         
         [self.pingResults addObject:stPingResult];
         
//         dispatch_async_on_main_queue(^{
//            
//            [CATransaction begin];
//            
//            [self.tableView insertRow:self.pingResults.count - 1
//                            inSection:PingSectionTime
//                     withRowAnimation:UITableViewRowAnimationFade];
//            
//            [CATransaction commit];
//            
//            [CATransaction setCompletionBlock:^{
//               [self.tableView scrollToRow:self.pingResults.count - 1
//                                 inSection:PingSectionTime
//                          atScrollPosition:UITableViewScrollPositionBottom
//                                  animated:YES];
//            }];
//            
////            [UIView transitionWithView:self.tableView
////                              duration:0.1
////                               options:UIViewAnimationOptionTransitionCrossDissolve
////                            animations:^{
////
////               [self.tableView reloadData];
////            }
////                            completion:^(BOOL finished) {
////
////               [self.tableView scrollToRow:self.pingResults.count - 1
////                                 inSection:PingSectionTime
////                          atScrollPosition:UITableViewScrollPositionBottom
////                                  animated:YES];
////            }];
//         });
      }];

   } /* End if () */
   else {
      
      [self.rightBarButtonItem setImage:[UIImage imageNamed:@"UIButtonBarPlay"]];
      [self.rightBarButtonItem setTintColorPicker:DKColorPickerWithKey([IDEAColor systemGreen])];

      [self.textField setEnabled:YES];

      if (nil != self.pingClient) {
         
         [self.pingClient stopPing];
         __RELEASE(self.pingClient);

      } /* End if () */

   } /* End else */

   __CATCH(nErr);
   
   return;
}

@end

#pragma mark - <UISearchBarDelegate>
@implementation PingController (UISearchBarDelegate)

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)aSearchBar {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)aSearchBar {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[PingController searchBarTextDidBeginEditing:] : SearchText : %@", aSearchBar.text));

   if (!kStringIsEmpty(aSearchBar.text)) {
      
      [self.rightBarButtonItem setEnabled:YES];
      
   } /* End if () */
   else {
      
      [self.rightBarButtonItem setEnabled:NO];
      
   } /* End else */

   __CATCH(nErr);
   
   return;
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)aSearchBar {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)aSearchBar {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

- (void)searchBar:(UISearchBar *)aSearchBar textDidChange:(NSString *)aSearchText {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[PingController searchBar:textDidChange:] : SearchText : %@", aSearchBar));
   
   if (!kStringIsEmpty(aSearchText)) {
      
      [self.rightBarButtonItem setEnabled:YES];
      
   } /* End if () */
   else {
      
      [self.rightBarButtonItem setEnabled:NO];
      
   } /* End else */
   
   __CATCH(nErr);
   
   return;
}

- (BOOL)searchBar:(UISearchBar *)aSearchBar shouldChangeTextInRange:(NSRange)aRange replacementText:(NSString *)aText {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)aSearchBar {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

- (void)searchBarBookmarkButtonClicked:(UISearchBar *)aSearchBar {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)aSearchBar {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

- (void)searchBarResultsListButtonClicked:(UISearchBar *)aSearchBar {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

@end

#pragma mark - <UITextFieldDelegate>
@implementation PingController (UITextFieldDelegate)

- (BOOL)textFieldShouldBeginEditing:(UITextField *)aTextField {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)aTextField {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[PingController textFieldDidBeginEditing:] : Text : %@", aTextField.text));

   if (!kStringIsEmpty(aTextField.text)) {
      
      [self.rightBarButtonItem setEnabled:YES];
      
   } /* End if () */
   else {
      
      [self.rightBarButtonItem setEnabled:NO];
      
   } /* End else */

   __CATCH(nErr);
   
   return;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)aTextField {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)aTextField {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

- (void)textFieldDidEndEditing:(UITextField *)aTextField reason:(UITextFieldDidEndEditingReason)aReason {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

- (BOOL)textField:(UITextField *)aTextField shouldChangeCharactersInRange:(NSRange)aRange replacementString:(NSString *)aString {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return YES;
}

- (void)textFieldDidChangeSelection:(UITextField *)aTextField {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

- (BOOL)textFieldShouldClear:(UITextField *)aTextField {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)aTextField {
   
   int                            nErr                                     = EFAULT;
   
   BOOL                           bShouldReturn                            = NO;
   
   __TRY;
   
   if (!kStringIsEmpty(aTextField.text)) {
      
      bShouldReturn  = YES;
      
      [self postSignal:PingController.startPingSignal
               onQueue:dispatch_get_main_queue()];

   } /* End if () */
   else {
      
      bShouldReturn  = NO;
      
   } /* End else */

   __CATCH(nErr);
   
   return bShouldReturn;
}

- (void)textFieldTextDidChange:(NSNotification *)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[PingController textFieldTextDidChange:] : Text : %@", self.textField.text));
   
   if (!kStringIsEmpty(self.textField.text)) {
      
      [self.rightBarButtonItem setEnabled:YES];
      
   } /* End if () */
   else {
      
      [self.rightBarButtonItem setEnabled:NO];
      
   } /* End else */
   
   __CATCH(nErr);
   
   return;
}

@end
