//
//  WaterLayoutViewController.m
//  iOS开发-基础专题
//
//  Created by 宇玄丶 on 2017/3/30.
//  Copyright © 2017年 阡陌科技. All rights reserved.
//

#import "WaterLayoutViewController.h"

#import "WaterCollectionViewCell.h"
#import "WaterfallLayout.h"
#import "HomeWaterImage.h"
#import "WebViewController.h"
#import "CategoriesViewController.h"
#import "BlockViewController.h"

#define numberOfItems 19

@interface WaterLayoutViewController () <UICollectionViewDataSource,UICollectionViewDelegate,WaterfallLayoutDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray<HomeWaterImage *> *images;
@property(nonatomic,strong)NSMutableArray*dataArray;
@property(nonatomic,strong)NSMutableArray*itemHeights;
@property(nonatomic,strong)NSArray *titleArray;

@end

@implementation WaterLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"iOS开发-基础专题";
    [self layoutSubviews];
    [self loadData];
}

- (void)layoutSubviews {
    //创建瀑布流布局
    WaterfallLayout *waterfall = [WaterfallLayout waterFallLayoutWithColumnCount:2];
    //设置间距
    [waterfall setColumnSpacing:10 rowSpacing:10 sectionInset:UIEdgeInsetsMake(10, 10, 10, 10)];
    //设置代理，实现代理方法
    waterfall.delegate = self;
    
    //设置图片高度
    [waterfall setItemHeightBlock:^CGFloat(CGFloat itemWidth, NSIndexPath *indexPath) {
        //根据图片的原始尺寸，及显示宽度，等比例缩放来计算显示高度
        HomeWaterImage *image = self.images[indexPath.item];
        return image.imageH / image.imageW * itemWidth;
    }];
    
    //创建collectionView
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:waterfall];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"WaterCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.view addSubview:self.collectionView];
}

- (void)loadData {
    self.dataArray = [NSMutableArray arrayWithCapacity:numberOfItems];
    self.itemHeights = [NSMutableArray arrayWithCapacity:numberOfItems];
    
    for (int i = 0; i < numberOfItems; i++) {
        CGFloat height = 200+arc4random_uniform(200);
        [self.itemHeights addObject:@(height)];
    }
    
    
    self.titleArray = @[@"iOS介绍及开发环境",@"Objective-C—简介",@"Objective-C—类",@"Objective-C—Foundation",
                        @"Objective-C—类别与协议",@"Objective-C—block",@"Objective-C—通知",@"Objective-C—KVC与KVO",
                        @"UIKit介绍-控制器",@"控制器的生命周期",@"UIKit介绍-基础控件",@"界面布局",
                        @"Masonry的使用",@"UIKit介绍-列表",@"UIKit介绍-瀑布流",@"网络通信介绍",
                        @"AFNetworking的使用",@"数据存储介绍",@"iOS开发入门总结"];
}

//根据item的宽度与indexPath计算每一个item的高度
- (CGFloat)waterfallLayout:(WaterfallLayout *)waterfallLayout itemHeightForWidth:(CGFloat)itemWidth atIndexPath:(NSIndexPath *)indexPath {
    //根据图片的原始尺寸，显示宽度，等比例缩放来计算显示高度
    HomeWaterImage *image = self.images[indexPath.item];
    return image.imageH / image.imageW * itemWidth;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WaterCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
//    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpeg",indexPath.row+1]];
//    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    cell.imageURL = self.images[indexPath.item].imageURL;
    cell.titleLabel.text = self.titleArray[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WebViewController *webVC = [[WebViewController alloc] init];
    switch (indexPath.item) {
        case 0:
            webVC.urlStr = @"https://shimo.im/doc/jeyXLugt3lc2zBbV";
            [self.navigationController pushViewController:webVC animated:YES];
            break;
        case 1:
            webVC.urlStr = @"https://shimo.im/doc/TyrFaXAWersbQZyc";
            [self.navigationController pushViewController:webVC animated:YES];
            break;
        case 2:
            webVC.urlStr = @"https://shimo.im/doc/scOxJ3pYTfsEkrAi";
            [self.navigationController pushViewController:webVC animated:YES];
            break;
        case 3:
            webVC.urlStr = @"https://shimo.im/doc/a5gWSc1tV4YNmJNV";
            [self.navigationController pushViewController:webVC animated:YES];
            break;
        case 4:{
            CategoriesViewController *cateVC = [[CategoriesViewController alloc] init];
            [self.navigationController pushViewController:cateVC animated:YES];
            break;
        }
        case 5:{
            BlockViewController *blockVC = [[BlockViewController alloc] init];
            // 属性传值
            blockVC.navTitle = @"Objective-C—block";
            // block反向传值
            blockVC.myBlock = ^(NSString *titleName) {
                NSString *str ;
                str = titleName;
                NSLog(@"反向传值：=====%@",str);
            };
            [self.navigationController pushViewController:blockVC animated:YES];
            break;
        }
        default:
            break;
    }
}

- (NSMutableArray *)images {
    //从plist文件中取出字典数组，并封装成对象模型，存入模型数组中
    if (!_images) {
        _images = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"WaterList1.plist" ofType:nil];
        
        NSArray *imageDics = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *imageDic in imageDics) {
            HomeWaterImage *image = [HomeWaterImage imageWithImageDic:imageDic];
            [_images addObject:image];
        }
    }
    return _images;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
