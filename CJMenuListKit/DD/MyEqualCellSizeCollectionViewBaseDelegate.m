//
//  MyEqualCellSizeCollectionViewBaseDelegate.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2016/4/10.
//  Copyright © 2016年 dvlproad. All rights reserved.
//

#import "MyEqualCellSizeCollectionViewBaseDelegate.h"

@interface MyEqualCellSizeCollectionViewBaseDelegate () {
    
}

@end



@implementation MyEqualCellSizeCollectionViewBaseDelegate


////*
//#pragma mark - UICollectionViewDelegateFlowLayout
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
//                        layout:(UICollectionViewLayout *)collectionViewLayout
//        insetForSectionAtIndex:(NSInteger)section
//{
////    return UIEdgeInsetsMake(10, 10, 10, 10);
//    UIEdgeInsets sectionInset = self.equalCellSizeSetting.sectionInset;
//    return sectionInset;
//}
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView
//                   layout:(UICollectionViewLayout *)collectionViewLayout
//minimumLineSpacingForSectionAtIndex:(NSInteger)section
//{
////    return 15;
//    CGFloat minimumLineSpacing = self.equalCellSizeSetting.minimumLineSpacing;
//    return minimumLineSpacing;
//}
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView
//                   layout:(UICollectionViewLayout *)collectionViewLayout
//minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
////    return 10;
//    CGFloat minimumInteritemSpacing = self.equalCellSizeSetting.minimumInteritemSpacing;
//    return minimumInteritemSpacing;
//}
//
//- (CGSize)collectionView:(UICollectionView *)collectionView
//                  layout:(UICollectionViewLayout*)collectionViewLayout
//  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    MyEqualCellSizeSetting *equalCellSizeSetting = self.equalCellSizeSetting;
//    
//    CGSize collectionViewCellSize = [self.equalCellSizeSetting sizeForItemWithCollectionViewSize:collectionView.frame.size];
//    return collectionViewCellSize;
//    
//    /*
//    CGFloat collectionViewCellWidth = 0;
//    if (equalCellSizeSetting.cellWidthFromFixedWidth > 0) {
//        collectionViewCellWidth = equalCellSizeSetting.cellWidthFromFixedWidth;
//        
//    } else if (equalCellSizeSetting.cellWidthFromPerRowMaxShowCount > 0) {
//        NSInteger cellWidthFromPerRowMaxShowCount = equalCellSizeSetting.cellWidthFromPerRowMaxShowCount;
//        
//        UIEdgeInsets sectionInset = [self collectionView:collectionView
//                                                  layout:collectionViewLayout
//                                  insetForSectionAtIndex:indexPath.section];
//        CGFloat minimumInteritemSpacing = [self collectionView:collectionView
//                                                        layout:collectionViewLayout
//                      minimumInteritemSpacingForSectionAtIndex:indexPath.section];
//        
//        CGFloat width = CGRectGetWidth(collectionView.frame);
//        CGFloat validWith = width - sectionInset.left - sectionInset.right - minimumInteritemSpacing*(cellWidthFromPerRowMaxShowCount-1);
//        collectionViewCellWidth = floorf(validWith/cellWidthFromPerRowMaxShowCount);
//    }
//    
//    CGFloat collectionViewCellHeight = 0;
//    if (equalCellSizeSetting.cellHeightFromFixedHeight >0) {
//        collectionViewCellHeight = equalCellSizeSetting.cellHeightFromFixedHeight;
//    } else if (equalCellSizeSetting.cellHeightFromPerColumnMaxShowCount > 0) {
//        NSInteger cellHeightFromPerColumnMaxShowCount = equalCellSizeSetting.cellHeightFromPerColumnMaxShowCount;
//        
//        UIEdgeInsets sectionInset = [self collectionView:collectionView
//                                                  layout:collectionViewLayout
//                                  insetForSectionAtIndex:indexPath.section];
//        CGFloat minimumLineSpacing = [self collectionView:collectionView
//                                                   layout:collectionViewLayout
//                      minimumLineSpacingForSectionAtIndex:indexPath.section];
//        
//        CGFloat height = CGRectGetHeight(collectionView.frame);
//        CGFloat validHeight = height - sectionInset.top - sectionInset.bottom - minimumLineSpacing*(cellHeightFromPerColumnMaxShowCount-1);
//        collectionViewCellHeight = floorf(validHeight/cellHeightFromPerColumnMaxShowCount);
//    }
//    
//    
//    NSAssert(collectionViewCellWidth > 0 || collectionViewCellHeight > 0, @"collectionViewCell 的 width 与 height 不能都未设置");
//    if (collectionViewCellWidth > 0 && collectionViewCellHeight > 0) {
//        NSLog(@"collectionViewCell 的 width 与 height 已设置完毕");
//        return CGSizeMake(collectionViewCellWidth, collectionViewCellHeight);
//    }
//    
//    NSAssert(equalCellSizeSetting.widthHeightRatio > 0, @"在只设置宽或高时，需要由比例来计算另一个值，所以比例值必须大于0");
//    if (collectionViewCellWidth > 0) {
//        collectionViewCellHeight = collectionViewCellWidth/equalCellSizeSetting.widthHeightRatio;
//    } else {
//        collectionViewCellWidth = collectionViewCellHeight*equalCellSizeSetting.widthHeightRatio;
//    }
//    
//    return CGSizeMake(collectionViewCellWidth, collectionViewCellHeight);
//    */
//}
////*/

