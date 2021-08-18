//
//  HomeSettingAlertController+Notification.h
//  NetworkArch
//
//  Created by Harry on 2021/8/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "HomeSettingAlertController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeSettingAlertController (Notification)

#if __Debug__
@notification(self);
#endif /* __Debug__ */

@notification(alertDone);

@end

NS_ASSUME_NONNULL_END
