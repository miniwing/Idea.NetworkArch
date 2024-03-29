//
//  CellularMoreContentController+Signal.h
//  NetworkArch
//
//  Created by Harry on 2021/8/1.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "CellularMoreContentController.h"

#import <IDEAUIVendor/IDEAUIVendor.h>

NS_ASSUME_NONNULL_BEGIN

@interface CellularMoreContentController (Signal)

#if __Debug__
@signal(self);
#endif /* __Debug__ */

@signal(loadAD);

@end

NS_ASSUME_NONNULL_END
