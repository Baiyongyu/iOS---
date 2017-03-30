//
//  BlockViewController.h
//  iOS开发-基础专题
//
//  Created by 宇玄丶 on 2017/3/30.
//  Copyright © 2017年 阡陌科技. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MyBlock)(NSString *titleName);

@interface BlockViewController : UIViewController
// 传递属性
@property(nonatomic,copy)NSString *navTitle;
@property(nonatomic,copy)MyBlock myBlock;
@end
