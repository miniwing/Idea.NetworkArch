//
//  WhoisController+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "WhoisController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WhoisController ()

@property (nonatomic, strong)                MDCAppBar                           * appBar;

/**
 The text field of search bar
 */
@property (nonatomic, weak)                  UITextField                         * searchBarTextField;

@end

@interface WhoisController (Inner)

+ (NSString *)whoisURL;
+ (NSString *)whoisURLWithKey:(NSString *)aKey;

@end

NS_ASSUME_NONNULL_END
