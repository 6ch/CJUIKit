//
//  CJRefreshAnimateManager.h
//  AppCommonUICollect
//
//  Created by ciyouzen on 2019/3/15.
//  Copyright © 2019 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJRefreshAnimateManager : NSObject {
    
}
@property (nonatomic, copy) NSString *animationNamed;

+ (CJRefreshAnimateManager *)sharedInstance;

@end
