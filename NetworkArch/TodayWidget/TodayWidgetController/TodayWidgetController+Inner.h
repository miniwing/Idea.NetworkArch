//
//  TodayWidgetController+Inner.h
//  TodayWidget
//
//  Created by Harry on 2021/7/24.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "TodayWidgetController.h"
#import "TodayWidgetContentController.h"

NS_ASSUME_NONNULL_BEGIN

@interface TodayWidgetController () <CLLocationManagerDelegate>

@property (nonatomic, strong)                TodayWidgetContentController        * contentController;
@property (nonatomic, strong)                CLLocationManager                   * locationManager;

@property (nonatomic, assign)                CGSize                                minimumContentSize;

@end

@interface TodayWidgetController (Inner)

@end

NS_ASSUME_NONNULL_END
