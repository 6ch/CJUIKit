//
//  TestValueChangeTableViewCell.h
//  CJUIKitDemo
//
//  Created by ciyouzen on 12/7/18.
//  Copyright © 2018 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>
#ifdef CJTESTPOD
#import "CJChooseTextTextField.h"
#else
#import <CJBaseUIKit/CJChooseTextTextField.h>
#endif

#import "TestValueChangeModel.h"

@interface TestValueChangeTableViewCell : UITableViewCell {
    
}
@property (nonatomic, strong) TestValueChangeModel *valueChangeModel;


@end
