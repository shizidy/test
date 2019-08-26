//
//  UIImage+extend.h
//  test
//
//  Created by wdyzmx on 2018/5/26.
//  Copyright © 2018年 wdyzmx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(extend)
/**
 高效为图片切圆角 image

 @param size 区域大小
 @param radius 圆角半径
 @return 圆角图片
 */
-(UIImage *)drawImageWithimageSize:(CGSize)size cornerRadius:(CGFloat)radius;
/**
 高效绘制纯色图片 image

 @param size 区域大小
 @param color 图片颜色
 @param radius 半径
 @return 返回纯色图片
 */
-(UIImage *)drawPureColorImageWithimageSize:(CGSize)size color:(UIColor *)color cornerRadius:(CGFloat)radius;
@end
