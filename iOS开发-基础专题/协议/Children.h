//
//  Children.h
//  iOS开发-基础专题
//
//  Created by 宇玄丶 on 2017/3/30.
//  Copyright © 2017年 阡陌科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
    @protocol是定义协议的关键字，告诉编译器，要开始声明协议了。
    ChildrenDelegate是协议的名字，规范命名为：类名+Delegate。
    <NSObject>是一个协议，其中提供了很多方法供我们使用，通过main.m中代码的解释我们会看到服从这个协议的好处。（协议用“<>”）
 */

@protocol ChildrenDelegate <NSObject> //协议声明
//在协议中，有几个方法的修饰词供我们使用：
//@required(表示以下方法必须实现)
//@optional(表示以下方法可以不实现)

- (void)eat;
@end

@interface Children : NSObject
/**
    @property是定义属性的关键字。
    nonatomic表明这个属性是非原子性的，加快了运行效率;weak是弱引用，是使用协议时用到的属性。
    id：前面提到，可以表示任何数据类型，使用id 的原因是无法确定谁会成为这个代理的实现方。
    <ChildrenDelegate>表明这个属性方法和这个协议相关联。
    delegete：是代理属性名(代理属性名的命名也是有潜规则的，一般命名为delegate，表明这是一个代理属性。还有一个原因就是因为Foundation框架中的代理属性也是这么命名的，所以我们为了让自己变得专业，也要和专业开发人员学习。如果一个类中还需要一个代理，就命名为dataSource)，一般一个类最多也就有两个协议。
 */
@property(nonatomic,weak)id<ChildrenDelegate>delegete;
@end
