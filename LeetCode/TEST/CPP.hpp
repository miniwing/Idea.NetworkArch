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

using namespace std;

BEGIN_NAMESPACE(Leet);

class TEST {
public:
   static vector<int> twoSum(vector<int>& nums, int target);
   
   
public:
   /**
    * Definition for singly-linked list.
    * struct ListNode {
    *     int val;
    *     ListNode *next;
    *     ListNode() : val(0), next(nullptr) {}
    *     ListNode(int x) : val(x), next(nullptr) {}
    *     ListNode(int x, ListNode *next) : val(x), next(next) {}
    * };
    */
   struct ListNode {
      int val;
      ListNode *next;
      ListNode() : val(0), next(nullptr) {}
      ListNode(int x) : val(x), next(nullptr) {}
      ListNode(int x, ListNode *next) : val(x), next(next) {}
   };
   
   static ListNode* addTwoNumbers(ListNode* l1, ListNode* l2);
   
public:
   static int lengthOfLongestSubstring(string s, string &strOut);
};

END_NAMESPACE(Leet);
