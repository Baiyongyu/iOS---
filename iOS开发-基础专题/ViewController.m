//
//  ViewController.m
//  iOS开发-基础专题
//
//  Created by 宇玄丶 on 2017/3/30.
//  Copyright © 2017年 阡陌科技. All rights reserved.
//

#import "ViewController.h"
#import "WaterCollectionViewCell.h"
#import "WaterfallLayout.h"
#import "WaterImageModel.h"

#define numberOfItems 12

@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegate,WaterfallLayoutDelegate>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray<WaterImageModel *> *images;

@property(nonatomic,strong)NSMutableArray*dataArray;
@property(nonatomic,strong)NSMutableArray*itemHeights;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"iOS开发-基础";
    [self layoutSubview];
}

- (void)layoutSubview {
    // 创建瀑布流布局
    WaterfallLayout *waterfall = [WaterfallLayout waterFallLayoutWithColumnCount:2];
    // 设置间距
    [waterfall setColumnSpacing:10 rowSpacing:10 sectionInset:UIEdgeInsetsMake(10, 10, 10, 10)];
    // 设置代理，实现代理方法
    waterfall.delegate = self;
    
    
    // 设置block 图片的高度
    [waterfall setItemHeightBlock:^CGFloat(CGFloat itemWidth, NSIndexPath *indexPath) {
        //根据图片的原始尺寸，及显示宽度，等比例缩放来计算显示高度
        WaterImageModel *image = self.images[indexPath.item];
        return image.imageH / image.imageW * itemWidth;
    }];
    
    
    //创建collectionView
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:waterfall];
    self.collectionView.backgroundColor = [UIColor redColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"WaterCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.view addSubview:self.collectionView];
    
    [self loadData];
}

- (void)loadData {
    self.dataArray = [NSMutableArray arrayWithCapacity:numberOfItems];
    self.itemHeights = [NSMutableArray arrayWithCapacity:numberOfItems];
    
    for (int i = 0; i < numberOfItems; i++) {
        CGFloat height = 200+arc4random_uniform(200);
        
        [self.itemHeights addObject:@(height)];
    }
}

//根据item的宽度与indexPath计算每一个item的高度
- (CGFloat)waterfallLayout:(WaterfallLayout *)waterfallLayout itemHeightForWidth:(CGFloat)itemWidth atIndexPath:(NSIndexPath *)indexPath {
    //根据图片的原始尺寸，及显示宽度，等比例缩放来计算显示高度
    WaterImageModel *image = self.images[indexPath.item];
    return image.imageH / image.imageW * itemWidth;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return numberOfItems;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WaterCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpeg",indexPath.row+1]];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
