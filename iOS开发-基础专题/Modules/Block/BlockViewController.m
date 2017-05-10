//
//  BlockViewController.m
//  iOS开发-基础专题
//
//  Created by 宇玄丶 on 2017/3/30.
//  Copyright © 2017年 阡陌科技. All rights reserved.
//

// 简单的理解block代码块的作用就和C语言的函数的作用类似，
// 就是将能够实现某种特定功能的一些代码包裹起来，留出必要的接口（就是参数），供外界调用。

#import "BlockViewController.h"

@interface BlockViewController ()
@property(nonatomic,copy)NSString *str;
@end

@implementation BlockViewController

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if (self.myBlock) {
        self.myBlock(self.str);
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    self.title = self.navTitle;
    
    // ---------------------- ---------------------- ---------------------- ----------------------
    /**
        block的声明
        第一个void是代码块的返回值类型，
        (^helloWorld)：“^”是block代码块的标志，无实际意义。helloWorld是block代码块的名称，必须要用小括号扩起来。
        第二个void是代码块的参数，如果需要有参数，语法是：（int，……）或（int i，……）都可以；如果不需要参数，可以采用：（）或（void）但是不能连括号都不写。
     */
    void (^helloWorld)(void);
    
    /**
        block代码块的实现。
        在对代码块实现的时候，“^”是必须存在的，（void）中需要写的是当代码块的参数。
        有参数时，在这里必须写上具体的每个参数名，如果没有参数，可以写成: （void）或（）或干脆省略都可以。
        后边大括号中的代码表示对helloWorld代码块的具体实现代码。
     */
    
    helloWorld = ^(void){
        // 在使用代码块的时候，对于全局变量，在块内是完全可操作的。
        // 但是对于局部变量来说，在块内只能使用不能更改。
        NSLog(@"Hello World!");
    };
    // （提示：代码块的声明和实现可以写在一起）
    
    // 代码块的调用和C语言的函数调用相同。通过：“代码块名（参数）”的方式。
    helloWorld();


    // ---------------------- ---------------------- ---------------------- ----------------------
    // 如果试图在块内更改局部变量的值，程序会报错，解决的方案是在声明局部变量时添加__block关键字（注意是两个“_”）：
    __block int i = 10;
    void(^block)() = ^{
        NSLog(@"The i is :%d",i);
        i++;
    };
    block();
    self.str = [NSString stringWithFormat:@"%d", i];
    NSLog(@"The i is :%d",i);
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
