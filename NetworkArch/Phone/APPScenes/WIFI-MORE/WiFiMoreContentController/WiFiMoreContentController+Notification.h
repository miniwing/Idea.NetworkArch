//
//  WiFiMoreContentController+Notification.h
//  NetworkArch
//
//  Created by Harry on 2021/8/1.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "WiFiMoreContentController.h"

#import <IDEAUIVendor/IDEAUIVendor.h>

NS_ASSUME_NONNULL_BEGIN

@interface WiFiMoreContentController (Notification)

#if __Debug__
@notification(self);
#endif /* __Debug__ */

@end

NS_ASSUME_NONNULL_END
