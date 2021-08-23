//
//  OneYear+Inner.h
//  FleetingWidget
//
//  Created by Harry on 2021/7/26.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "OneYear.h"

NS_ASSUME_NONNULL_BEGIN

@interface OneYear ()

@property (nonatomic, assign)                NSInteger                             secondCount;

@property (nonatomic, assign)                NSDate                              * firstDate;
@property (nonatomic, assign)                NSTimeInterval                        firstInterval;
@property (nonatomic, assign)                NSDateComponents                    * firstDateComponent;

@property (nonatomic, assign)                NSDate                              * lastDate;
@property (nonatomic, assign)                NSTimeInterval                        lastInterval;
@property (nonatomic, assign)                NSDateComponents                    * lastDateComponent;

@property (nonatomic, assign)                NSTimeInterval                        oneYear;

@end

@interface OneYear (Inner)

@property (nonatomic, class, readonly)       NSString                            * timeType;

@end

NS_ASSUME_NONNULL_END
