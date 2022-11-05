//
//  PHAuthorizationController+Signal.h
//  UISETTING
//
//  Created by Harry on 2022/6/20.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "PHAuthorizationController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PHAuthorizationController (Signal)

#if __Debug__
@signal(self);
#endif /* __Debug__ */

@end

NS_ASSUME_NONNULL_END
