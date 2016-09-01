//
//  ViewController.m
//  UICollectionViewDemo
//
//  Created by Jentle on 15/7/27.
//  Copyright (c) 2015年 Jentle.zhi. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ViewController

#pragma mark - getter
//懒加载，getter
- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {

        
        /**
         流式布局
         */
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        //item大小
        layout.itemSize = CGSizeMake(
                                     170, 150);
        //上下两个item的空隙
        layout.minimumLineSpacing = 10;
        //左右2个item的空隙
        layout.minimumInteritemSpacing = 10;
        //上下左右的空隙
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        //滚动方向
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        
        //创建一个collectionView
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self.view addSubview:_collectionView];
    }
    
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //collectionView默认背景是黑色
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    //注册cell
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    //注册xib
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"Cell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
    
}

#pragma mark - UICollectionViewDelegate
/**
 有多少组
 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

/**
 每组显示的item的个数
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     复用机制
     */
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor purpleColor];
    

    return cell;
}

#pragma mark - 段头视图和段尾视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //创建一个段头视图
    UICollectionReusableView *resuableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
    //背景颜色
    resuableView.backgroundColor = [UIColor orangeColor];
    
    return resuableView;
}

/**
 段头视图大小（默认CGSizeZero）
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(self.collectionView.frame.size.width, 70);
    
}

#if 0
//返回item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
#endif

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
