//
//  WoLANContentController+Inner.m
//  NetworkArch
//
//  Created by Harry on 2021/8/13.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WoLANContentController+Inner.h"
#import "WoLANContentController+Action.h"
#import "WoLANContentController+Signal.h"
#import "WoLANContentController+Notification.h"
#import "WoLANContentController+Theme.h"
#import "WoLANContentController+Debug.h"

@implementation WoLANContentController (Inner)

@end

#pragma mark - UITableViewDataSource
@implementation WoLANContentController (UITableViewDataSource)

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
         
         LogDebug((@"-[WoLANContentController tableView:cellForRowAtIndexPath:] : mac : %@", self.mac));
         LogDebug((@"-[WoLANContentController tableView:cellForRowAtIndexPath:] : broadcastAddr : %@", self.broadcastAddr));
         LogDebug((@"-[WoLANContentController tableView:cellForRowAtIndexPath:] : port : %@", self.port));

//         if (kStringIsBlank(self.mac) || !kStringIsBlank(self.broadcastAddr) || !kStringIsBlank(self.port)) {
//
////            [self.rightBarButton setEnabled:NO];
//
//         } /* End if () */
//         else {
//
////            [self.rightBarButton setEnabled:YES];
//
//         } /* End else */

         [self postNotify:WoLANContentController.textChangeNotification
                  onQueue:DISPATCH_GET_MAIN_QUEUE()];
         
         return;
      }];
      
   #if __Debug__
      DISPATCH_ASYNC_ON_MAIN_QUEUE(^{

         [stWoLANCell.macTextField setText:@"FF:FF:FE:EE:EE:EE"];
         [stWoLANCell.broadcastTextField setText:@"255.255.255.0"];
         [stWoLANCell.portTextField setText:@"19"];
         
         [stWoLANCell.macTextField becomeFirstResponder];
         
         return;
      });
   #endif /* __Debug__ */
      
      stTableViewCell   = stWoLANCell;

   } /* End if () */
   
   __CATCH(nErr);

   return stTableViewCell;
}

@end

#pragma mark - UITableViewDelegate
@implementation WoLANContentController (UITableViewDelegate)

- (CGFloat)tableView:(UITableView *)aTableView heightForRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   CGFloat                        fHeight                                  = 0.0f;

   __TRY;

//   WoLANSectionDevice = 0,
//   WoLANSectionPacket = 1,
//   WoLANSectionNumber

   if (WoLANSectionDevice == aIndexPath.section) {
      
      fHeight  = 144;
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */
   
   if (WoLANSectionPacket == aIndexPath.section) {
      
      fHeight  = 48;
      
      nErr  = noErr;

   } /* End if () */
   
   __CATCH(nErr);

   return fHeight;
}

@end
