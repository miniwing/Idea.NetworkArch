//
//  main.m
//  TodayClip
//
//  Created by Harry on 2021/7/27.
//  Copyright © 2021 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APPDelegate.h"

int main(int argc, char * argv[]) {
   NSString * appDelegateClassName;
   @autoreleasepool {
      // Setup code that might create autoreleased objects goes here.
      appDelegateClassName = NSStringFromClass([APPDelegate class]);
   }
   return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
