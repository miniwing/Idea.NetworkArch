//
//  HomeSettingContentController.m
//  NetworkArch
//
//  Created by Harry on 2021/8/15.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "HomeSettingContentController.h"
#import "HomeSettingContentController+Inner.h"
#import "HomeSettingContentController+Signal.h"
#import "HomeSettingContentController+Notification.h"

@implementation HomeSettingContentController

- (void)dealloc {
   
   __LOG_FUNCTION;
   
   // Custom dealloc
   
   [self unobserveAllNotifications];
   [self removeAllSignalResponders];

   __SUPER_DEALLOC;
   
   return;
}

- (instancetype)initWithCoder:(NSCoder *)aCoder {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   self  = [super initWithCoder:aCoder];
   
   if (self) {
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (void)viewDidLoad {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewDidLoad];
   
   [self.tableView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor tertiarySystemGroupedBackground])];
   
   // Uncomment the following line to preserve selection between presentations.
   self.clearsSelectionOnViewWillAppear = NO;
   
   // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
   // self.navigationItem.rightBarButtonItem = self.editButtonItem;
   [self.tableView setTableHeaderView:[UIView new]];
   //   [self.tableView setTableFooterView:[UIView new]];
   [self.tableView setEstimatedSectionFooterHeight:0];
   [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
   [self.tableView setSeparatorColor:UIColor.clearColor];
   
   [self.bottomView setBackgroundColor:UIColor.clearColor];
   
   [self.saveButton setCornerRadius:8 clipsToBounds:YES];
   [self.saveButton setBackgroundColor:UIColor.systemRedColor];
   [self.saveButton.titleLabel setFont:[APPFont regularFontOfSize:self.saveButton.titleLabel.font.pointSize]];
   [self.saveButton setTitle:APP_STR(@"SAVE") forState:UIControlStateNormal];
   
   __CATCH(nErr);
   
   return;
}

- (void)didReceiveMemoryWarning {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
   
   __CATCH(nErr);
   
   return;
}

- (void)viewDidLayoutSubviews {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewDidLayoutSubviews];
   
   [self.settingCellContainerViews.firstObject setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];
   [self.settingCellContainerViews.lastObject setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];
   
   __CATCH(nErr);
   
   return;
}

- (void)viewWillAppear:(BOOL)aAnimated {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewWillAppear:aAnimated];
   
   __CATCH(nErr);
   
   return;
}

- (void)viewDidAppear:(BOOL)aAnimated {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewDidAppear:aAnimated];
   
   __CATCH(nErr);
   
   return;
}

- (void)viewWillDisappear:(BOOL)aAnimated {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewWillDisappear:aAnimated];
   
   __CATCH(nErr);
   
   return;
}

- (void)viewDidDisappear:(BOOL)aAnimated {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewDidDisappear:aAnimated];
   
   __CATCH(nErr);
   
   return;
}

- (BOOL)resignFirstResponder {
   
   int                            nErr                                     = EFAULT;
   
   BOOL                           bDone                                    = NO;
   
   HomeSettingApiKeyCell         *stHomeSettingApiKeyCell                  = nil;
   
   __TRY;
   
   stHomeSettingApiKeyCell = __cast(HomeSettingApiKeyCell *, self.settingCells[0]);
   
   bDone = [stHomeSettingApiKeyCell.apiKeytextField resignFirstResponder];
   
   if (!bDone) {
      
      bDone = [super resignFirstResponder];
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return bDone;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
   
   return 1;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)aSection {
   
   return HomeSettingNumber;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   UITableViewCell               *stTableViewCell                          = nil;
   
   HomeSettingApiKeyCell         *stHomeSettingApiKeyCell                  = nil;
   HomeSettingLinkCell           *stHomeSettingLinkCell                    = nil;
   
   __TRY;
   
   stTableViewCell   = self.settingCells[aIndexPath.row];
   
   if (HomeSettingApiKey == aIndexPath.row) {
      
      stHomeSettingApiKeyCell = __cast(HomeSettingApiKeyCell *, stTableViewCell);
      
      [stHomeSettingApiKeyCell setTextChangeBlock:^(NSIndexPath * _Nonnull aIndexPath, NSString * _Nonnull aText) {
         
         LogDebug((@"-[HomeSettingContentController tableView:cellForRowAtIndexPath:] : Text : %@", aText));
         
         self.apiKey = aText;
         
         if (kStringIsEmpty(self.apiKey)) {
            
            [self.saveButton setEnabled:NO];
            
         } /* End if () */
         else {
            
            [self.saveButton setEnabled:YES];
            
         } /* End else */
      }];
      
   } /* End if () */
   else if (HomeSettingLink == aIndexPath.row) {
      
      stHomeSettingLinkCell   = __cast(HomeSettingLinkCell *, stTableViewCell);
      
      [stHomeSettingLinkCell setAddLinkBlock:^(NSIndexPath * _Nonnull aIndexPath) {
         
         [self sendSignal:self.addLinkSignal];
      }];
      
   } /* End else if () */
   
   __CATCH(nErr);
   
   return stTableViewCell;
}

@end

#pragma mark - UIStoryboard
@implementation HomeSettingContentController (UIStoryboard)

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)aSegue sender:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   // Get the new view controller using [aSegue destinationViewController].
   // Pass the selected object to the new view controller.
   
   __CATCH(nErr);
   
   return;
}

+ (NSString *)storyboard {
   
   return @"HOME";
}

@end

#pragma mark - IBAction
@implementation HomeSettingContentController (Action)

- (IBAction)onSave:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [self sendSignal:self.saveSignal withObject:self.apiKey];
   
   __CATCH(nErr);
   
   return;
}

@end
