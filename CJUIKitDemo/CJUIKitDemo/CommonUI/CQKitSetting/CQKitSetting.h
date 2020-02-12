//
//  CQKitSetting.h
//  AppCommonUICollect
//
//  Created by ciyouzen on 2019/3/15.
//  Copyright © 2019 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CQKitSetting : NSObject {
    
}
#pragma mark - HUD
/**
*  设置全局ProgressHUD的json文件名
*
*  @param animationNamed animationNamed
*/
+ (void)configHUDAnimationWithAnimationNamed:(NSString *)animationNamed;

#pragma mark - HEADER
+ (void)configHeaderAnimationWithAnimationNamed:(NSString *)animationNamed;
+ (void)updateHeaderStateTextWithIdleText:(NSString *)idleText
                              pullingText:(NSString *)pullingText
                           refreshingText:(NSString *)refreshingText;

#pragma mark - FOOTER
+ (void)updateFooterStateTextWithIdleText:(NSString *)idleText
                              pullingText:(NSString *)pullingText
                           refreshingText:(NSString *)refreshingText
                           noMoreDataText:(NSString *)noMoreDataText;

@end
