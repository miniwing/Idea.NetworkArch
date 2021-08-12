//
//  WoLANCell.h
//  NetworkArch
//
//  Created by Harry on 2021/8/13.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <UIKit/UIKit.h>

#import "APPTextField.h"

NS_ASSUME_NONNULL_BEGIN

@interface WoLANCell : UITableViewCell

@property (nonatomic, weak)   IBOutlet       UIView                              * containerView;

@property (nonatomic, strong) IBOutletCollection(APPTextField) NSArray<APPTextField *> * textFields;

@property (nonatomic, weak)   IBOutlet       APPTextField                        * macTextField;
@property (nonatomic, weak)   IBOutlet       APPTextField                        * broadcastTextField;
@property (nonatomic, weak)   IBOutlet       APPTextField                        * portTextField;

@property (nonatomic, strong) IBOutletCollection(UIView) NSArray<UIView *>       * separatorViews;

@end

@interface WoLANCell ()

@end

NS_ASSUME_NONNULL_END
