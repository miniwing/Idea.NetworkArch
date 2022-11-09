//
//  HomeSettingContentController+Inner.m
//  NetworkArch
//
//  Created by Harry on 2021/8/15.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "HomeSettingContentController+Inner.h"
#import "HomeSettingContentController+Action.h"
#import "HomeSettingContentController+Signal.h"
#import "HomeSettingContentController+Notification.h"
#import "HomeSettingContentController+Theme.h"
#import "HomeSettingContentController+Debug.h"

@implementation HomeSettingContentController (Inner)

@end

#pragma mark - UITableViewDataSource
@implementation HomeSettingContentController (UITableViewDataSource)

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
         
//         [self sendSignal:self.addLinkSignal];
         [self notify:self.addLinkNotification];
         
         return;
      }];
      
   } /* End else if () */
   
   __CATCH(nErr);
   
   return stTableViewCell;
}

@end
