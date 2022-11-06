//
//  PortScanController+Notification.h
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "PortScanController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PortScanController (Notification)

#if __Debug__
@notification(self);
#endif /* __Debug__ */

- (void)textFieldTextDidChange:(NSNotification *)aSender;

@end

NS_ASSUME_NONNULL_END
