//
//  APPDef.h
//  APPBase
//
//  Created by Harry on 2019/12/31.
//  Copyright © 2019 Harry. All rights reserved.
//

#ifndef APPDef_h
#define APPDef_h

#import <IDEAKit/IDEAKit.h>

/***************************************************************************************************************/
/*
 * 默认动画时长。
 */
//#define UIAViewAnimationDefaultDuraton             (0.25f)
//static const NSTimeInterval UIAViewAnimationDefaultDuraton = 0.25;
/*
 * 开关
 */
//#define APP_NAVIGATION_BAR_BACKGROUND_IMAGE        (__ON__)
//#define APP_TAB_BAR_BACKGROUND_IMAGE               (__ON__)

/***************************************************************************************************************/

/*
 * Storyboard
 */

/***************************************************************************************************************/

/*
 * Margin
 */
#define APP_NAVBAR_BUTTON_ITEM_LEFT_MARGIN         (16)
#define APP_NAVBAR_BUTTON_ITEM_RIGHT_MARGIN        (16)
#define APP_NAVBAR_BUTTON_ITEM_WIDTH               (52)

#define APP_CONTENT_LEFT_MARGIN                    (0)
#define APP_CONTENT_RIGHT_MARGIN                   (0)

//                                                 {top, left, bottom, right}
#define APP_TITLE_INSETS                           UIEdgeInsetsMake(0, APP_NAVBAR_BUTTON_ITEM_LEFT_MARGIN, 0, APP_NAVBAR_BUTTON_ITEM_RIGHT_MARGIN)


/**
 推荐列表 => 更多
 */
#define APP_BOOK_RECOM_LIST_MORE                   (0)

/**
 分类封面自动刷新
 */
#define APP_BOOK_CLASSIFY_CELL_COVER_AUTO          (0)

/**
 阅读界面加载动画
 */
#define BOOK_READ_LOAD_ANIMATED_IMAGE              (0)

/***************************************************************************************************************/

#endif /* APPDef_h */
