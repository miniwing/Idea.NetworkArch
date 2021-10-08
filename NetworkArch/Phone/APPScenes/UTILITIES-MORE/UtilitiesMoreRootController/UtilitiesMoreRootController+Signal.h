//
//  UtilitiesMoreRootController+Signal.h
//  NetworkArch
//
//  Created by Harry on 2021/10/8.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "UtilitiesMoreRootController.h"

#import <IDEAUIVendor/IDEAUIVendor.h>

NS_ASSUME_NONNULL_BEGIN

@interface UtilitiesMoreRootController (Signal)

#if __Debug__
@signal(self);
#endif /* __Debug__ */

@end

NS_ASSUME_NONNULL_END
