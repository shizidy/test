//
//  UIImage+extend.m
//  test
//
//  Created by wdyzmx on 2018/5/26.
//  Copyright © 2018年 wdyzmx. All rights reserved.
//

#import "UIImage+extend.h"

@implementation UIImage(extend)
#pragma mark ========== UIImage高性能切圆角 ==========
-(UIImage *)drawImageWithimageSize:(CGSize)size cornerRadius:(CGFloat)radius{
    //申请一块特定大小的画布
    //    UIGraphicsBeginImageContext(size);
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    //UIBezierPath画图
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:size.height/2];
    //添加路径
    CGContextAddPath(UIGraphicsGetCurrentContext(), path.CGPath);
    //区域外失效
    CGContextClip(UIGraphicsGetCurrentContext());
//    [path addClip];
    //原图片
//    UIImage *oldImage = [UIImage imageNamed:imageName];
    [self drawInRect:rect];
    //得到新图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}
#pragma mark ========== UIImage纯色图片 ==========
-(UIImage *)drawPureColorImageWithimageSize:(CGSize)size color:(UIColor *)color cornerRadius:(CGFloat)radius{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIView *bgView = [[UIView alloc] initWithFrame:rect];
    bgView.layer.backgroundColor = [color CGColor];
    bgView.layer.cornerRadius = radius;
    //第一个参数 区域size 第二个参数 是否非透明 第三份参数 屏幕密度
    //申请画布
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [bgView.layer renderInContext:UIGraphicsGetCurrentContext()];//给予UIGraphicsGetCurrentContext()
    //获取绘制的image
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    return newImage;
}
@end
