//
//  PortScanController+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <ADs/AD.h>
#import <ADs/AppOpenAdManager.h>

#import "PortScanController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PortScanController () <UITextFieldDelegate>

@property (nonatomic, weak)   IBOutlet       UINavigationBarX                    * navigationBarX;

@property (nonatomic, strong) IBOutlet       UIBarButtonItem                     * leftBarButtonItem;
@property (nonatomic, strong) IBOutlet       UIButton                            * leftBarButton;

@property (nonatomic, strong) IBOutlet       UIBarButtonItem                     * rightBarButtonItem;
@property (nonatomic, strong) IBOutlet       UIButton                            * rightBarButton;

@property (nonatomic, weak)   IBOutlet       UIView                              * inputView;
@property (nonatomic, weak)   IBOutlet       UITextFieldX                        * textField;
@property (nonatomic, weak)   IBOutlet       UILabel                             * portLabel;

@property (nonatomic, weak)   IBOutlet       UITextFieldX                        * fromPortTextField;
@property (nonatomic, weak)   IBOutlet       UILabel                             * portAndLabel;
@property (nonatomic, weak)   IBOutlet       UITextFieldX                        * toPortTextField;

@property (nonatomic, weak)   IBOutlet       UIView                              * portView;
@property (nonatomic, weak)   IBOutlet       UILabel                             * portScanLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * portScaningLabel;

@property (nonatomic, weak)   IBOutlet       UITextView                          * textView;

@end

@interface PortScanController ()

@property (nonatomic, weak)   IBOutlet       UIView                              * bannerView;
@property (nonatomic, weak)   IBOutlet       NSLayoutConstraint                  * bannerViewWidth;
@property (nonatomic, weak)   IBOutlet       NSLayoutConstraint                  * bannerViewHeight;
@property (nonatomic, weak)   IBOutlet       GADBannerView                       * gadBannerView;

@end

@interface PortScanController ()

@property (nonatomic, strong)                NSMutableString                     * portScanRes;

@end

@interface PortScanController (Inner)

@end

@interface PortScanController (UITextFieldDelegate)

- (BOOL)textFieldShouldBeginEditing:(UITextField *)aTextField;
- (void)textFieldDidBeginEditing:(UITextField *)aTextField;
- (BOOL)textFieldShouldEndEditing:(UITextField *)aTextField;
- (void)textFieldDidEndEditing:(UITextField *)aTextField;
- (void)textFieldDidEndEditing:(UITextField *)aTextField reason:(UITextFieldDidEndEditingReason)aReason;

- (BOOL)textField:(UITextField *)aTextField shouldChangeCharactersInRange:(NSRange)aRange replacementString:(NSString *)aString;

- (void)textFieldDidChangeSelection:(UITextField *)aTextField API_AVAILABLE(ios(13.0), tvos(13.0));

- (BOOL)textFieldShouldClear:(UITextField *)aTextField;               // called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)textFieldShouldReturn:(UITextField *)aTextField;              // called when 'return' key pressed. return NO to ignore.

@end

NS_ASSUME_NONNULL_END
