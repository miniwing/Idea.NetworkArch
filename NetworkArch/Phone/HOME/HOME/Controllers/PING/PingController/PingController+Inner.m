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
#import "PingController+Action.h"
#import "PingController+Signal.h"
#import "PingController+Notification.h"
#import "PingController+Theme.h"
#import "PingController+Debug.h"

#pragma mark - handleSignal
@implementation PingController (Inner)

@end

#pragma mark - UIStoryboard
@implementation PingController (UIStoryboard)

+ (NSString *)storyboard {
   
   return @"UTILITIES";
}

+ (NSString *)bundle {

   return @(BUNDLE);
}

@end

#pragma mark - UISearchBarDelegate
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
      
      [self.rightBarButton setEnabled:YES];
      
   } /* End if () */
   else {
      
      [self.rightBarButton setEnabled:NO];
      
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
      
      [self.rightBarButton setEnabled:YES];
      
   } /* End if () */
   else {
      
      [self.rightBarButton setEnabled:NO];
      
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

#pragma mark - UITextFieldDelegate
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
      
      [self.rightBarButton setEnabled:YES];
      
   } /* End if () */
   else {
      
      [self.rightBarButton setEnabled:NO];
      
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
               onQueue:DISPATCH_GET_MAIN_QUEUE()];

   } /* End if () */
   else {
      
      bShouldReturn  = NO;
      
   } /* End else */

   __CATCH(nErr);
   
   return bShouldReturn;
}

@end

#pragma mark - UITableViewDataSource
@implementation PingController (UITableViewDataSource)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
   
   return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)aSection {
   
   int                            nErr                                     = EFAULT;
   
   NSInteger                      nNumberOfRows                            = 0;
   NSNumber                      *stSection                                = nil;
   
   __TRY;
   
   stSection   = [self.sections objectAtIndex:aSection];
   
   if (PingSectionStatistics == stSection.integerValue) {
      
      nNumberOfRows  = PingStatisticsNumber;
      
   } /* End if () */
   else /* if (PingSectionStatistics == aSection) */ {
      
      nNumberOfRows  = self.pingResults.count;
      
   } /* End else */
   
   __CATCH(nErr);
   
   return nNumberOfRows;
}

