//
//  PHAuthorizationController+Notification.h
//  UISETTING
//
//  Created by Harry on 2022/6/20.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "PHAuthorizationController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PHAuthorizationController (Notification)

#if __Debug__
@notification(self);
#endif /* __Debug__ */

@notification(allowAccess);

@end

NS_ASSUME_NONNULL_END
