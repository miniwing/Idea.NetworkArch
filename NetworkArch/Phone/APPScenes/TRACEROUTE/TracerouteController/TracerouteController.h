//
//  TracerouteController.h
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

@interface TracerouteController : IDEAViewController

@property (nonatomic, weak)   IBOutlet       UIBarButtonItem                     * leftBarButtonItem;
@property (nonatomic, weak)   IBOutlet       UIBarButtonItem                     * rightBarButtonItem;
@property (nonatomic, weak)   IBOutlet       UISwitch                            * icmpSwitch;

@property (nonatomic, weak)   IBOutlet       UIView                              * inputView;
@property (nonatomic, weak)   IBOutlet       APPTextField                        * textField;
@property (nonatomic, weak)   IBOutlet       UILabel                             * icmpLabel;

@property (nonatomic, weak)   IBOutlet       UITextView                          * textView;

@end

@interface TracerouteController ()

@end

NS_ASSUME_NONNULL_END