- (nullable NSString *)tableView:(UITableView *)aTableView titleForHeaderInSection:(NSInteger)aSection {
   
   int                            nErr                                     = EFAULT;
   
   NSNumber                      *stSection                                = nil;
   
   NSString                      *szTitle                                  = nil;
   
   __TRY;
   
   stSection   = [self.sections objectAtIndex:aSection];
   
   if (PingSectionStatistics == stSection.integerValue) {
      
      szTitle  = __LOCALIZED_STRING(self.class, @"Statistics");
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return szTitle;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   NSNumber                      *stSection                                = nil;
   
   PingCell                      *stPingCell                               = nil;
   
   PingStatisticsCell            *stPingStatisticsCell                     = nil;
#if PING_STATISTICS_GRAPH
   PingGraphCell                 *stPingGraphCell                          = nil;
#endif /* PING_STATISTICS_GRAPH */
   
   PingResult                    *stPingResult                             = nil;
   PingResultCell                *stPingResultCell                         = nil;
   
   __TRY;
   
   stSection   = [self.sections objectAtIndex:aIndexPath.section];
   
   if (PingSectionStatistics == stSection.integerValue) {
      
      //      PingStatisticsMinmum    = 0,
      //      PingStatisticsAverage   = 1,
      //      PingStatisticsMaximum   = 2,
      //      PingStatisticsGraph     = 3
      //
      //      int sum = [[self.pingResults valueForKeyPath:@"@sum.intValue"] intValue];//求和
      //      int max = [[self.pingResults valueForKeyPath:@"@max.intValue"] intValue];//求最大值
      //      int min = [[self.pingResults valueForKeyPath:@"@min.intValue"] intValue];//求最小值
      //
      //      float avg = [[self.pingResults valueForKeyPath:@"@avg.floatValue"] floatValue];//求平均值
      
      if (PingStatisticsMinmum == aIndexPath.row) {
         
         stPingStatisticsCell = [aTableView dequeueReusableCellWithIdentifier:PingStatisticsCell.reuseIdentifier
                                                                 forIndexPath:aIndexPath];
         
         [stPingStatisticsCell setStatistics:PingStatisticsMinmum
                                       value:[[self.pingResults valueForKeyPath:@"@min.duration.doubleValue"] doubleValue]];
         
         stPingCell  = stPingStatisticsCell;
         
         [stPingCell.separatorView setHidden:NO];
         
         if (@available(iOS 13, *)) {
                        
         } /* End if () */
         else {
            
            [stPingCell setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight];

         } /* End else */
                  
      } /* End if () */
      else if (PingStatisticsAverage == aIndexPath.row) {
         
         stPingStatisticsCell = [aTableView dequeueReusableCellWithIdentifier:PingStatisticsCell.reuseIdentifier
                                                                 forIndexPath:aIndexPath];
         
         [stPingStatisticsCell setStatistics:PingStatisticsAverage
                                       value:[[self.pingResults valueForKeyPath:@"@avg.duration.doubleValue"] doubleValue]];
         
         stPingCell  = stPingStatisticsCell;
         
         if (@available(iOS 13, *)) {
                        
         } /* End if () */
         else {
            
            [stPingCell setRectCorner:0];

         } /* End else */

      } /* End else if () */
      else if (PingStatisticsMaximum == aIndexPath.row) {
         
         stPingStatisticsCell = [aTableView dequeueReusableCellWithIdentifier:PingStatisticsCell.reuseIdentifier
                                                                 forIndexPath:aIndexPath];
         
         [stPingStatisticsCell setStatistics:PingStatisticsMaximum
                                       value:[[self.pingResults valueForKeyPath:@"@max.duration.doubleValue"] doubleValue]];
         
         stPingCell  = stPingStatisticsCell;
         
         [stPingCell.separatorView setHidden:YES];
         
#if PING_STATISTICS_GRAPH
         if (@available(iOS 13, *)) {
                        
         } /* End if () */
         else {
            
            [stPingCell setRectCorner:0];

         } /* End else */
#else /* PING_STATISTICS_GRAPH */
         if (@available(iOS 13, *)) {
                        
         } /* End if () */
         else {
            
            [stPingCell setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight];

         } /* End else */
#endif /* !PING_STATISTICS_GRAPH */
         
      } /* End else if () */
#if PING_STATISTICS_GRAPH
      else /* if (PingStatisticsGraph == aIndexPath.row) */ {
         
         stPingGraphCell      = [aTableView dequeueReusableCellWithIdentifier:PingGraphCell.reuseIdentifier
                                                                 forIndexPath:aIndexPath];
         
         stPingCell           = stPingGraphCell;
         
         [stPingCell.separatorView setHidden:YES];
         
         if (@available(iOS 13, *)) {
                        
         } /* End if () */
         else {
            
            [stPingCell setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight];

         } /* End else */

      } /* End else if () */
      
#endif /* PING_STATISTICS_GRAPH */
      
   } /* End if () */
   else /* if (PingSectionPing == aIndexPath.section) */ {
      
      stPingResult      = [self.pingResults objectAtIndex:aIndexPath.row];
      
      stPingResultCell  = [aTableView dequeueReusableCellWithIdentifier:PingResultCell.reuseIdentifier
                                                           forIndexPath:aIndexPath];
      
      stPingCell        = stPingResultCell;
      
      [stPingResultCell setPingResult:stPingResult];
      
      if (1 == self.pingResults.count) {
         /**
          * 只有一个项目
          */
         
         if (@available(iOS 13, *)) {

         } /* End if () */
         else {

            [stPingCell setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight];

         } /* End else */

         [stPingCell.separatorView setHidden:YES];
         
      } /* End if () */
      else {

         if (0 == aIndexPath.row) {
            
            if (@available(iOS 13, *)) {
                           
            } /* End if () */
            else {
               
               [stPingCell setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight];

            } /* End else */

            [stPingCell.separatorView setHidden:NO];
            
         } /* End if () */
         else if (self.pingResults.count - 1 == aIndexPath.row) {
            
            if (@available(iOS 13, *)) {
                           
            } /* End if () */
            else {
               
               [stPingCell setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight];

            } /* End else */

            [stPingCell.separatorView setHidden:YES];
            
         } /* End else if () */
         else {
            
            if (@available(iOS 13, *)) {
                           
            } /* End if () */
            else {
               
               [stPingCell setRectCorner:UIRectCornerNone];

            } /* End else */

            [stPingCell.separatorView setHidden:NO];
            
         } /* End else */
         
      } /* End else */
      
   } /* End else */
      
   __CATCH(nErr);
   
   return stPingCell;
}

@end

#pragma mark - UITableViewDelegate
@implementation PingController (UITableViewDelegate)

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)aCell forRowAtIndexPath:(NSIndexPath *)aIndexPath {
//
//   int                            nErr                                     = EFAULT;
//
//   PingCell                      *stPingCell                               = (PingCell *)aCell;
//
//   __TRY;
//
//   if (PingSectionStatistics == aIndexPath.section) {
//
//      if (PingStatisticsMinmum == aIndexPath.row) {
//
//         [stPingCell.containerView setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];
//
//      } /* End if () */
//      else if (PingStatisticsAverage == aIndexPath.row) {
//
//      } /* End else if () */
//      else if (PingStatisticsMaximum == aIndexPath.row) {
//
//      } /* End else if () */
//      else /* if (PingStatisticsGraph == aIndexPath.row) */ {
//
//         [stPingCell.containerView setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];
//
//      } /* End else if () */
//
//   } /* End if () */
//   else /* if (PingSectionPing == aIndexPath.section) */ {
//
////      stPingResult      = [self.pingResults objectAtIndex:aIndexPath.row];
////
////      stPingResultCell  = [aTableView dequeueReusableCellWithIdentifier:PingResultCell.reuseIdentifier
////                                                           forIndexPath:aIndexPath];
////
////      [stPingResultCell setPingResult:stPingResult];
////
////      stPingCell  = stPingResultCell;
//
//   } /* End else */
//
//   __CATCH(nErr);
//
//   return;
//}

//- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)aCell forRowAtIndexPath:(NSIndexPath*)aIndexPath {
//
//   int                            nErr                                     = EFAULT;
//
//   PingCell                      *stPingCell                               = (PingCell *)aCell;
//
//   __TRY;
//
//   if (PingSectionStatistics == aIndexPath.section) {
//
//      if (PingStatisticsMinmum == aIndexPath.row) {
//
//         [stPingCell.containerView setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];
//
//      } /* End if () */
//      else if (PingStatisticsAverage == aIndexPath.row) {
//
//      } /* End else if () */
//      else if (PingStatisticsMaximum == aIndexPath.row) {
//
//      } /* End else if () */
//      else /* if (PingStatisticsGraph == aIndexPath.row) */ {
//
//         [stPingCell.containerView setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];
//
//      } /* End else if () */
//
//   } /* End if () */
//   else /* if (PingSectionPing == aIndexPath.section) */ {
//
////      stPingResult      = [self.pingResults objectAtIndex:aIndexPath.row];
////
////      stPingResultCell  = [aTableView dequeueReusableCellWithIdentifier:PingResultCell.reuseIdentifier
////                                                           forIndexPath:aIndexPath];
////
////      [stPingResultCell setPingResult:stPingResult];
////
////      stPingCell  = stPingResultCell;
//
//   } /* End else */
//
//   __CATCH(nErr);
//
//   return;
//}

@end

#pragma mark - IDEA_MAIN
IDEA_MAIN() {
   
   LogDebug((@"PingController::IDEA_MAIN"));
   
   [IDEAUIRouter registerURLPattern:@"PING/create"
                          toHandler:^(NSString *aURL, NSDictionary *aRouter, IDEAUIRouterCompletion aCompletion) {
      
      LogDebug((@"PingController::IDEA_MAIN : URL      : %@", aURL));
      LogDebug((@"PingController::IDEA_MAIN : Router   : %@", aRouter));
      
      PingController *stController  = [UIStoryboard loadStoryboard:PingController.storyboard
                                                    viewController:PingController.class
                                                          inBundle:PingController.bundle];
      
      if (nil != aCompletion) {
         
         aCompletion(aURL, nil, stController);
         
      } /* End if () */
   }];
   
   return;
}
