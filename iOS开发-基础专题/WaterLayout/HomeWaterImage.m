//
//  XRImage.m
//  iOS开发-基础专题
//
//  Created by 宇玄丶 on 2017/3/30.
//  Copyright © 2017年 阡陌科技. All rights reserved.
//

#import "HomeWaterImage.h"

@implementation HomeWaterImage
+ (instancetype)imageWithImageDic:(NSDictionary *)imageDic {
    HomeWaterImage *image = [[HomeWaterImage alloc] init];
    image.imageURL = [NSURL URLWithString:imageDic[@"img"]];
    image.imageW = [imageDic[@"w"] floatValue];
    image.imageH = [imageDic[@"h"] floatValue];
    return image;
}
@end
