//
//  Nanny.m
//  iOS开发-基础专题
//
//  Created by 宇玄丶 on 2017/3/30.
//  Copyright © 2017年 阡陌科技. All rights reserved.
//

#import "Nanny.h"

@implementation Nanny

// 那么，问题就来了， eat方法没有在Nanny.h接口文件中声明，只是在.m文件中做了实现。为什么外界能调用呢？

// 这和协议有关系，一旦某个类服从了某个协议，那么该类就需要实现协议中规定必须实现的方法。而这些方法可以通过［协议生成方.delegate 方法］的方式调用，

- (void)eat {
    NSLog(@"the nanny is taking care of the child eating something!");
}

@end
