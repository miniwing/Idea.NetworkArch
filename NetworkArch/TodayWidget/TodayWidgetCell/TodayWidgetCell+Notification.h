//
//  TodayWidgetCell+Notification.h
//  TodayWidget
//
//  Created by Harry on 2021/7/24.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "TodayWidgetCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface TodayWidgetCell (Notification)

#if __Debug__
@notification(self);
#endif /* __Debug__ */

@end

NS_ASSUME_NONNULL_END
