//
//  DNSContentController.m
//  NetworkArch
//
//  Created by Harry on 2021/8/16.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "DNSController+Signal.h"

#import "DNSContentController.h"
#import "DNSContentController+Inner.h"
#import "DNSContentController+Signal.h"
#import "DNSContentController+Notification.h"

@implementation DNSContentController

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
   // [self.tableView setTableHeaderView:[UIView new]];
   [self.tableView setTableFooterView:[UIView new]];
   [self.tableView setEstimatedSectionFooterHeight:0];
   [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
   [self.tableView setSeparatorColor:UIColor.clearColor];
   
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

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
   
   return self.dns.count;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)aSection {
   
   return 1;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   DNSCell                       *stDNSCell                                = nil;
   
   NSArray                       *stKeys                                   = nil;
   DNSModel                      *stDNSModel                               = nil;
   
   __TRY;
      
   stDNSCell   = [aTableView dequeueReusableCellWithIdentifier:DNSCell.reuseIdentifier
                                                  forIndexPath:aIndexPath];
   
   // Configure the cell...
   stKeys      = [self.dns allKeys];
   stDNSModel  = [self.dns objectForKey:[stKeys objectAtIndex:aIndexPath.section]];

   [stDNSCell setDNSModel:stDNSModel];
   
   __CATCH(nErr);
   
   return stDNSCell;
}

- (nullable NSString *)tableView:(UITableView *)aTableView titleForHeaderInSection:(NSInteger)aSection {
   
   int                            nErr                                     = EFAULT;
   
   NSString                      *szTitle                                  = nil;
   NSArray                       *stKeys                                   = nil;
   
   __TRY;
   
   stKeys   = [self.dns allKeys];

   szTitle  = [NSString stringWithFormat:@"%@ RECORD", [stKeys objectAtIndex:aSection]];

   __CATCH(nErr);
   
   return szTitle;
}

#pragma mark -
- (void)startWithDomain:(NSString *)aDomain completion:(void (^ __nullable)(NSError  * _Nullable aError))aCompletion {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[DNSContentController startWithDomain:completion:] : Domain : %@", aDomain));
   
//   [self sendSignal:DNSController.startSignal withObject:aDomain];
   
   __CATCH(nErr);
   
   return;
}

#pragma mark - (NSMutableDictionary<NSString *, id> *)dns
- (NSMutableDictionary<NSString *, DNSModel *> *)dns {
   
   if (nil == _dns) {
      
      _dns  = [NSMutableDictionary<NSString *, DNSModel *> dictionary];
      
   } /* End if () */
   
   return _dns;
}

@end

#pragma mark - IBAction
@implementation DNSContentController (IBACTION)

- (IBAction)onAction:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

@end

#pragma mark - UIStoryboard
@implementation DNSContentController (UIStoryboard)

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
   
   return @"UTILITIES";
}

@end
