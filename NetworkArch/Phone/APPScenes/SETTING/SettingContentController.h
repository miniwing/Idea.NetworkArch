//
//  SettingContentController.h
//  SETTING
//
//  Created by Harry on 2021/02/25.
//  Copyright © 2021 Harry. All rights reserved.
//

#import <IDEAUIVendor/IDEATableViewController.h>

#import "ThemeButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingContentController : IDEATableViewController

@property (nonatomic, strong) IBOutletCollection(UITableViewCell) NSArray        * cellUIs;

@property (nonatomic, weak)   IBOutlet       UILabel                             * cellUITitle;
@property (nonatomic, weak)   IBOutlet       UISwitch                            * cellUISwitch;

@property (nonatomic, strong) IBOutletCollection(UITableViewCell) NSArray        * cellAnimates;

@property (nonatomic, weak)   IBOutlet       UILabel                             * cellAnimateTitle;
@property (nonatomic, weak)   IBOutlet       UISwitch                            * cellAnimateSwitch;

@property (nonatomic, strong) IBOutletCollection(UITableViewCell) NSArray        * cellRates;
@property (nonatomic, weak)   IBOutlet       UILabel                             * cellRateTitle;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * cellRatesRightImage;

@property (nonatomic, strong) IBOutletCollection(UITableViewCell) NSArray        * cellAbouts;
@property (nonatomic, weak)   IBOutlet       UILabel                             * cellWeiboTitle;
@property (nonatomic, weak)   IBOutlet       UILabel                             * cellWeiboName;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * cellWeiboRightImage;
@property (nonatomic, weak)   IBOutlet       UILabel                             * cellTwitterTitle;
@property (nonatomic, weak)   IBOutlet       UILabel                             * cellTwitterName;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * cellTwitterRightImage;
@property (nonatomic, weak)   IBOutlet       UILabel                             * cellFacebookTitle;
@property (nonatomic, weak)   IBOutlet       UILabel                             * cellFacebookName;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * cellFacebookRightImage;
@property (nonatomic, weak)   IBOutlet       UILabel                             * cellVerTitle;
@property (nonatomic, weak)   IBOutlet       UILabel                             * cellVerBuild;

@property (nonatomic, weak)   IBOutlet       UIView                              * lightBGView;
@property (nonatomic, weak)   IBOutlet       UIView                              * nightBGView;

@property (nonatomic, weak)   IBOutlet       ThemeButton                         * lightButton;
@property (nonatomic, weak)   IBOutlet       ThemeButton                         * nightButton;

@end

NS_ASSUME_NONNULL_END
