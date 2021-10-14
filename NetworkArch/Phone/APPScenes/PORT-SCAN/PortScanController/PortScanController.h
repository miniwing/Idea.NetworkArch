//
//  PortScanController.h
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "APPTextField.h"

NS_ASSUME_NONNULL_BEGIN

@interface PortScanController : IDEAViewController

@property (nonatomic, weak)   IBOutlet       UIBarButtonItem                     * leftBarButtonItem;
@property (nonatomic, weak)   IBOutlet       UIBarButtonItem                     * rightBarButtonItem;

@property (nonatomic, weak)   IBOutlet       UIView                              * inputView;
@property (nonatomic, weak)   IBOutlet       APPTextField                        * textField;
@property (nonatomic, weak)   IBOutlet       UILabel                             * portLabel;

@property (nonatomic, weak)   IBOutlet       APPTextField                        * fromPortTextField;
@property (nonatomic, weak)   IBOutlet       UILabel                             * portAndLabel;
@property (nonatomic, weak)   IBOutlet       APPTextField                        * toPortTextField;

@property (nonatomic, weak)   IBOutlet       UIView                              * portView;
@property (nonatomic, weak)   IBOutlet       UILabel                             * portScanLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * portScaningLabel;

@property (nonatomic, weak)   IBOutlet       UITextView                          * textView;

@end

@interface PortScanController ()

@end

NS_ASSUME_NONNULL_END
