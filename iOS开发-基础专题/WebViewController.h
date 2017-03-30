//
//  WebViewController.h
//  iOS开发-基础专题
//
//  Created by 宇玄丶 on 2017/3/30.
//  Copyright © 2017年 阡陌科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>
//网页链接
@property(nonatomic,copy)NSString *urlStr;
//本地文件路径
@property(nonatomic,copy)NSString *filePath;
//html内容
@property(nonatomic,copy)NSString *content;
@end
