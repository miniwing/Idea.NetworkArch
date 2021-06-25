//
//  main.m
//  NetworkArch
//
//  Created by Harry on 2021/6/24.
//  Copyright © 2021 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APPDelegate.h"

int main(int argc, char * argv[]) {
   
#if __Debug__
   [UncaughtExceptionHandler installUncaughtExceptionHandler:YES showAlert:YES];
#endif /* __Debug__ */

   @autoreleasepool {
      return UIApplicationMain(argc, argv, nil, NSStringFromClass([APPDelegate class]));
   }
}

