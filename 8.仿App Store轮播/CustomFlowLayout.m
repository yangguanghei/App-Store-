//
//  CustomFlowLayout.m
//  8.仿App Store轮播
//
//  Created by 梁森 on 2020/7/16.
//  Copyright © 2020 梁森. All rights reserved.
//

#import "CustomFlowLayout.h"

@implementation CustomFlowLayout


- (void)prepareLayout{
    [super prepareLayout];
    self.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width-40, 350);
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing = 10;
    self.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);

}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    //获取UICollectionView停止的时候的可视范围
    CGRect contentFrame;
    contentFrame.size = self.collectionView.frame.size;
    contentFrame.origin = proposedContentOffset;
    NSArray *array = [self layoutAttributesForElementsInRect:contentFrame];
    // 计算在可视范围的距离中心线最近的Item ABC()为系统取绝对值的函数
    CGFloat minCenterX = CGFLOAT_MAX;
    CGFloat collectionViewCenterX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    for (UICollectionViewLayoutAttributes *attrs in array) {
        if(ABS(attrs.center.x - collectionViewCenterX) < ABS(minCenterX)){
            minCenterX = attrs.center.x - collectionViewCenterX;
        }
    }
    //补回ContentOffset，则正好将Item居中显示
    return CGPointMake(proposedContentOffset.x + minCenterX, proposedContentOffset.y);

}

@end
