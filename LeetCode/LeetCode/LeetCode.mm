//
//  LeetCode.m
//  Pods
//
//  Created by Harry on 2021/8/21.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "LeetCode.h"
#include "CPP.hpp"

USE_NAMESPACE(std);

@interface LeetCode ()

@end

@implementation LeetCode

+ (void)twoSum:(NSArray<NSNumber *> *)aNums target:(int)aTarget {
   
   int                            nErr                                     = EFAULT;
   
   vector<int>                    stNums;
   
   __TRY;
   
   for (NSNumber *stNumber in aNums) {
      
      stNums.push_back(stNumber.intValue);
      
   } /* End for () */
   
   Leet::TEST::twoSum(stNums, aTarget);
   
   __CATCH(nErr);
   
   return;
}

+ (void)addTwoNumbers:(NSArray<NSNumber *> *)aList1 list2:(NSArray<NSNumber *> *)aList2 {
   
   int                            nErr                                     = EFAULT;
   
   Leet::TEST::ListNode          *stHead1                                  = nil;
   Leet::TEST::ListNode          *stHead2                                  = nil;
   Leet::TEST::ListNode          *stTail                                   = nil;

   __TRY;
   
   for (NSNumber *stNumber in aList1) {

      if (nil == stHead1) {
         
         stHead1 = stTail  = new Leet::TEST::ListNode(stNumber.intValue);
         
      } /* End if () */
      else {
         
         stTail->next   = new Leet::TEST::ListNode(stNumber.intValue);
         stTail         = stTail->next;
         
      } /* End else */
      
   } /* End for () */

   for (NSNumber *stNumber in aList2) {

      if (nil == stHead2) {
         
         stHead2 = stTail  = new Leet::TEST::ListNode(stNumber.intValue);
         
      } /* End if () */
      else {
         
         stTail->next   = new Leet::TEST::ListNode(stNumber.intValue);
         stTail         = stTail->next;
         
      } /* End else */
      
   } /* End for () */

   Leet::TEST::addTwoNumbers(stHead1, stHead2);
   
   __CATCH(nErr);
   
   return;
}

+ (void)lengthOfLongestSubstring:(NSString *)aString {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

@end
