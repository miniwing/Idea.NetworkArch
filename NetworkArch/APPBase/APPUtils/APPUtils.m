//
//  APPUtils.m
//  APPBase
//
//  Created by Harry on 2021/8/12.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "APPUtils.h"

@interface APPUtils ()

@end

@implementation APPUtils

+ (NSString *)byteCountFormat:(NSInteger)aBytes {
   
   int                            nErr                                     = EFAULT;
   
   NSString                      *szFormat                                 = nil;
   
   NSString                      *aUnits[]                                 = {
      
      @"B", @"KB", @"MB", @"GB", @"TB", @"PB", @"EB", @"ZB", @"YB"
   };
   double                         dBytes                                   = aBytes;
   NSInteger                      nUnitIndex                               = 0;
   
   __TRY;
   
   for (nUnitIndex = 0; dBytes > 1024; ++nUnitIndex) {
      
      dBytes   = dBytes / 1024;
      
   } /* End for () */

   if (nUnitIndex <= (sizeof(aUnits) / sizeof(NSString *))) {
      
      if (0 == nUnitIndex) {
         
         szFormat = [NSString stringWithFormat:@"%ld %@", (long)dBytes, aUnits[nUnitIndex]];
         
      } /* End if () */
      else {

         szFormat = [NSString stringWithFormat:@"%.2f %@", dBytes, aUnits[nUnitIndex]];

      } /* End else */
      
   } /* End if () */

   __CATCH(nErr);
   
   return szFormat;
}

@end
