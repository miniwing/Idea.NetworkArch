//
//  UISettingController+Notification.h
//  SETTING
//
//  Created by Harry on 2021/6/10.
//  Copyright © 2021 Harry. All rights reserved.
//

#import <IDEAApplet/IDEAAppletNotification.h>

#import <UISETTING/UISettingController.h>

NS_ASSUME_NONNULL_BEGIN

@interface UISettingController (Notification)

#if __Debug__
@notification(self);
#endif /* __Debug__ */

@end

NS_ASSUME_NONNULL_END
