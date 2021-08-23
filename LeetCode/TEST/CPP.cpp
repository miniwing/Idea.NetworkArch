//
//  CPP.hpp
//  LeetCode
//
//  Created by Harry on 2021/8/18.
//  Copyright © 2021 Harry. All rights reserved.
//

#include <stdio.h>
#include <iostream>
#include <iomanip>
#include <fstream>

#include <vector>
#include <string>
#include <unordered_set>

#include "CPP.hPP"

USE_NAMESPACE(std);
BEGIN_NAMESPACE(Leet);

vector<int> TEST::twoSum(vector<int>& nums, int target) {
   
   for (int I = 0; I < nums.size(); I++) {
      
      for (int J = I + 1; J < nums.size(); ++J) {
         
         if (nums[I] + nums[J] == target) {
            
            return {I, J};
         }
      }
   }
   
   return {};
}

TEST::ListNode* TEST::addTwoNumbers(ListNode* l1, ListNode* l2) {
   
   ListNode    *head       = nullptr;
   ListNode    *tail       = nullptr;
   
   int          carry      = 0;
   
   while ((nullptr != l1) || (nullptr != l2)) {
      
      int n1  = (nullptr != l1) ? l1->val : 0;
      int n2  = (nullptr != l2) ? l2->val : 0;
      
      int sum = n1 + n2 + carry;
      
      if (nullptr == head) {
         head = tail = new ListNode(sum % 10);
      }
      else {
         tail->next  = new ListNode(sum % 10);
         tail = tail->next;
      }
      
      carry = sum / 10;
      
      if (nullptr != l1) {
         l1  = l1->next;
      }
      
      if (nullptr != l2) {
         l2  = l2->next;
      }
   }
   
   if (0 < carry) {
      tail->next  = new ListNode(carry);
      tail = tail->next;
   }
   
   return head;
}

int TEST::lengthOfLongestSubstring(string s, string &strOut) {

   vector<char>         chars;
   unordered_set<char>  occ;

   long N        = s.size();
   int  rk       = -1;
   int  length   = 0;
   
   for (int indicator = 0; indicator < N; ++indicator) {
      
      if (0 != indicator) {
         
         // 左指针向右移动一格，移除一个字符
         occ.erase(s[indicator - 1]);
      } /* End if () */
      
      while (rk + 1 < N && !occ.count(s[rk + 1])) {
         
         // 不断地移动右指针
         occ.insert(s[rk + 1]);
         ++rk;
      }

      // 第 i 到 rk 个字符是一个极长的无重复字符子串
      if (length < rk - indicator + 1) {
         
         chars.clear();
         std::copy(occ.begin(), occ.end(), std::back_inserter(chars));
         
      } /* End if () */
      
      length  = max(length, rk - indicator + 1);
      
   } /* End for () */
   
//       string  res;
//       res.insert(res.begin(), chars.begin(), chars.end());
//
//       res.clear();
   std::copy(chars.rbegin(), chars.rend(), std::back_inserter(strOut));
   
   return length;
}

END_NAMESPACE(Leet);
