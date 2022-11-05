//
//  WifiInterfacesController+Inner.m
//  NetworkArch
//
//  Created by Harry on 2021/8/4.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WifiInterfacesController+Inner.h"
#import "WifiInterfacesController+Action.h"
#import "WifiInterfacesController+Signal.h"
#import "WifiInterfacesController+Notification.h"
#import "WifiInterfacesController+Theme.h"
#import "WifiInterfacesController+Debug.h"

@implementation WifiInterfacesController (Inner)

@end

#pragma mark - UITableViewDelegate
@implementation WifiInterfacesController (UITableViewDelegate)

@end

#pragma mark - UITableViewDataSource
@implementation WifiInterfacesController (UITableViewDataSource)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
   
   int                            nErr                                     = EFAULT;
   
   NSInteger                      nNumberOfSections                        = 0;

   __TRY;

   nNumberOfSections = self.interfaces.count;
   
   __CATCH(nErr);

   return nNumberOfSections;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)aSection {
   
   return 1;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   WifiInterfacesCell            *stWifiInterfacesCell                     = nil;
   IDEANetInterface              *stNetInterface                           = nil;

   __TRY;

   stWifiInterfacesCell = [self.tableView dequeueReusableCellWithIdentifier:WifiInterfacesCell.reuseIdentifier
                                                               forIndexPath:aIndexPath];
   
   stNetInterface = [self.interfaces objectAtIndex:aIndexPath.section];
   [stWifiInterfacesCell setInterface:stNetInterface];
   
   if (@available(iOS 13, *)) {

   } /* End if () */
   else {
      
      [stWifiInterfacesCell setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight];

   } /* End else */

   
   __CATCH(nErr);

   return stWifiInterfacesCell;
}

@end

#pragma mark - UIStoryboard
@implementation WifiInterfacesController (UIStoryboard)

+ (NSString *)storyboard {
   
   return @"WIFI";
}

+ (NSString *)bundle {

   return @(BUNDLE);
}

@end

