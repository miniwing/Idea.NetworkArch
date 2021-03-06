//
//  WoLANContentController.m
//  NetworkArch
//
//  Created by Harry on 2021/8/13.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WoLANContentController.h"
#import "WoLANContentController+Inner.h"
#import "WoLANContentController+Signal.h"
#import "WoLANContentController+Notification.h"

@implementation WoLANContentController

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
   
   // Uncomment the following line to preserve selection between presentations.
   self.clearsSelectionOnViewWillAppear = NO;
   
   // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
   // self.navigationItem.rightBarButtonItem = self.editButtonItem;
   
   [self.tableView setTableHeaderView:[UIView new]];
   [self.tableView setTableFooterView:[UIView new]];
   [self.tableView setEstimatedSectionFooterHeight:0];
   [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
   
   [self.tableView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor tertiarySystemGroupedBackground])];
   
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

#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
   
   int                            nErr                                     = EFAULT;
   
   NSInteger                      nNumber                                  = 1;

   __TRY;

   if (self.packets.count) {
      
      nNumber  += 1;
      
   } /* End if () */

   __CATCH(nErr);

   return nNumber;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)aSection {
   
   int                            nErr                                     = EFAULT;
   
   NSInteger                      nNumber                                  = 1;

   __TRY;

//   WoLANSectionDevice = 0,
//   WoLANSectionPacket = 1,
//   WoLANSectionNumber

   if (WoLANSectionPacket == aSection) {
      
      nNumber  = self.packets.count;
      
      nErr     = noErr;
      
      break;
      
   } /* End if () */
   
   if (WoLANSectionDevice == aSection) {
      
      nNumber  = 1;
      
      nErr     = noErr;
      
      break;
      
   } /* End if () */

   __CATCH(nErr);

   return nNumber;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)aIndexPath {

   int                            nErr                                     = EFAULT;

   UITableViewCell               *stTableViewCell                          = nil;
   
   WoLANCell                     *stWoLANCell                              = nil;
   WoLANPacketCell               *stWoLANPacketCell                        = nil;
   
   WoLANPacket                   *stWoLANPacket                            = nil;
   
   __TRY;

   if (WoLANSectionPacket == aIndexPath.section) {
      
      stWoLANPacketCell = [aTableView dequeueReusableCellWithIdentifier:WoLANPacketCell.reuseIdentifier
                                                           forIndexPath:aIndexPath];
      
      stWoLANPacket     = [self.packets objectAtIndex:aIndexPath.row];
      [stWoLANPacketCell setWoLANPacket:stWoLANPacket];
      
      if (0 == aIndexPath.row) {
         
         [stWoLANPacketCell.separatorView setHidden:NO];
         [stWoLANPacketCell setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight];

      } /* End if () */
      else if (self.packets.count - 1 == aIndexPath.row) {
         
         [stWoLANPacketCell.separatorView setHidden:YES];
         [stWoLANPacketCell setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight];

      } /* End else */
      else {
         
         [stWoLANPacketCell.separatorView setHidden:NO];
         [stWoLANPacketCell setRectCorner:0];

      } /* End else */
      
      if (1 == self.packets.count) {
         
         [stWoLANPacketCell.separatorView setHidden:YES];
         [stWoLANPacketCell setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight];

      } /* End if () */
      
      stTableViewCell   = stWoLANPacketCell;
      
   } /* End if () */
   else if (WoLANSectionDevice == aIndexPath.section) {
      
      stWoLANCell = [aTableView dequeueReusableCellWithIdentifier:WoLANCell.reuseIdentifier
                                                     forIndexPath:aIndexPath];

      [stWoLANCell setTextChangeBlock:^(NSIndexPath * _Nonnull aIndexPath, WoLANCell * _Nonnull aWoLANCell) {
         
         self.mac             = [aWoLANCell.macTextField.text copy];
         self.broadcastAddr   = [aWoLANCell.broadcastTextField.text copy];
         self.port            = [aWoLANCell.portTextField.text copy];
      }];
      
   #if __Debug__
      [stWoLANCell.macTextField setText:@"FF:FF:FE:EE:EE:EE"];
      [stWoLANCell.broadcastTextField setText:@"255.255.255.0"];
      [stWoLANCell.portTextField setText:@"19"];
   #endif /* __Debug__ */
      
      stTableViewCell   = stWoLANCell;

   } /* End if () */
   
   __CATCH(nErr);

   return stTableViewCell;
}

#pragma mark - <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)aTableView heightForRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   CGFloat                        fHeight                                  = 0.0f;

   __TRY;

//   WoLANSectionDevice = 0,
//   WoLANSectionPacket = 1,
//   WoLANSectionNumber

   if (WoLANSectionDevice == aIndexPath.section) {
      
      fHeight  = 132;
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */
   
   if (WoLANSectionPacket == aIndexPath.section) {
      
      fHeight  = 44;
      
      nErr  = noErr;

   } /* End if () */
   
   __CATCH(nErr);

   return fHeight;
}

#pragma mark - (NSMutableArray<WoLANPacket *> *)packets
- (NSMutableArray<WoLANPacket *> *)packets {
   
   if (nil == _packets) {
      
      _packets = [NSMutableArray<WoLANPacket *> array];
      
   } /* End if () */
   
   return _packets;
}

@end

#pragma mark - IBAction
@implementation WoLANContentController (IBACTION)

- (IBAction)onAction:(id)aSender {

   int                            nErr                                     = EFAULT;

   __TRY;

   __CATCH(nErr);

   return;
}

@end

#pragma mark - UIStoryboard
@implementation WoLANContentController (UIStoryboard)

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
