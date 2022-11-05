//
//  PingController+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import <IDEAPing/IDEAPing.h>

#import <IDEAPing/IDEAPingClient.h>

#import "PingController.h"

#import "PingStatisticsCell.h"
#import "PingGraphCell.h"
#import "PingResultCell.h"

NS_ASSUME_NONNULL_BEGIN

IDEA_ENUM(NSInteger, PingSection) {
   
   PingSectionStatistics   = 0,
   PingSectionPing         = 1,
   PingSectionNumber
};

@interface PingController () <UITextFieldDelegate> {

   dispatch_once_t                          _firstResponder;
}

@end

@interface PingController ()

@property (nonatomic, weak)   IBOutlet       UINavigationBarX                    * navigationBarX;
@property (nonatomic, strong) IBOutlet       UIBarButtonItem                     * leftBarButtonItem;
@property (nonatomic, strong) IBOutlet       UIButton                            * leftBarButton;

@property (nonatomic, strong) IBOutlet       UIBarButtonItem                     * rightBarButtonItem;
@property (nonatomic, strong) IBOutlet       UIButton                            * rightBarButton;

@property (nonatomic, weak)   IBOutlet       UIView                              * inputView;
@property (nonatomic, weak)   IBOutlet       UITextFieldX                        * textField;

@property (nonatomic, weak)   IBOutlet       UITableView                         * tableView;

@end

@interface PingController ()

@property (nonatomic, strong)                IDEAPingClient                      * pingClient;
@property (nonatomic, strong)                NSMutableArray<PingResult *>        * pingResults;

@property (nonatomic, strong)                NSMutableArray<NSNumber *>          * sections;

@end

@interface PingController (Inner)

@end

@interface PingController (UITextFieldDelegate)

- (BOOL)textFieldShouldBeginEditing:(UITextField *)aTextField;
- (void)textFieldDidBeginEditing:(UITextField *)aTextField;
- (BOOL)textFieldShouldEndEditing:(UITextField *)aTextField;
- (void)textFieldDidEndEditing:(UITextField *)aTextField;
- (void)textFieldDidEndEditing:(UITextField *)aTextField reason:(UITextFieldDidEndEditingReason)aReason;

- (BOOL)textField:(UITextField *)aTextField shouldChangeCharactersInRange:(NSRange)aRange replacementString:(NSString *)aString;

- (void)textFieldDidChangeSelection:(UITextField *)aTextField API_AVAILABLE(ios(13.0), tvos(13.0));

- (BOOL)textFieldShouldClear:(UITextField *)aTextField;               // called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)textFieldShouldReturn:(UITextField *)aTextField;              // called when 'return' key pressed. return NO to ignore.

- (void)textFieldTextDidChange:(NSNotification *)aSender;

@end

NS_ASSUME_NONNULL_END
