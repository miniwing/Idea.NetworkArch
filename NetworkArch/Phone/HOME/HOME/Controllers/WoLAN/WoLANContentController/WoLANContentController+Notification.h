//
//  WoLANContentController+Notification.h
//  NetworkArch
//
//  Created by Harry on 2021/8/13.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "WoLANContentController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WoLANContentController (Notification)

#if __Debug__
@notification(self);
#endif /* __Debug__ */

@notification(textChange);
@notification(done);

@end

NS_ASSUME_NONNULL_END
