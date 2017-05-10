//
//  CategoriesViewController.m
//  iOS开发-基础专题
//
//  Created by 宇玄丶 on 2017/3/30.
//  Copyright © 2017年 阡陌科技. All rights reserved.
//


// 类别，别名：扩展类、类目。
// 意思是：在现有类的基础上为该类增添一些新的方法(注意：只能是方法，不能添加属性)，如果类别中的方法和现有类中的方法相同，就覆盖原有方法。

// 类别的用途

// 简单的说，就是如果我们想在一个类中增加一些可供外界调用的方法，但是又不想影响它的子类，我们就要用类别。类别能够在原有类的基础上添加新的方法，而且还不会让子类继承。这也是类别的优点所在。

// 类别和类扩展的区别：
// 同：（类扩展和类别都可以为原有类添加新的方法）。
// 异：（通过类扩展添加的方法外界无法调用。而类别可以；类扩展能添加属性，而类别只能添加方法）。

#import "CategoriesViewController.h"
#import "Person.h"
#import "Person+Additions.h"

#import "ProtocolViewController.h"

@interface CategoriesViewController ()

@end

@implementation CategoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    Person *person = [[Person alloc] init];
    person.name = @"iOS";
    person.age = 10;
    [person run];
    //调用类别中增加的eat方法
    [person eat];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    ProtocolViewController *protoVC = [[ProtocolViewController alloc] init];
    [self.navigationController pushViewController:protoVC animated:YES];
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