#pragma mark - UICollectionViewDelegate
// 此点击部分请在子类中实现
////“点到”item时候执行的时间(allowsMultipleSelection为默认的NO的时候，只有选中，而为YES的时候有选中和取消选中两种操作)
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"此点击部分请在子类中实现");
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"此点击部分请在子类中实现");
}



#pragma mark - Other
/*
 *  获取当前collectionView的高度
 *
 *  @param allCellCount             collectionView中cell(含dataCell和extralCell)的总数
 *  @param collectionViewWidth      要传入的collectionView的宽度
 *  @param flowLayout               集合视图的布局
 *
 *  @return 当前collectionView的高度
 */
+ (CGFloat)heightForAllCellCount:(NSInteger)allCellCount
           byCollectionViewWidth:(CGFloat)collectionViewWidth
        withEqualCellSizeSetting:(CQCollectionViewFlowLayout *)flowLayout
{
    CGFloat minimumLineSpacing = flowLayout.minimumLineSpacing;
    CGFloat minimumInteritemSpacing = flowLayout.minimumInteritemSpacing;
    UIEdgeInsets sectionInset = flowLayout.sectionInset;
    
    
    //计算cell的宽度
    CGFloat collectionViewCellWidth = 0;
    NSInteger perRowMaxShowCount = 0;
    if (flowLayout.cellWidthFromFixedWidth) {
        collectionViewCellWidth = flowLayout.cellWidthFromFixedWidth;
        
        //sectionInset.left + x*width + (x-1)*minimumInteritemSpacing + sectionInset.right <= collectionViewWidth;
        //x*cellWidth + (x-1)*minimumInteritemSpacing <= collectionViewWidth - sectionInset.left - sectionInset.right;
        //x*(cellWidth+minimumInteritemSpacing) <= collectionViewWidth - sectionInset.left - sectionInset.right + minimumInteritemSpacing;
        CGFloat validWidth = collectionViewWidth - sectionInset.left - sectionInset.right;
        perRowMaxShowCount = (validWidth+minimumInteritemSpacing)/(collectionViewCellWidth+minimumInteritemSpacing);
        
    } else {
        perRowMaxShowCount = flowLayout.cellWidthFromPerRowMaxShowCount;
        NSAssert(perRowMaxShowCount != 0, @"perRowMaxShowCount不能为0");
        
        CGFloat validWidth = collectionViewWidth - sectionInset.left - sectionInset.right;
        CGFloat cellsWidth = validWidth - minimumInteritemSpacing*(perRowMaxShowCount-1);
        collectionViewCellWidth = floorf(cellsWidth/perRowMaxShowCount);
    }
    
    
    /* 获取cell的高度 */
    CGFloat collectionViewCellHeight = flowLayout.cellHeightFromFixedHeight;
    if (collectionViewCellHeight <= 0) { //如果cell的高度未设置，我们默认使其等于cell的宽度
        collectionViewCellHeight = collectionViewCellWidth;
    }
    

    CGFloat height = 0;
    if (allCellCount == 0) {
        NSInteger currentRowCount = 0;
        height += currentRowCount * collectionViewCellHeight;
    } else {
        NSInteger currentRowCount = (allCellCount-1)/perRowMaxShowCount + 1;
        height += currentRowCount * collectionViewCellHeight + (currentRowCount - 1)*minimumLineSpacing;
    }
    height += sectionInset.top + sectionInset.bottom;
    
    return height;
}

@end
