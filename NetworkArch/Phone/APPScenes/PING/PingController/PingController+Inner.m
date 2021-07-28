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

@implementation PingController (Inner)

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

- (void)textFieldTextDidChange:(NSNotification *)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

@end
