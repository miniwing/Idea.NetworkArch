//
//  MonitorContentController+Signal.h
//  MONITOR
//
//  Created by Harry on 2022/11/20.
//
//  Mail: miniwing.hz@gmail.com
//

#import "MonitorContentController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MonitorContentController (Signal)

#if __Debug__
@signal(self);
#endif /* __Debug__ */

@signal(loadAD);

@end

NS_ASSUME_NONNULL_END
