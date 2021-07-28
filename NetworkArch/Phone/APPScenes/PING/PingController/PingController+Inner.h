//
//  PingController+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "PingController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PingController () <UISearchBarDelegate> {

   dispatch_once_t                          _firstResponder;
}

@end

@interface PingController ()

@property (nonatomic, strong)                MDCAppBar                           * appBar;

/**
 The text field of search bar
 */
@property (nonatomic, weak)                  UITextField                         * searchBarTextField;

@end

@interface PingController ()

@property (nonatomic, assign)                BOOL                                  pinging;

@end

@interface PingController (Inner)

@end

@interface PingController (UISearchBarDelegate)

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar;                      // return NO to not become first responder
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar;                     // called when text starts editing
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar;                        // return NO to not resign first responder
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar;                       // called when text ends editing
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;   // called when text changes (including clear)
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text API_AVAILABLE(ios(3.0)); // called before text changes

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;                     // called when keyboard search button pressed
- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar API_UNAVAILABLE(tvos); // called when bookmark button pressed
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar API_UNAVAILABLE(tvos);   // called when cancel button pressed
- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar API_AVAILABLE(ios(3.2)) API_UNAVAILABLE(tvos); // called when search results button pressed

- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope API_AVAILABLE(ios(3.0));

@end

@interface PingController (UITextFieldDelegate)

- (void)textFieldTextDidChange:(NSNotification *)aSender;

@end

NS_ASSUME_NONNULL_END
