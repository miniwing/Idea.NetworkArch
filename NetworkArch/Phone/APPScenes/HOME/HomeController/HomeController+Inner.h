//
//  HomeController+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "HomeController.h"

#import "HomeContentController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeController () <CLLocationManagerDelegate>

@property (nonatomic, strong)                MDCAppBar                           * appBar;

@property (nonatomic, strong)                HomeContentController               * contentController;

@property (nonatomic, strong)                CLLocationManager                   * locationManager;

@end

@interface HomeController (Inner)

@end

NS_ASSUME_NONNULL_END
