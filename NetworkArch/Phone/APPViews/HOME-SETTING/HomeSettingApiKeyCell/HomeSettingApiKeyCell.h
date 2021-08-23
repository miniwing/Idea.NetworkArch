//
//  HomeSettingApiKeyCell.h
//  NetworkArch
//
//  Created by Harry on 2021/8/15.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <UIKit/UIKit.h>

#import "APPTextField.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeSettingApiKeyCell : UITableViewCell

@property (nonatomic, weak)   IBOutlet       UIView                              * containerView;
@property (nonatomic, weak)   IBOutlet       UIView                              * separatorView;

@property (nonatomic, weak)   IBOutlet       APPTextField                        * apiKeytextField;

@end

typedef void (^ TextChangeBlock )( NSIndexPath *aIndexPath, NSString *aText );

@interface HomeSettingApiKeyCell ()

@property (nonatomic, copy)                  TextChangeBlock                       textChangeBlock;

@end

NS_ASSUME_NONNULL_END
