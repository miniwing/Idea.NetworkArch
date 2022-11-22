//
//  NetworkMonitor+Inner.h
//  MonitorService
//
//  Created by Harry on 2022/11/20.
//

#import "NetworkMonitor.h"

NS_ASSUME_NONNULL_BEGIN

#define MAX_HISTORY                          (128)

@interface NetworkMonitor ()

/// 网络上行速率
@property (nonatomic, assign)                CGFloat                               uploadSpeed;

/// 网络下行速率
@property (nonatomic, assign)                CGFloat                               downloadSpeed;

@property (nonatomic, assign)                NSUInteger                            uploadStartBytes;

@property (nonatomic, assign)                NSUInteger                            downloadStartBytes;

@property (nonatomic, assign)                NSUInteger                            uploadBytes;
@property (nonatomic, strong)                NSMutableArray                      * uploadHistory;

@property (nonatomic, assign)                NSUInteger                            downloadBytes;
@property (nonatomic, strong)                NSMutableArray                      * downloadHistory;

@property (nonatomic, assign)                uint64_t                              iBytes;
@property (nonatomic, assign)                uint64_t                              oBytes;
@property (nonatomic, assign)                uint64_t                              allFlow;

@property (nonatomic, strong)                NSTimer                             * timer;

@end

@interface NetworkMonitor (Inner)

@end

NS_ASSUME_NONNULL_END
