//
//  HomeContentCell.m
//  NetworkArch
//
//  Created by Harry on 2021/6/26.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "HomeContentCell.h"

@interface HomeContentCell ()

@end

@implementation HomeContentCell

- (void)dealloc {

   __LOG_FUNCTION;

   // Custom dealloc

   __SUPER_DEALLOC;

   return;
}

- (instancetype)initWithCoder:(NSCoder *)aCoder {

   int                            nErr                                     = EFAULT;

   __TRY;

   self  = [super initWithCoder:aCoder];
   // Dispose of any resources that can be recreated.
   
   if (self) {

   } /* End if () */

   __CATCH(nErr);

   return self;
}

- (void)awakeFromNib {

   int                            nErr                                     = EFAULT;

   __TRY;

   [super awakeFromNib];
   // Initialization code
   
   self.selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];// 这句不可省略
//   [self.selectedBackgroundView setSize:CGSizeZero];
   [self.selectedBackgroundView setBackgroundColor:UIColor.clearColor];
   [self.selectedBackgroundView setClipsToBounds:YES];

   LogDebug((@"-[HomeContentCell awakeFromNib] : selectionStyle : %d", self.selectionStyle));
   
   [self.selectedColorView setClipsToBounds:YES];
   [self.selectedColorView setBackgroundColor:UIColor.clearColor];

   __CATCH(nErr);

   return;
}

- (void)setHighlighted:(BOOL)aHighlighted animated:(BOOL)aAnimated {
   
   int                            nErr                                     = EFAULT;

   __TRY;

   LogDebug((@"-[HomeContentCell setHighlighted:animated:] : Highlighted : %d", aHighlighted));
   
   if (aHighlighted) {

   } /* End if () */
   else {

      [self.selectedColorView setBackgroundColor:UIColor.clearColor];

   } /* End else */

   if (NO == self.canSelected) {
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */
   
   [super setHighlighted:aHighlighted animated:aAnimated];

   // Configure the view for the highlighted state
   if (aHighlighted) {

      [self.selectedColorView setBackgroundColor:UIColor.systemBlueColor];

   } /* End if () */

//   if (aAnimated) {
//
//      [UIView transitionWithView:self.selectedColorView
//                        duration:UIAViewAnimationDefaultDuraton
//                         options:UIViewAnimationOptionTransitionCrossDissolve
//                      animations:^{
//
//         if (aHighlighted) {
//
//            [self.selectedColorView setBackgroundColor:UIColor.systemBlueColor];
//
//         } /* End if () */
//         else {
//
////            [self.selectedColorView setBackgroundColor:UIColor.clearColor];
//
//         } /* End else */
//      }
//                      completion:nil];
//
//   } /* End if () */
//   else {
//
//      if (aHighlighted) {
//
//         [self.selectedColorView setBackgroundColor:UIColor.systemBlueColor];
//
//      } /* End if () */
//      else {
//
////         [self.selectedColorView setBackgroundColor:UIColor.clearColor];
//
//      } /* End else */
//
//   } /* End else */

   __CATCH(nErr);
   
   return;
}

- (void)setSelected:(BOOL)aSelected animated:(BOOL)aAnimated {

   int                            nErr                                     = EFAULT;

   __TRY;

   LogDebug((@"-[HomeContentCell setSelected:animated:] : Selected : %d", aSelected));

   if (aSelected) {

   } /* End if () */
   else {

      [self.selectedColorView setBackgroundColor:UIColor.clearColor];

   } /* End else */

   if (NO == self.canSelected) {
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */

   [super setSelected:aSelected animated:aAnimated];

   // Configure the view for the selected state

   if (aSelected) {

      [self.selectedColorView setBackgroundColor:UIColor.systemBlueColor];

   } /* End if () */
   else {

      [self.selectedColorView setBackgroundColor:UIColor.clearColor];

   } /* End else */

//   if (aAnimated) {
//
//      [UIView transitionWithView:self.selectedColorView
//                        duration:UIAViewAnimationDefaultDuraton
//                         options:UIViewAnimationOptionTransitionCrossDissolve
//                      animations:^{
//
//         if (aSelected) {
//
//            [self.selectedColorView setBackgroundColor:UIColor.systemBlueColor];
//
//         } /* End if () */
//         else {
//
//            [self.selectedColorView setBackgroundColor:UIColor.clearColor];
//
//         } /* End else */
//      }
//                      completion:nil];
//
//   } /* End if () */
//   else {
//
//      if (aSelected) {
//
//         [self.selectedColorView setBackgroundColor:UIColor.systemBlueColor];
//
//      } /* End if () */
//      else {
//
//         [self.selectedColorView setBackgroundColor:UIColor.clearColor];
//
//      } /* End else */
//
//   } /* End else */
   
   __CATCH(nErr);
   
   return;
}

@end
