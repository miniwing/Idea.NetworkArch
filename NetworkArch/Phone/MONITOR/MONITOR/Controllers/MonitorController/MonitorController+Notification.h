//
//  MonitorController+Notification.h
//  MONITOR
//
//  Created by Harry on 2021/6/9.
//  Copyright © 2021 Harry. All rights reserved.
//

#import <IDEAApplet/IDEAApplet.h>

#import "MonitorController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MonitorController (Notification)

#if __Debug__
@notification(self);
#endif /* __Debug__ */

@end

NS_ASSUME_NONNULL_END
