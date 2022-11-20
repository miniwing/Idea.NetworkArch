//
//  UISettingTableController+Notification.h
//  UISETTING
//
//  Created by Harry on 2021/8/19.
//  Copyright © 2021 Harry. All rights reserved.
//

#import <IDEAApplet/IDEAAppletNotification.h>
#import <UISETTING/UISettingTableController.h>

NS_ASSUME_NONNULL_BEGIN

@interface UISettingTableController (Notification)

#if __Debug__
@notification(self);
#endif /* __Debug__ */

@notification(about);

@end

NS_ASSUME_NONNULL_END
