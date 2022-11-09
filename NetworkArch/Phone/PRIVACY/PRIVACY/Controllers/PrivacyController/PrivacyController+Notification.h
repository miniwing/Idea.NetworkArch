//
//  PrivacyController+Notification.h
//  NuclearWater
//
//  Created by Harry on 2021/6/9.
//  Copyright © 2021 Harry. All rights reserved.
//

#import <IDEAApplet/IDEAApplet.h>

#import "PrivacyController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PrivacyController (Notification)

@notification(privacyDone);
@notification(trackingDone);

@end

NS_ASSUME_NONNULL_END
