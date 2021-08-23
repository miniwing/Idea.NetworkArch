//
//  PingController+Signal.h
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "PingController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PingController (Signal)

#if __Debug__
@signal(self);
#endif /* __Debug__ */

@signal(startPing);

@end

NS_ASSUME_NONNULL_END
