//
//  PingController+Notification.h
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "PingController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PingController (Notification)

#if __Debug__
@notification(self);
#endif /* __Debug__ */

- (void)textFieldTextDidChange:(NSNotification *)aSender;

@end

NS_ASSUME_NONNULL_END
