//
//  WifiScanController+Notification.h
//  NetworkArch
//
//  Created by Harry on 2021/9/11.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "WifiScanController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WifiScanController (Notification)

#if __Debug__
@notification(self);
#endif /* __Debug__ */

@end

NS_ASSUME_NONNULL_END
