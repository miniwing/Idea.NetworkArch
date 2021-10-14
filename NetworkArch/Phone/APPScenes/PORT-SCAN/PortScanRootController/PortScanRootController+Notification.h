//
//  PortScanRootController+Notification.h
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "PortScanRootController.h"

#import <IDEAUIVendor/IDEAUIVendor.h>

NS_ASSUME_NONNULL_BEGIN

@interface PortScanRootController (Notification)

#if __Debug__
@notification(self);
#endif /* __Debug__ */

@end

NS_ASSUME_NONNULL_END
