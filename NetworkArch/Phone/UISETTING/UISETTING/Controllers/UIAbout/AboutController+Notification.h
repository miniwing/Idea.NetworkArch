//
//  AboutController+Notification.h
//  Pods
//
//  Created by Harry on 2022/11/26.
//
//  Mail: miniwing.hz@gmail.com
//

#import "AboutController.h"

NS_ASSUME_NONNULL_BEGIN

@interface AboutController (Notification)

#if __Debug__
@notification(self);
#endif /* __Debug__ */

@end

NS_ASSUME_NONNULL_END
