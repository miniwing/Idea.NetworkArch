//
//  TracerouteController+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "TracerouteController.h"

#import <IDEAUIVendor/IDEAUIVendor.h>

NS_ASSUME_NONNULL_BEGIN

@interface TracerouteController () <UITextFieldDelegate>

@property (nonatomic, strong)                MDCAppBar                           * appBar;

@end

@interface TracerouteController ()

@property (nonatomic, strong)                PNUdpTraceroute                     * udpTraceroute;
@property (nonatomic, strong)                NSMutableString                     * traceDetails;

@end

@interface TracerouteController (Inner)

@end

@interface TracerouteController (UITextFieldDelegate)

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
