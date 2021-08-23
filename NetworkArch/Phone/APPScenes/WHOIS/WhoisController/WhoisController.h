//
//  WhoisController.h
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "APPTextField.h"

NS_ASSUME_NONNULL_BEGIN

@interface WhoisController : IDEAViewController

@property (nonatomic, weak)   IBOutlet       UIBarButtonItem                     * leftBarButtonItem;
@property (nonatomic, weak)   IBOutlet       UIBarButtonItem                     * rightBarButtonItem;

@property (nonatomic, weak)   IBOutlet       UIView                              * inputView;
@property (nonatomic, weak)   IBOutlet       APPTextField                        * textField;

@property (nonatomic, weak)   IBOutlet       UITextView                          * textView;

@property (nonatomic, weak)   IBOutlet       MDCActivityIndicator                * activityIndicator;

@end

@interface WhoisController ()

@end

NS_ASSUME_NONNULL_END
