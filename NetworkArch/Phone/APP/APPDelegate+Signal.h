//
//  APPDelegate+Signal.h
//  NetworkArch
//
//  Created by Harry on 2021/7/31.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "APPDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface APPDelegate (Signal)

@signal(loadApiKey);
@signal(loadApiKeyDone);

@end

NS_ASSUME_NONNULL_END
