//
//  MonitorWidgetController+Signal.h
//  MonitorWidget
//
//  Created by Harry on 2022/11/23.
//  Copyright © 2022 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "MonitorWidgetController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MonitorWidgetController (Signal)

#if __Debug__
@signal(self);
#endif /* __Debug__ */

@end

NS_ASSUME_NONNULL_END
