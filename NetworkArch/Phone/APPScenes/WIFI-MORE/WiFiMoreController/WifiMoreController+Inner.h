//
//  WifiMoreController+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/7/19.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "WifiMoreController.h"
#import "WiFiMoreContentController+Inner.h"

NS_ASSUME_NONNULL_BEGIN

@interface WifiMoreController ()

@property (nonatomic, strong)                MDCAppBar                           * appBar;

@property (nonatomic, strong)                WiFiMoreContentController           * moreContentController;

@end

@interface WifiMoreController (Inner)

@end

NS_ASSUME_NONNULL_END
