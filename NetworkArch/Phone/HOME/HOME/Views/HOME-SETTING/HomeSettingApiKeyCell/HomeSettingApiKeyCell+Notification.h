//
//  HomeSettingApiKeyCell+Notification.h
//  NetworkArch
//
//  Created by Harry on 2021/8/15.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "HomeSettingApiKeyCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeSettingApiKeyCell (Notification)

#if __Debug__
@notification(self);
#endif /* __Debug__ */

@end

NS_ASSUME_NONNULL_END
