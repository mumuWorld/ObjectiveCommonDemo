//
//  MMCollectionViewAlignmentLayout.m
//  LogDemo
//
//  Created by mumu on 2020/1/15.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMCollectionViewAlignmentLayout.h"

@interface MMCollectionViewAlignmentLayout ()
@property (nonatomic, strong) NSMutableDictionary *cacheAttr;
@end
@implementation MMCollectionViewAlignmentLayout {
    CGFloat lineCellWidthSum;
}

- (instancetype)init {
   if (self = [super init]) {
       _cacheAttr = [NSMutableDictionary dictionary];
    }
    return self;
}

- (instancetype)initWithAlignType:(MMCollectionAlignType)align {
    if (self = [super init]) {
        self.alignType = align;
        _cacheAttr = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)prepareLayout {
    [super prepareLayout];
    NSLog(@"prepareLayout");
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *layoutAttributes = [super layoutAttributesForElementsInRect:rect];
    //用来临时存放一行的Cell数组
       NSMutableArray * layoutAttributesTemp = [[NSMutableArray alloc]init];
       for (NSUInteger index = 0; index < layoutAttributes.count ; index++) {
           // 当前cell的位置信息
           UICollectionViewLayoutAttributes *currentAttr = layoutAttributes[index];
           UICollectionViewLayoutAttributes *previousAttr = index == 0 ? nil : layoutAttributes[index - 1]; // 上一个cell 的位置信
           UICollectionViewLayoutAttributes *nextAttr = index + 1 == layoutAttributes.count ?
           nil : layoutAttributes[index + 1];//下一个cell 位置信息
           //加入临时数组
           [layoutAttributesTemp addObject:currentAttr];
           lineCellWidthSum += currentAttr.frame.size.width;
           
           CGFloat previousY = previousAttr == nil ? 0 : CGRectGetMaxY(previousAttr.frame);
           CGFloat currentY = CGRectGetMaxY(currentAttr.frame);
           CGFloat nextY = nextAttr == nil ? 0 : CGRectGetMaxY(nextAttr.frame);
           //如果当前cell是单独一行
           if (currentY != previousY && currentY != nextY){
               if ([currentAttr.representedElementKind isEqualToString:UICollectionElementKindSectionHeader]) {
                   [layoutAttributesTemp removeAllObjects];
                   lineCellWidthSum = 0.0;
               } else if ([currentAttr.representedElementKind isEqualToString:UICollectionElementKindSectionFooter]){
                   [layoutAttributesTemp removeAllObjects];
                   lineCellWidthSum = 0.0;
               } else {
                   [self resetItemFrameWithAttributesArr:layoutAttributesTemp];
               }
           } else if( currentY != nextY) { //如果下一个cell在本行，这开始调整Frame位置
               [self resetItemFrameWithAttributesArr:layoutAttributesTemp];
           }
           if (index == 48) {
//               [layoutAttributes addObject:[self layoutAttributesForDecorationViewOfKind:@"MMCollectionDecorationView" atIndexPath:[NSIndexPath indexPathForRow:48 inSection:0]]];
           }
       }
       return layoutAttributes;
}
- (void)resetItemFrameWithAttributesArr:(NSMutableArray *)attributesArr {
    CGFloat nowWidth = 0.0;
    switch (self.alignType) {
        case MMCollectionAlignLeft:
            nowWidth = self.sectionInset.left;
            for (UICollectionViewLayoutAttributes * attributes in attributesArr) {
                CGRect nowFrame = attributes.frame;
                nowFrame.origin.x = nowWidth;
                attributes.frame = nowFrame;
                nowWidth += nowFrame.size.width + self.minimumInteritemSpacing;
            }
//            lineCellWidthSum = 0.0;
//            [attributesArr removeAllObjects];
            break;
            
        case MMCollectionAlignCenter:
            nowWidth = (self.collectionView.frame.size.width - lineCellWidthSum - ((attributesArr.count - 1) * self.minimumInteritemSpacing)) / 2;
            for (UICollectionViewLayoutAttributes * attributes in attributesArr) {
                CGRect nowFrame = attributes.frame;
                nowFrame.origin.x = nowWidth;
                attributes.frame = nowFrame;
                nowWidth += nowFrame.size.width + self.minimumInteritemSpacing;
            }
//            lineCellWidthSum = 0.0;
//            [attributesArr removeAllObjects];
            break;
            
        case MMCollectionAlignRight:
            nowWidth = self.collectionView.frame.size.width - self.sectionInset.right;
            for (NSInteger index = attributesArr.count - 1 ; index >= 0 ; index-- ) {
                UICollectionViewLayoutAttributes * attributes = attributesArr[index];
                CGRect nowFrame = attributes.frame;
                nowFrame.origin.x = nowWidth - nowFrame.size.width;
                attributes.frame = nowFrame;
                nowWidth = nowWidth - nowFrame.size.width - self.minimumInteritemSpacing;
            }
            
            break;
    }
    lineCellWidthSum = 0.0;
    [attributesArr removeAllObjects];
}


/// section View 布局
- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = self.collectionView.width - self.collectionView.contentInset.left - self.collectionView.contentInset.right;
    UICollectionViewLayoutAttributes* att = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:elementKind withIndexPath:indexPath];
    att.frame = CGRectMake(0, (125*indexPath.section)/2.0, width, 125);
    att.zIndex = -1;
    
    return att;
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return  nil;
}
- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    return  nil;
}


- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return false;
}

- (UICollectionViewLayoutInvalidationContext *)invalidationContextForBoundsChange:(CGRect)newBounds API_AVAILABLE(ios(7.0)) {
    return  nil;
}

@end
