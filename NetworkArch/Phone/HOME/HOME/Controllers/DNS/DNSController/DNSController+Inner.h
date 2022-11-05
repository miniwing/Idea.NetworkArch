//
//  DNSController+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "DNSController.h"

#import "DNSContentController+Inner.h"
#import "DNSContentController+Signal.h"
#import "DNSContentController+Notification.h"

#import "DNSManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface DNSController () <UITextFieldDelegate> {

   dispatch_once_t                          _firstResponder;
}

@end

@interface DNSController ()

@property (nonatomic, weak)   IBOutlet       UINavigationBarX                    * navigationBarX;
@property (nonatomic, strong) IBOutlet       UIBarButtonItem                     * leftBarButtonItem;
@property (nonatomic, strong) IBOutlet       UIButton                            * leftBarButton;

@property (nonatomic, strong) IBOutlet       UIBarButtonItem                     * rightBarButtonItem;
@property (nonatomic, strong) IBOutlet       UIButton                            * rightBarButton;

@property (nonatomic, weak)   IBOutlet       UIView                              * inputView;
@property (nonatomic, weak)   IBOutlet       UITextFieldX                        * textField;

@property (nonatomic, weak)   IBOutlet       MDCActivityIndicator                * activityIndicator;

@property (nonatomic, weak)   IBOutlet       UIView                              * contentView;

@end

@interface DNSController ()

/**
 The text field of search bar
 */
// @property (nonatomic, weak)                  UITextField                         * searchBarTextField;

@property (nonatomic, strong)                DNSContentController                * contentController;

@end

@interface DNSController (Inner)

@end

@interface DNSController (UITextFieldDelegate)

- (BOOL)textFieldShouldBeginEditing:(UITextField *)aTextField;
- (void)textFieldDidBeginEditing:(UITextField *)aTextField;
- (BOOL)textFieldShouldEndEditing:(UITextField *)aTextField;
- (void)textFieldDidEndEditing:(UITextField *)aTextField;
- (void)textFieldDidEndEditing:(UITextField *)aTextField reason:(UITextFieldDidEndEditingReason)aReason;

- (BOOL)textField:(UITextField *)aTextField shouldChangeCharactersInRange:(NSRange)aRange replacementString:(NSString *)aString;

- (void)textFieldDidChangeSelection:(UITextField *)aTextField API_AVAILABLE(ios(13.0), tvos(13.0));

- (BOOL)textFieldShouldClear:(UITextField *)aTextField;               // called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)textFieldShouldReturn:(UITextField *)aTextField;              // called when 'return' key pressed. return NO to ignore.

- (void)textFieldTextDidChange:(NSNotification *)aSender;

@end

NS_ASSUME_NONNULL_END
