//
//  ViewController.m
//  8.仿App Store轮播
//
//  Created by 梁森 on 2020/7/16.
//  Copyright © 2020 梁森. All rights reserved.
//

#import "ViewController.h"

#import "CustomFlowLayout.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSInteger index;
}
@property (nonatomic, strong) UICollectionView * collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.collectionView];
    
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:leftBtn];
    leftBtn.frame = CGRectMake(50, 450, 50, 30);
    [leftBtn setTitle:@"左" forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.backgroundColor = [UIColor whiteColor];
    UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:rightBtn];
    rightBtn.frame = CGRectMake(150, 450, 50, 30);
    [rightBtn setTitle:@"右" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.backgroundColor = [UIColor whiteColor];
    
    index = 0;
}

- (void)leftAction{
    if (index == 0) {
        return;
    }
    index --;
    CGFloat width = self.view.frame.size.width - 30;
    [self.collectionView setContentOffset:CGPointMake(width * index, 0) animated:YES];
}

- (void)rightAction{
    if (index == 2) {
        return;
    }
    index ++;
    CGFloat width = self.view.frame.size.width - 30;
    [self.collectionView setContentOffset:CGPointMake(width * index, 0) animated:YES];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"111" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%@   %f", NSStringFromCGPoint(scrollView.contentOffset), scrollView.frame.size.width);
}

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        CustomFlowLayout * layout = [[CustomFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 350) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = NO;
        _collectionView.decelerationRate = 1-0.0076;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"111"];
        _collectionView.backgroundColor = [UIColor greenColor];
    }
    return _collectionView;
}



@end
