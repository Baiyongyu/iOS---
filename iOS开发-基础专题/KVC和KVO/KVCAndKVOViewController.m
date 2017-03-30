//
//  KVCAndKVOViewController.m
//  iOS开发-基础专题
//
//  Created by 宇玄丶 on 2017/3/30.
//  Copyright © 2017年 阡陌科技. All rights reserved.
//


// KVC:
// 之前在对类中的属性进行调用时，往往通过点语法直接就能调用。
// 现在来学习一种间接调用对象属性的方法，称它为“KVC”(全称：Key－Value－Coding，键值编码)。

// KVC不同于点语法，它是一种间接调取对象属性的方法。它的实现方式是通过字符串来自动找到要更改的对象属性。




// KVO:
// 和KVC长得很像的，还有一个KVO(全称：Key-Value-Observer，键值观察(或键值监听))
// 在编程过程中，有时需要对对象的某个或某些属性进行监听，通过对象属性的变化采取相应的对策。



#import "KVCAndKVOViewController.h"
#import "Person.h"

@interface KVCAndKVOViewController ()

@end

@implementation KVCAndKVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    Person *person = [[Person alloc] init];
    
    // 在使用键值编码对声明的对象进行操作时，Key的值要求和对象中的属性名相同，只有这样才能对对象属性设置成功，否则程序会报告找不到你设置的key，程序出错。
    [person setValue:@"曹群" forKey:@"name"];
    [person setValue:[NSNumber numberWithInt:18] forKey:@"age"];
    NSLog(@"The person's name is :%@, and age is :%d",person.name,person.age);
    /**
        可以看到，在对person对象初始化后，通过setValue:forKey:的方式给person对象的name、age、sex属性分别"赋值"。
        此方法的使用和字典中的setValue:forKey:方法类似，Value和Key必须是对象
        (两个方法完全没有关系，通过深入框架，可以看到，setValue:forKey:属于NSKeyValueCoding.h接口中提供的方法)。
     */
    
    
    // 和字典类似，NSKeyValueCoding.h不仅提供了setValue:forKey:的方法对对象中的属性进行设置，
    // 还可以通过键值编码的方式来间接地获取到对象中的方法值。可以使用valueForKey:的方法通过key的值来"获取"对应的属性值：
    NSLog(@"The person's name is :%@,and age is :%d",
          [person valueForKey:@"name"],[[person valueForKey:@"age"] intValue]);
    
    // --------------------------------------------------------
//    除了上边介绍到的KVC提供的方法，NSKeyValueCoding.h接口中还提供了一个方法：
    /**
        “用字典通过key设置value”
        这同样是一个间接给对象赋值的方法，只不过这个方法需要传入的参数是一个字典。
     */
//    -(void)setValuesForKeysWithDictionary:(NSDictionary<NSString *, id> *)keyedValues;
    
    
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    
    [dic setValue:@"柏永宇" forKey:@"name"];
    [dic setValue:[NSNumber numberWithInt:18] forKey:@"age"];
    [person setValuesForKeysWithDictionary:dic];
    NSLog(@"The person's name is :%@,and age is :%d",
          [person valueForKey:@"name"],[[person valueForKey:@"age"] intValue]);
    
    
    // 对于第一种方法，可以在平常方法中使用。而第二种方法，当你从外界文件中读入字典 对 对象属性进行赋值时，可以极大地减少代码的工作量，提高开发效率。
    
    
    // ------------------------------- KVO -------------------------
    person.name = @"A";
    person.age = 17;
    
    
    /**
        给person这个对象添加一个观察者这个观察者就是自己。那自己观察自己什么呢？要时刻监听name属性值和age属性的变化。
        options参数的设置：一但监听的这个name属性值发生了变化，那么你要变化之前的值还是变化之后的值或者是其他类型的值(可以选择多种，可以进入枚举中查看)
        context可以用来传递数据，没有就设置为nil即可。
     */
    
    [person addObserver:person forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    [person addObserver:person forKeyPath:@"age" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    // 通过直接赋值的方式将person对象的属性的值做了改变。
    // 这一步的目的就是要判断监听者能不能监听到数据。
    person.name = @"B";
    person.age = 20;
    
    // 最后一定要移除观察者。（对移除的顺序不做要求）
//    [person removeObserver:person forKeyPath:@"name" context:nil];
//    [person removeObserver:person forKeyPath:@"age" context:nil];
    
    
    
    // ------------------------------- 总结 -------------------------
    //    KVO和通知的关系
    //    相同点：
    //    同属于监听，都能够传递数据。
    //    在程序结束时，都需要移除观察者。
    //
    //    不同点：
    //    KVO比通知更厉害的是，它不仅能够实现监听，同时还能监听对象属性的改变，这是使用通知办不到的。
}

- (void)dealloc {
    // 最后一定要移除观察者。（对移除的顺序不做要求）
    [self removeObserver:self forKeyPath:@"name" context:nil];
    [self removeObserver:self forKeyPath:@"age" context:nil];
    
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
