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

@property (nonatomic, strong) UICollectionView * collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"111" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
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
