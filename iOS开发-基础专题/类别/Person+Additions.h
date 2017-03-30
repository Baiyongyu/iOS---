//
//  Person+Additions.h
//  iOS开发-基础专题
//
//  Created by 宇玄丶 on 2017/3/30.
//  Copyright © 2017年 阡陌科技. All rights reserved.
//

#import "Person.h"

//1、在创建类的时候，我们会引入Foundation框架，而类别是引入原有类的头文件。
//2、在创建类的时候，父类的地方被“(类别名)”替代了。
//（创建类别的过程，就是为Person类添加一些方法，这些方法在Additions文件中，所以实现了类别能够为某一个类添加方法而不会影响子类的功能）

@interface Person (Additions)
//添加方法
- (void)eat;
@end
