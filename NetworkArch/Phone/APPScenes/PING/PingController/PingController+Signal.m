//
//  PingController+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "PingController+Signal.h"

@implementation PingController (Signal)

#if __Debug__
@def_signal (self);
#endif /* __Debug__ */

@def_signal (startPing);

@end
