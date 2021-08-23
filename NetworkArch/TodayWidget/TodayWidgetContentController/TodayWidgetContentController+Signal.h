//
//  TodayWidgetContentController+Signal.h
//  TodayWidget
//
//  Created by Harry on 2021/7/24.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "TodayWidgetContentController.h"

NS_ASSUME_NONNULL_BEGIN

@interface TodayWidgetContentController (Signal)

#if __Debug__
@signal(self);
#endif /* __Debug__ */

@signal(loadWifiInfo);
@signal(loadCellularInfo);

@end

NS_ASSUME_NONNULL_END
