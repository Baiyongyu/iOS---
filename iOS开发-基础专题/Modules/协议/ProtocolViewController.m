//
//  ProtocolViewController.m
//  iOS开发-基础专题
//
//  Created by 宇玄丶 on 2017/3/30.
//  Copyright © 2017年 阡陌科技. All rights reserved.
//


// 协议和我们生活中的含义大同小异，例如：有一个孩子，由于年龄很小，无法照顾自己，所以不得不委托他人来照顾他的饮食起居。
// 从协议的角度分析上面的例子，孩子需要得到照顾，但是他自己办不了，只能让保姆照顾他。所以孩子是协议生成方，保姆是协议实现方。

// 从开发的角度上考虑，协议就是某类创建，其他类来帮其实现。



/**
    使用协议需要注意的点
 
    1、协议没有父类(协议可以服从多个(>=0)协议（一般服从NSObject协议）。
 
    (这里的NSObject是NSObject.h文件中的定义的一个协议，并不是NSObject这个类，
    如果有疑问，大家可以command点击进入NSObject这个协议，顺便了解一下这个协议中所包含的方法)
 
    2、协议中不能定义变量（属性），只能定义方法。
 
 */


#import "ProtocolViewController.h"
#import "Nanny.h"

@interface ProtocolViewController ()

@end

@implementation ProtocolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    // 声明了两个类的对象，这是为遵守协议做准备，由于代理声明方要确定代理实现方是哪个对象，所以要使用到之前使用到的代理属性。所以使用点语法来为代理属性进行赋值。
    Nanny *nanny = [[Nanny alloc] init];
    Children *child = [[Children alloc] init];
    // child.delegete其实就是nanny对象
    /**
        那么为什么不直接使用nanny呢？在简单程序中是可以的，如果在复杂的程序中，使用实现方对象的前提是你必须获得这个对象，往往费时费力。
        所以为了避免这种情况，一般使用上面这种方式，而且代码读起来非常清晰，易于理解。
     */
    child.delegete = nanny;
    /**
      respondsToSelector:方法：这个方法是NSObject协议中的方法，功能是判断代理实现方是否已经实现了代理中的某个方法。
      @selector():专门在调用方法时用到，
     */
    if ([child.delegete respondsToSelector:@selector(eat)]) {
        [child.delegete eat];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
