//
//  DNSController.h
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

@interface DNSController : IDEAViewController

@property (nonatomic, weak)   IBOutlet       UIBarButtonItem                     * leftBarButtonItem;
@property (nonatomic, weak)   IBOutlet       UIBarButtonItem                     * rightBarButtonItem;

@property (nonatomic, weak)   IBOutlet       UIView                              * inputView;
@property (nonatomic, weak)   IBOutlet       APPTextField                        * textField;

@property (nonatomic, weak)   IBOutlet       MDCActivityIndicator                * activityIndicator;

@property (nonatomic, weak)   IBOutlet       UIView                              * contentView;

@end

@interface DNSController ()

@end

NS_ASSUME_NONNULL_END
