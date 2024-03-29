//
//  HomeSettingContentController+Notification.h
//  NetworkArch
//
//  Created by Harry on 2021/8/15.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "HomeSettingContentController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeSettingContentController (Notification)

#if __Debug__
@notification(self);
#endif /* __Debug__ */

@notification(save);
@notification(addLink);

@end

NS_ASSUME_NONNULL_END
