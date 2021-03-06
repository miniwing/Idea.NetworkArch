//
//  HomeContentController+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "HomeContentController.h"

#import "UIDevice+Network.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeContentController () {
   
   dispatch_once_t   _viewDidLayoutToken;
}

@end

@interface HomeContentController ()

@property (nonatomic, strong)                NSString                            * SSID;

@end

@interface HomeContentController (Inner)

@end

NS_ASSUME_NONNULL_END
