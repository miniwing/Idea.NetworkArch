//
//  DNSController+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "DNSController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DNSController () <UISearchBarDelegate>

@property (nonatomic, strong)                MDCAppBar                           * appBar;

/**
 The text field of search bar
 */
@property (nonatomic, weak)                  UITextField                         * searchBarTextField;

@end

@interface DNSController (Inner)

@end

NS_ASSUME_NONNULL_END
