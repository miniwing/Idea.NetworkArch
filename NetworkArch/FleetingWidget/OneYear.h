//
//  OneYear.h
//  FleetingWidget
//
//  Created by Harry on 2021/7/26.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OneYear : NSObject

@singleton  (OneYear);

@end

@interface OneYear ()

@property (nonatomic, assign)                NSInteger                             timeType;

@property (nonatomic, assign)                NSInteger                             year;

@end

@interface OneYear ()

- (NSString *)currentProgress;
- (double)currentProgressValue;

@end

NS_ASSUME_NONNULL_END
