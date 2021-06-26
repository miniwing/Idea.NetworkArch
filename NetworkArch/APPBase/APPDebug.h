//
//  APPDebug.h
//  APPBase
//
//  Created by Harry on 2020/1/9.
//  Copyright © 2020 Harry. All rights reserved.
//

#ifndef APPDebug_h
#define APPDebug_h

#import "APPDef.h"

/***************************************************************************************************************/

//#define __DebugInfo__                              __AUTO__
//#define __DebugDebug__                             __AUTO__
//#define __DebugError__                             __AUTO__
//#define __DebugFunc__                              __AUTO__  /* __AUTO__ */
//#define __HWDecodeDebug__                          __AUTO__

/***************************************************************************************************************/

#define __DEBUG_COLOR__                            (__AUTO__)
#define __DEBUG_HTTP__                             (__AUTO__)

/***************************************************************************************************************/

#if __DEBUG_HTTP__
#  define LogHttp(x)                               LoggerDebug x
#else /* __DEBUG_HTTP__ */
#  define LogHttp(x)
#endif /* !__DEBUG_HTTP__ */

/***************************************************************************************************************/

#if (__Debug__ && TARGET_IPHONE_SIMULATOR)
#  define __InjectionIII__                         (__ON__)
#else /* (__Debug__ && TARGET_IPHONE_SIMULATOR) */
#  define __InjectionIII__                         (__OFF__)
#endif /* !(__Debug__ && TARGET_IPHONE_SIMULATOR) */

/***************************************************************************************************************/

#endif /* APPDebug_h */
