//
//  UISetting.h
//  SettingProvider
//
//  Created by Harry on 2022/3/11.
//

#import <IDEAStartUp/IDEAStartUp.h>

#import "UISetting.h"

@implementation UISetting

+ (CGFloat)cornerRadiusBig {
   
   return 8.0f;
}

+ (CGFloat)cornerRadiusSmall {
   
   return 4.0f;
}

+ (CGFloat)textFieldEdgeX {
   
   return 10.0f;
}

+ (CGFloat)textFieldEdgeY {
   
   return 0.0f;
}

@end

@implementation UISetting (Notification)

+ (NSString *)LOGINDONE_NOTIFICATION {
   
   return @"SETTING.LOGINDONE";
}

+ (NSString *)LOGOUT_NOTIFICATION {
   
   return @"SETTING.LOGOUT";
}

@end

@implementation UISetting (BarButton)

+ (CGFloat)leftBarButtonWidth {
   
   return 42.0f;
}

+ (CGFloat)rightBarButtonWidth {
   
   return 52;
}

@end

@implementation UISetting (Color)

+ (NSString *)mainColor {
   
   return @"mainColor";
}

@end

#pragma mark - IDEA_MAIN
IDEA_MAIN() {
   
   LogDebug((@"UISetting::IDEA_MAIN"));

   @try {
      
      NSString    *szFilePath = __FILE_IN_BUNDLE(@"Colors.txt", UISetting.class);
      LogDebug((@"UISetting::IDEA_MAIN : FilePath : %@", szFilePath));

      [DKColorTable appendThemes:szFilePath];

   } /* End try */
   @catch (NSException *_Exception) {
      
      LogDebug((@"UISetting::IDEA_MAIN : NSException : %@", _Exception));

   } /* End catch (NSException) */
   @finally {
      
   } /* End finally */

   return;
}
