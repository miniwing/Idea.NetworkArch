//
//  APPFont.m
//  APPBase
//
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "APPFont.h"

/***************************************************************************************************************/

#define APP_FONT_SYSTEM_FAMILY                     ([UIFont systemFontOfSize:10].familyName)
#define APP_FONT_SYSTEM_LIGHT                      ([UIFont systemFontOfSize:10].fontName)
#define APP_FONT_SYSTEM_REGULAR                    ([UIFont systemFontOfSize:10].fontName)
#define APP_FONT_SYSTEM_BOLD                       ([UIFont systemFontOfSize:10].fontName)

//#define APP_FONT_ZEKTON_FAMILY                     @"Zekton"
//#define APP_FONT_ZEKTON_LIGHT                      @"Zekton-Light"
//#define APP_FONT_ZEKTON_REGULAR                    @"Zekton"
//#define APP_FONT_ZEKTON_BOLD                       @"Zekton-Bold"

//#define APP_FONT_HY_FAMILY                         @"HY"
//#define APP_FONT_HY_LIGHT                          @"HY-Light"
//#define APP_FONT_HY_REGULAR                        @"HY-Regular"
//#define APP_FONT_HY_BOLD                           @"HY-Bold"
//
//#define APP_FONT_MSYH_FAMILY                       @"Microsoft YaHei"
//#define APP_FONT_MSYH_LIGHT                        @"MicrosoftYaHeiLight"
//#define APP_FONT_MSYH_REGULAR                      @"MicrosoftYaHei"
//#define APP_FONT_MSYH_BOLD                         @"MicrosoftYaHeiSemibold"
////#define APP_FONT_MSYH_BOLD                         @"MicrosoftYaHeiUI-Bold"

//font:PingFangSC-Medium      // 中黑
//font:PingFangSC-Semibold    // 中粗
//font:PingFangSC-Light       // 细
//font:PingFangSC-Ultralight  // 极细
//font:PingFangSC-Regular     // 常规
//font:PingFangSC-Thin        // 纤细
//#define APP_FONT_PF_FAMILY                         @"PingFang SC"
//#define APP_FONT_PF_THIN                           @"PingFangSC-Thin"
//#define APP_FONT_PF_ULTRA_LIGHT                    @"PingFangSC-Ultralight"
//#define APP_FONT_PF_LIGHT                          @"PingFangSC-Light"
//#define APP_FONT_PF_REGULAR                        @"PingFangSC-Regular"
//#define APP_FONT_PF_BOLD                           @"PingFangSC-Semibold"
//
//#define APP_FONT_SFTEXT_FAMILY                     @"SF UI Text"
//#define APP_FONT_SFTEXT_LIGHT                      @"SFUIText-Light"
//#define APP_FONT_SFTEXT_REGULAR                    @"SFUIText-Regular"
//#define APP_FONT_SFTEXT_BOLD                       @"SFUIText-Semibold"

/***************************************************************************************************************/

#define __APP_FONT_FAMILY                          APP_FONT_SFTEXT_FAMILY
#define __APP_FONT_REGULAR                         APP_FONT_SFTEXT_LIGHT
#define __APP_FONT_BOLD                            APP_FONT_SFTEXT_REGULAR

#define __APP_FONT_TITLE                           APP_FONT_SFTEXT_LIGHT
#define __APP_FONT_TITLE_BOLD                      APP_FONT_SFTEXT_REGULAR

#if MATERIAL_APP_BAR
#  define __APP_FONT_TITLE_SIZE                    (22)
#else /* MATERIAL_APP_BAR */
#  define __APP_FONT_TITLE_SIZE                    (20)
#endif /* !MATERIAL_APP_BAR */

#define __APP_FONT_TITLE_SMALL_SIZE                (16)
#define __APP_FONT_SUB_TITLE_SIZE                  (10)
#define __APP_FONT_BAR_BUTTON_ITEM_SIZE            (14)

#define __APP_FONT_TAB_TITLE                       APP_FONT_ZEKTON_REGULAR
#define __APP_FONT_TAB_TITLE_SIZE                  (14)

#define __APP_FONT_SEARCH_BAR                      APP_FONT_ZEKTON_LIGHT
#define __APP_FONT_SEARCH_BAR_SIZE                 (14)

/***************************************************************************************************************/

#define IDEA_FONT_FAMILY(name, func)               (name##func)

