//
//  WoLANController+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "WoLANController.h"

#import "WoLANContentController.h"
#import "WoLANContentController+Inner.h"
#import "WoLANContentController+Notification.h"

NS_ASSUME_NONNULL_BEGIN

@interface WoLANController ()

@property (nonatomic, strong)                MDCAppBar                           * appBar;

@property (nonatomic, strong)                WoLANContentController              * contentController;

@end

@interface WoLANController (Inner)

@end

NS_ASSUME_NONNULL_END
