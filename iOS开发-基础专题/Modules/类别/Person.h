//
//  Person.h
//  iOS开发-基础专题
//
//  Created by 宇玄丶 on 2017/3/30.
//  Copyright © 2017年 阡陌科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic,copy)NSString *name;
@property (nonatomic,assign)int age;

- (void)run;

@end
