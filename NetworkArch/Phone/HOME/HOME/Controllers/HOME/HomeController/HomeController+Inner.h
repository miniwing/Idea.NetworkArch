//
//  HomeController+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <ADs/AppOpenAdManager.h>

#import "HomeController.h"

#import "HomeContentController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeController () <CLLocationManagerDelegate>

@property (nonatomic, weak)   IBOutlet       UINavigationBarX                    * navigationBarX;
@property (nonatomic, strong) IBOutlet       UIBarButtonItem                     * rightBarButtonItem;
@property (nonatomic, strong) IBOutlet       UIButton                            * rightBarButton;

@property (nonatomic, weak)   IBOutlet       UIView                              * contentView;

@property (nonatomic, weak)   IBOutlet       UIView                              * bannerView;
@property (nonatomic, weak)   IBOutlet       NSLayoutConstraint                  * bannerViewHeight;
@property (nonatomic, weak)   IBOutlet       GADBannerView                       * gadBannerView;

@end

@interface HomeController ()

@property (nonatomic, strong)                HomeContentController               * contentController;

@property (nonatomic, strong)                CLLocationManager                   * locationManager;

@end

@interface HomeController (Inner)

@end

NS_ASSUME_NONNULL_END