#undef IDEA_FONT
#define IDEA_FONT                                  (1)

@interface APPFont ()

@end

@implementation APPFont

//+ (NSString *) appFontFamily
//{
//   return __APP_FONT_FAMILY;
//}
//
//+ (NSString *)appFontBold
//{
//   return __APP_FONT_BOLD;
//}
//
//+ (NSString *)appFontRegular
//{
//   return __APP_FONT_REGULAR;
//}
//
//+ (NSString *)appFontTitle
//{
//   return __APP_FONT_TITLE;
//}
//
//+ (NSString *)appFontTitleBold
//{
//   return __APP_FONT_TITLE_BOLD;
//}
//
//+ (CGFloat)appFontTitleSize
//{
//   return __APP_FONT_TITLE_SIZE;
//}
//
//+ (CGFloat)appFontTitleSmallSize
//{
//   return __APP_FONT_TITLE_SMALL_SIZE;
//}
//
//+ (CGFloat)appFontSubTitleSize
//{
//   return __APP_FONT_SUB_TITLE_SIZE;
//}
//
//+ (CGFloat)appFontBarButtonItemSize
//{
//   return __APP_FONT_BAR_BUTTON_ITEM_SIZE;
//}
//
//+ (NSString *)appFontTabTitle
//{
//   return __APP_FONT_TAB_TITLE;
//}
//
//+ (CGFloat)appFontTabTitleSize
//{
//   return __APP_FONT_TAB_TITLE_SIZE;
//}
//
//+ (NSString *)appFontSearchBar
//{
//   return __APP_FONT_SEARCH_BAR;
//}
//
//+ (CGFloat)appFontSearchBarSize
//{
//   return __APP_FONT_SEARCH_BAR_SIZE;
//}

+ (UIFont *)systemFont {
   
   static UIFont           *g_SYSTEM_FONT = nil;
   static dispatch_once_t   onceToken;
   dispatch_once(&onceToken, ^{
      g_SYSTEM_FONT = [UIFont systemFontOfSize:10];
   });
   
   return g_SYSTEM_FONT;
}

+ (NSString *) systemFontFamily {
   
   return [APPFont systemFont].familyName;
}

+ (NSString *)systemFontLight {
   
   return nil;
}

+ (NSString *) systemFontRegular {
   
   return nil;
}

+ (NSString *) systemFontBold {
   
   return nil;
}

+ (UIFont *)lightFontOfSize:(CGFloat)aSize {
   
#if IDEA_FONT
   return [UIFont HYLightFontOfSize:aSize];
#else /* IDEA_FONT */
   return [UIFont systemFontOfSize:aSize weight:UIFontWeightLight];
#endif /* !IDEA_FONT */
}

+ (UIFont *)regularFontOfSize:(CGFloat)aSize {

#if IDEA_FONT
   return [UIFont HYRegularFontOfSize:aSize];
#else /* IDEA_FONT */
   return [UIFont systemFontOfSize:aSize weight:UIFontWeightRegular];
#endif /* !IDEA_FONT */
}

#if IDEA_FONT_BOLD
+ (UIFont *)boldFontOfSize:(CGFloat)aSize {

#if IDEA_FONT
   return [UIFont HYBoldFontOfSize:aSize];
#else /* IDEA_FONT */
   return [UIFont systemFontOfSize:aSize weight:UIFontWeightBold];
#endif /* !IDEA_FONT */
}
#endif /* IDEA_FONT_BOLD */

//+ (UIFont *)systemFontOfSize:(CGFloat)fontSize weight:(UIFontWeight)weight;

@end

#pragma mark - navTitle
@implementation APPFont (navTitle)

//+ (NSString *) appFontTitle;
//+ (NSString *) appFontTitleBold;

+ (CGFloat)appFontTitleSize {
   
   return __APP_FONT_TITLE_SIZE;
}

@end

#pragma mark - searchBar
@implementation APPFont (searchBar)

//+ (NSString *) appFontSearchBar;

+ (CGFloat)appFontSearchBarSize {
   
   return __APP_FONT_SEARCH_BAR_SIZE;
}

@end

#pragma mark - tabBar
@implementation APPFont (tabBar)

//+ (NSString *) appFontTabTitle;

+ (CGFloat)appFontTabTitleSize {
   
   return __APP_FONT_TAB_TITLE_SIZE;
}

@end
