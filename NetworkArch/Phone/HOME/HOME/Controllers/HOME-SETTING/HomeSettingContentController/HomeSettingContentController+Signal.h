//
//  HomeSettingContentController+Signal.h
//  NetworkArch
//
//  Created by Harry on 2021/8/15.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "HomeSettingContentController.h"

#import <IDEAUIVendor/IDEAUIVendor.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeSettingContentController (Signal)

#if __Debug__
@signal(self);
#endif /* __Debug__ */

//@signal(save);
//@signal(addLink);

@end

NS_ASSUME_NONNULL_END
