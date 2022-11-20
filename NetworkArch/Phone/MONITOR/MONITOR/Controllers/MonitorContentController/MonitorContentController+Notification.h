//
//  MonitorContentController+Notification.h
//  MONITOR
//
//  Created by Harry on 2022/11/20.
//
//  Mail: miniwing.hz@gmail.com
//

#import "MonitorContentController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MonitorContentController (Notification)

#if __Debug__
@notification(self);
#endif /* __Debug__ */

@end

NS_ASSUME_NONNULL_END
