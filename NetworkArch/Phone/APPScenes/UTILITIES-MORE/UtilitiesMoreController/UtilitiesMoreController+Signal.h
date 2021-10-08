//
//  UtilitiesMoreController+Signal.h
//  NetworkArch
//
//  Created by Harry on 2021/10/8.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "UtilitiesMoreController.h"

#import <IDEAUIVendor/IDEAUIVendor.h>

NS_ASSUME_NONNULL_BEGIN

@interface UtilitiesMoreController (Signal)

#if __Debug__
@signal(self);
#endif /* __Debug__ */

@end

NS_ASSUME_NONNULL_END
