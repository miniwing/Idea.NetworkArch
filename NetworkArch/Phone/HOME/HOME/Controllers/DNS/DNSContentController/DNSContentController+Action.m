//
//  DNSContentController+Action.m
//  HOME
//
//  Created by Harry on 2022/11/5.
//

#import "DNSContentController+Action.h"

#pragma mark - IBAction
@implementation DNSContentController (Action)

#if __Debug__
- (IBAction)onAction:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}
#endif /* __Debug__ */

@end

