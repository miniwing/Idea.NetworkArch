//
//  PHAuthorizationAnimation.m
//  UISETTING
//
//  Created by Harry on 2022/6/21.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "PHAuthorizationAnimation.h"

// 原文链接：https://blog.csdn.net/youshaoduo/article/details/53203211

//+ (void)animateWithDuration:(NSTimeInterval)duration
//                      delay:(NSTimeInterval)delay
//     usingSpringWithDamping:(CGFloat)dampingRatio
//      initialSpringVelocity:(CGFloat)velocity
//                    options:(UIViewAnimationOptions)options
//                 animations:(void (^)(void))animations
//                 completion:(void (^)(BOOL aFinished))completion
//
//
//usingSpringWithDamping 的范围为0.0f到1.0f，数值越小「弹簧」的振动效果越明显。
//
//initialSpringVelocity 则表示初始的速度，数值越大一开始移动越快。

@interface PHAuthorizationAnimation ()

@end

@implementation PHAuthorizationAnimation

- (void)dealloc {
   
   __LOG_FUNCTION;
   
   // Custom dealloc
   
   __SUPER_DEALLOC;
   
   return;
}

- (instancetype)init {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   self  = [super init];
   
   if (self) {
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (void)presentAnimateTransition:(nonnull id <HWPresentingViewControllerContextTransitioning>)aContext {
   
   NSTimeInterval    tDuration   = [UIView animationDefaultDuration];   // [aContext transitionDuration];
   UIViewController *stFromVC    = [aContext viewControllerForKey:UITransitionContextFromViewControllerKey];
   
   [UIView beginAnimations:NSStringFromSelector(@selector(presentAnimateTransition:)) context:nil];
   [UIView setAnimationDuration:tDuration];
   [UIView setAnimationCurve:7];

   CGFloat fStatusBarHeight   = [UIApplication sharedApplication].statusBarFrame.size.height * 1.5;
   CGFloat fScale             = 1 - fStatusBarHeight * 2 / CGRectGetHeight(stFromVC.view.bounds);
   stFromVC.view.transform    = CGAffineTransformMakeScale(fScale, fScale);
   
   [stFromVC.view setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight
                         radius:8];
//   [stFromVC.view setCornerRadius:8 clipsToBounds:YES];

   [UIView commitAnimations];

//   [UIView animateWithDuration:tDuration
//                         delay:0
//                       options:UIViewAnimationOptionCurveEaseIn
//                    animations:^{
//
//      CGFloat fStatusBarHeight   = [UIApplication sharedApplication].statusBarFrame.size.height * 1.5;
//      CGFloat fScale             = 1 - fStatusBarHeight * 2 / CGRectGetHeight(stFromVC.view.bounds);
//      stFromVC.view.transform    = CGAffineTransformMakeScale(fScale, fScale);
//
//      [stFromVC.view setCornerRadius:8 clipsToBounds:YES];
//   }
//                    completion:^(BOOL aFinished) {
//
//   }];
   
//   [UIView animateWithDuration:duration
//                         delay:0
//        usingSpringWithDamping:0.9
//         initialSpringVelocity:0
//                       options:UIViewAnimationOptionCurveEaseIn
//                    animations:^{
//      CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
//      CGFloat scale = 1 - statusBarHeight * 2 / CGRectGetHeight(fromVC.view.bounds);
//      fromVC.view.transform = CGAffineTransformMakeScale(scale, scale);
//   }
//                    completion:^(BOOL aFinished) {
//
//   }];
   
   return;
}

- (void)dismissAnimateTransition:(nonnull id <HWPresentingViewControllerContextTransitioning>)aContext {
   
   NSTimeInterval    tDuration   = [UIView animationDefaultDuration];   // [aContext transitionDuration];
   UIViewController *stToVC      = [aContext viewControllerForKey:UITransitionContextToViewControllerKey];
   
   
//   [UIView animateWithDuration:tDuration
//                         delay:0
//                       options:UIViewAnimationOptionCurveEaseOut
//                    animations:^{
//
//      stToVC.view.transform = CGAffineTransformIdentity;
//      [stToVC.view setCornerRadius:0 clipsToBounds:YES];
//   }
//                    completion:^(BOOL aFinished) {
//   }];
   
   [UIView beginAnimations:NSStringFromSelector(@selector(dismissAnimateTransition:)) context:nil];
   [UIView setAnimationDuration:tDuration];
   [UIView setAnimationCurve:7];

   stToVC.view.transform = CGAffineTransformIdentity;
   
//   [stToVC.view setCornerRadius:0 clipsToBounds:YES];
   [stToVC.view setRectCorner:0
                       radius:8];

   [UIView commitAnimations];

   return;
}

//- (void)presentAnimateTransition:(nonnull id <HWPresentingViewControllerContextTransitioning>)aContext {
//
//   NSTimeInterval     tDuration  = [aContext transitionDuration];
//   UIViewController  *stFromVC   = [aContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//
//   [UIView animateWithDuration:tDuration delay:0
//        usingSpringWithDamping:0.8
//         initialSpringVelocity:0
//                       options:UIViewAnimationOptionCurveEaseIn
//                    animations:^{
//
//      stFromVC.view.transform = CGAffineTransformMakeScale(0.9, 0.9);
//   }
//                    completion:^(BOOL aFinished) {
//
//   }];
//
//   return;
//}
//
//- (void)dismissAnimateTransition:(nonnull id <HWPresentingViewControllerContextTransitioning>)aContext {
//   // no need for using animating block.
//   UIViewController  *stToVC     = [aContext viewControllerForKey:UITransitionContextToViewControllerKey];
//
//   stToVC.view.transform = CGAffineTransformIdentity;
//
//   return;
//}

@end
