//
//  WoLANCell+Notification.h
//  NetworkArch
//
//  Created by Harry on 2021/8/13.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "WoLANCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface WoLANCell (Notification)

#if __Debug__
@notification(self);
#endif /* __Debug__ */

- (void)textFieldTextDidChange:(NSNotification *)aSender;

@end

NS_ASSUME_NONNULL_END
