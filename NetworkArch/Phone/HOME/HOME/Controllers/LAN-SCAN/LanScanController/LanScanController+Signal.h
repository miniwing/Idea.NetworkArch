//
//  LanScanController+Signal.h
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "LanScanController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LanScanController (Signal)

#if __Debug__
@signal(self);
#endif /* __Debug__ */

@signal(startScan);
@signal(stopScan);

@signal(loadAD);

@end

NS_ASSUME_NONNULL_END
