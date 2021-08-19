//
//  SettingController+Notification.h
//  SETTING
//
//  Created by Harry on 2021/6/10.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "SettingController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingController (Notification)

#if __Debug__
@notification(self);
#endif /* __Debug__ */

@notification(tabAnimation);

@end

NS_ASSUME_NONNULL_END
