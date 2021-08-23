//
//  LeetCode.h
//  Pods
//
//  Created by Harry on 2021/8/21.
//
//  Mail: miniwing.hz@gmail.com
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LeetCode : NSObject

@end

@interface LeetCode ()

+ (void)twoSum:(NSArray<NSNumber *> *)aNums target:(int)aTarget;
+ (void)addTwoNumbers:(NSArray<NSNumber *> *)aList1 list2:(NSArray<NSNumber *> *)aList2;
+ (void)lengthOfLongestSubstring:(NSString *)aString;

@end

NS_ASSUME_NONNULL_END
