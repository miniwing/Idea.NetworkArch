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

#import <IDEAUIKit/IDEAUIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WoLANCell : UITableViewCellX

@property (nonatomic, strong) IBOutletCollection(UITextFieldX) NSArray<UITextFieldX *> * textFields;

@property (nonatomic, weak)   IBOutlet       UITextFieldX                        * macTextField;
@property (nonatomic, weak)   IBOutlet       UITextFieldX                        * broadcastTextField;
@property (nonatomic, weak)   IBOutlet       UITextFieldX                        * portTextField;

@property (nonatomic, strong) IBOutletCollection(UIView) NSArray<UIView *>       * separatorViews;

@end

typedef void (^ WoLANTextChangeBlock )    ( NSIndexPath *aIndexPath, WoLANCell *aWoLANCell );

@interface WoLANCell ()

@property (nonatomic, copy)                  WoLANTextChangeBlock                  textChangeBlock;

@end

NS_ASSUME_NONNULL_END
