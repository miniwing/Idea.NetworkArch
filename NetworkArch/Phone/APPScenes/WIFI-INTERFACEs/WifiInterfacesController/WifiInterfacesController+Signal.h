//
//  WifiInterfacesController+Signal.h
//  NetworkArch
//
//  Created by Harry on 2021/8/4.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "WifiInterfacesController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WifiInterfacesController (Signal)

#if __Debug__
@signal(self);
#endif /* __Debug__ */

@end

NS_ASSUME_NONNULL_END
