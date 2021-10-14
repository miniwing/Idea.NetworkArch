//
//  WifiScanRootController+Signal.h
//  NetworkArch
//
//  Created by Harry on 2021/9/11.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "WifiScanRootController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WifiScanRootController (Signal)

#if __Debug__
@signal(self);
#endif /* __Debug__ */

@end

NS_ASSUME_NONNULL_END
