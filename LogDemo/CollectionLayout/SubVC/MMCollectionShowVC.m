//
//  MMCollectionShowVC.m
//  LogDemo
//
//  Created by mumu on 2020/1/15.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMCollectionShowVC.h"
#import "MMSingleLabelCVCell.h"
#import "MMCollectionViewAlignmentLayout.h"

@interface MMCollectionShowVC () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, copy) NSArray *listArray;
@end

@implementation MMCollectionShowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.frame = CGRectMake(10, 100, ScreenWidth - 20, 300);
    [self.view addSubview:self.collectionView];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.collectionView.collectionViewLayout invalidateLayout];
//    [self.collectionView setContentOffset:CGPointMake(0, 500) animated:true];
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:30 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:true];
}

#pragma mark - collectionView
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.listArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MMSingleLabelCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MMSingleLabelCVCellIDStr forIndexPath:indexPath];
    cell.contentText = self.listArray[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *title = self.listArray[indexPath.row];
    CGFloat width = [title boundingRectWithSize:CGSizeZero options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]} context:nil].size.width;
    return CGSizeMake(ceil(width) + 16, 30);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"joeLog->EndDecelerating");
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {

//    NSLog(@"joeLog->ContentOffset=%@",[NSValue valueWithCGPoint:*targetContentOffset]);
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"joeLog->willDecelerate=%d",decelerate);
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    NSLog(@"joeLog->EndScrollingAnimation");
}

#pragma mark - getter && setter
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        MMCollectionViewAlignmentLayout *layout = [[MMCollectionViewAlignmentLayout alloc] initWithAlignType:MMCollectionAlignCenter];
//        layout.sectionInset = UIEdgeInsetsMake(50, 50, 50, 50);
        UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout: layout];
        
        collection.delegate = self;
        collection.dataSource = self;
        collection.pagingEnabled = false;
        collection.backgroundColor = UIColor.whiteColor;
        [collection registerNib:[UINib nibWithNibName:MMSingleLabelCVCellIDStr bundle:nil] forCellWithReuseIdentifier:MMSingleLabelCVCellIDStr];
        _collectionView = collection;
    }
    return _collectionView;
}

- (NSArray *)listArray {
    if (!_listArray) {
        NSMutableArray *tmp = [NSMutableArray array];
        NSArray *titile = @[@"泰国1个字",@"曼谷哈哈",@"西藏布达拉宫s",@"西藏不打啦s",@"西藏不",@"西藏"];
        for (int i = 0; i < 1000; i++) {
            int random = arc4random() % 6;
            NSString *obj = [NSString stringWithFormat:@"%@%d",titile[random],i];
            [tmp addObject:obj];
        }
        _listArray = [tmp copy];
    }
    return _listArray;
}

@end
