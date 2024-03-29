//
//  WiFiMoreContentController+Signal.h
//  NetworkArch
//
//  Created by Harry on 2021/8/1.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "WiFiMoreContentController.h"

#import <IDEAUIVendor/IDEAUIVendor.h>

NS_ASSUME_NONNULL_BEGIN

@interface WiFiMoreContentController (Signal)

#if __Debug__
@signal(self);
#endif /* __Debug__ */

@signal(loadExternalIPv4);

@signal(loadAD);

@end

NS_ASSUME_NONNULL_END
