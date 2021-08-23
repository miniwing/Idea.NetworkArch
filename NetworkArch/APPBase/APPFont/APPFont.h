//
//  APPFont.h
//  APPBase
//
//  Created by Harry on 2019/12/31.
//  Copyright © 2019 Harry. All rights reserved.
//

#ifndef APPFont_h
#define APPFont_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#  if __has_include(<IDEAFONT/IDEAFONT.h>)
#     import <IDEAFONT/IDEAFONT.h>
#  elif __has_include("IDEAFONT/IDEAFONT.h")
#     import "IDEAFONT/IDEAFONT.h"
#  elif __has_include("IDEAFONT.h")
#     import "IDEAFONT.h"
#  else
//#     define IDEA_FONT                                                     (0)
#  endif

NS_ASSUME_NONNULL_BEGIN

@interface APPFont : NSObject

+ (UIFont *)lightFontOfSize:(CGFloat)aSize;
+ (UIFont *)regularFontOfSize:(CGFloat)aSize;

#if IDEA_FONT_BOLD
+ (UIFont *)boldFontOfSize:(CGFloat)size;
#endif /* IDEA_FONT_BOLD */

@end

@interface APPFont (navTitle)

+ (CGFloat)    appFontTitleSize;

@end

@interface APPFont (searchBar)

+ (CGFloat)    appFontSearchBarSize;

@end

@interface APPFont (tabBar)

+ (CGFloat)    appFontTabTitleSize;

@end

NS_ASSUME_NONNULL_END

#endif /* APPFont_h */
