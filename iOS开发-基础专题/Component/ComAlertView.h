//
//  PWAlertView.h
//  iOS开发-基础专题
//
//  Created by 宇玄丶 on 2017/3/30.
//  Copyright © 2017年 阡陌科技. All rights reserved.
//

#import <UIKit/UIKit.h>
//点击按钮回调
typedef void(^AlertResult)(NSInteger index);

@interface ComAlertView : UIView

@property(nonatomic,copy) AlertResult resultIndex;

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message sureBtn:(NSString *)sureTitle cancleBtn:(NSString *)cancleTitle;

- (void)showAlertView;


@end
