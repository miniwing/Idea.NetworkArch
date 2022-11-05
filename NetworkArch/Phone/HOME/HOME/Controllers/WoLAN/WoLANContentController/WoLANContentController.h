//
//  WoLANContentController.h
//  NetworkArch
//
//  Created by Harry on 2021/8/13.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "IDEATableViewController.h"

NS_ASSUME_NONNULL_BEGIN

IDEA_ENUM(NSInteger, WoLANSection) {
   
   WoLANSectionDevice = 0,
   WoLANSectionPacket = 1,
   WoLANSectionNumber
};

@interface WoLANContentController : IDEATableViewController

@end

NS_ASSUME_NONNULL_END
