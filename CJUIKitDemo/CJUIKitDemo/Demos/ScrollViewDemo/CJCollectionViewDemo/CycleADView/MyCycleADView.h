//
//  MyCycleADView.h
//  AllScrollViewDemo
//
//  Created by 李超前 on 2017/10/15.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "MyEqualCellSizeCollectionView.h"
#import "MyADModel.h"

@interface MyCycleADView : MyEqualCellSizeCollectionView {
    
}
@property (nonatomic, strong) NSMutableArray<MyADModel *> *dataModels;

@end
