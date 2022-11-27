//
//  AboutController+Inner.h
//  Pods
//
//  Created by Harry on 2022/11/26.
//
//  Mail: miniwing.hz@gmail.com
//

#import "AboutController.h"

NS_ASSUME_NONNULL_BEGIN

@interface AboutController ()

@property (nonatomic, weak)   IBOutlet       UINavigationBarX                    * navigationBarX;
//@property (nonatomic, weak)   IBOutlet       NSLayoutConstraint                  * navigationBarXHeight;

@property (nonatomic, weak)   IBOutlet       UIBarButtonItem                     * leftBarButtonItem;
@property (nonatomic, weak)   IBOutlet       UIButton                            * leftBarButton;

@property (nonatomic, weak)   IBOutlet       UIImageView                         * sponsorImageView;
@property (nonatomic, weak)   IBOutlet       UILabel                             * nameLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * versionLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * buildLabel;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * bottomImageView;

@property (nonatomic, weak)   IBOutlet       UILabel                             * copyrightLabel;

@end

@interface AboutController (Inner)

@end

NS_ASSUME_NONNULL_END
