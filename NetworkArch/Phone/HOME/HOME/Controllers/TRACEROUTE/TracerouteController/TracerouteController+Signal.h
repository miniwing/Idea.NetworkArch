//
//  TracerouteController+Signal.h
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "TracerouteController.h"

NS_ASSUME_NONNULL_BEGIN

@interface TracerouteController (Signal)

#if __Debug__
@signal(self);
#endif /* __Debug__ */

@signal(startScan);
@signal(stopScan);

@signal(loadAD);

@end

NS_ASSUME_NONNULL_END
