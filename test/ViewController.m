//
//  ViewController.m
//  test
//
//  Created by wdyzmx on 2018/5/3.
//  Copyright © 2018年 wdyzmx. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import "DrawView.h"
#import <Masonry.h>
#import "UIImage+extend.h"
#define kscreenWidth [UIScreen mainScreen].bounds.size.width
#define kscreenHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()
@property (nonatomic, strong) UILabel *textLabel;
@end
@implementation ViewController
//-(void)loadView{//此方法必须为self.view指定一个view
//    UIView *bgView = [[UIView alloc] init];
//    self.view = bgView;
//    bgView.backgroundColor = [UIColor orangeColor];
//    NSLog(@"loadView");
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIView *test = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    test.backgroundColor = [UIColor orangeColor];
//    [self.view addSubview:test];
//    NSLog(@"%f", test.frame.origin.x);
//    test.frame = CGRectMake(50, 0, 100, 100);
//    NSLog(@"%f", test.layer.frame.origin.x);
//    test.layer.frame = CGRectMake(100, 100, 100, 100);
//    NSLog(@"%f", test.frame.origin.x);
//    NSLog(@"%f", test.layer.frame.origin.x);
//    prin();
//    NSArray *array = @[@"1", @"2", @"-4", @"4", @"10", @"-3", @"4", @"-5", @"1"];
//    [self getMaxArrayWithoriginArray:array];
//    [self quicksortArrayWithoriginArray:[NSMutableArray arrayWithArray:array] leftIndex:0 rightIndex:array.count-1];
//    [self gcdDemo1];
//    [self semaphore];
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    UIImage *oldImage = [UIImage imageNamed:@"timg.jpeg"];
//    imageView.image = [oldImage drawImageWithimageSize:CGSizeMake(100, 100) cornerRadius:10];
//    [self.view addSubview:imageView];
//    imageView.backgroundColor = [UIColor grayColor];
//    DrawView *drawView = [[DrawView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
//    [drawView setNeedsDisplay];//需要重新再绘制是调用，开始是系统自动调用一次
//    [self.view addSubview:drawView];
    
    
    self.textLabel = [[UILabel alloc] init];
//    [self.view addSubview:self.textLabel];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(10, 10, 500, 200));
        make.center.equalTo(self.view);
         //设置宽度小于等于200
        make.width.lessThanOrEqualTo(@200);
         //设置高度大于等于10
        make.height.greaterThanOrEqualTo(@(10));
    }];
    
//    self.textLabel.text = @"这是测试的字符串。能看到1、2、3个步骤，第一步当然是上传照片了，要上传正面近照哦。上传后，网站会自动识别你的面部，如果觉得识别的不准，你还可以手动修改一下。左边可以看到16项修改参数，最上面是整体修改，你也可以根据自己的意愿单独修改某项，将鼠标放到选项上面，右边的预览图会显示相应的位置。";
//    self.textLabel.numberOfLines = 0;
    self.textLabel.backgroundColor = [UIColor orangeColor];
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark ========== 找到数组中和最大的连续子数组 ==========
-(NSArray *)getMaxArrayWithoriginArray:(NSArray *)array {
    NSMutableArray *marray = [NSMutableArray arrayWithArray:array];
    int sum = 0;
    int maxsum = 0;
    int start = 0;
    int end = 0;
    for (int i = 0; i < marray.count; i++) {
        sum += [marray[i] intValue];
        if (sum < 0) {
            sum = 0;
            start = i;
        }
        if (sum > maxsum) {
            maxsum = sum;
            end = i;
        }
    }
    NSLog(@"%d", maxsum);
    if (end + 1 < array.count) {//先删除后面的数组
        [marray removeObjectsInRange:NSMakeRange(end + 1, array.count - end - 1)];
    }
    [marray removeObjectsInRange:NSMakeRange(0, start + 1)];
    
//    NSLog(@"%@", marray);
    return marray;
}
#pragma mark ========== 冒泡排序法 ==========
-(void)maopaoSortArray {
    NSMutableArray *marray = [NSMutableArray arrayWithArray:@[@1, @2, @8, @4, @10, @23, @0]];
    for (int i = 0; i<marray.count - 1; i++) {
        for (int j = 0; j<marray.count - 1 - i; j++) {
            if (marray[j] < marray[j+1]) {
                [marray exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
        }
    }
    NSLog(@"%@", marray);
    
}
#pragma mark ========== 选择排序 ==========
-(void)xuanzeSortArray {
    NSMutableArray *marray = [NSMutableArray arrayWithArray:@[@1, @2, @8, @4, @10, @23, @0]];
    for (int i = 0; i < marray.count - 1; i++) {
        for (int j = i + 1; j < marray.count; j++) {
            if (marray[i] < marray[j]) {
                [marray exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
        }
    }
    NSLog(@"%@", marray);
}
#pragma mark ========== 快速排序法 ==========
-(void)quicksortArrayWithoriginArray:(NSMutableArray *)marray leftIndex:(NSInteger)leftIndex rightIndex:(NSInteger)rightIndex {
    if (leftIndex >= rightIndex) {
        NSLog(@"%@", marray);
        return;
    }
    NSInteger i = leftIndex;
    NSInteger j = rightIndex;
    NSInteger key = [marray[i] integerValue];
    
    while (i < j) {
        while (i < j && [marray[j] integerValue] >= key) {//从右边找到比key小的
            j--;
        }
        marray[i] = marray[j];
        
        while (i < j && [marray[i] integerValue] <= key) {//从左边找到比key大的
            i++;
        }
        marray[j] = marray[i];
    }
    marray[i] = [NSString stringWithFormat:@"%ld", key];//把基准数放在正确的位置
    //递归
    [self quicksortArrayWithoriginArray:marray leftIndex:leftIndex rightIndex:i-1];//排序基准数左边的
    [self quicksortArrayWithoriginArray:marray leftIndex:i+1 rightIndex:rightIndex];//排序基准数右边的
}
#pragma mark ========== 去重 ==========
-(void)quchongMethod {//去除字符串不相邻的重复字符
    NSMutableString *str1 = [[NSMutableString alloc] initWithString:@"aaadfghaeectem"];
    for (int i = 0; i < str1.length - 1; i++) {
        for (int j = i + 1; j < str1.length ; j++) {
            // 由于字符的特殊性  无法使用 字符串 isEqualToString 进行比较 只能转化为ASCII 值进行比较  所以 需要加 unsigined 修饰
            unsigned char a = [str1 characterAtIndex:i];
            unsigned char b = [str1 characterAtIndex:j];
            if (a == b) {
                if (j - i > 1) {
                    // NSRange:  截取字符串   {j, 1} j: 第一个字符开始  1: 截取几个字符
                    [str1 deleteCharactersInRange:NSMakeRange(j, 1)];
                    j = i--;
                }
            }
        }
    }
    NSLog(@"------ %@-------", str1);
}
- (void)gcdDemo1 {
    // 1. 队列
    dispatch_queue_t queue = dispatch_queue_create("com.itheima.queue", DISPATCH_QUEUE_SERIAL);
    // 2. 执行任务
    for (int i = 0; i < 10; ++i) {
        NSLog(@"--- %d", i);
        
        dispatch_async(queue, ^{
            NSLog(@"%@ - %d", [NSThread currentThread], i);
        });
    }
    NSLog(@"come here");
}
-(void)semaphore {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    for (int i=0; i<5; i++) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSLog(@"%@==%d", [NSThread currentThread], i);
            dispatch_semaphore_signal(semaphore);
        });
        NSLog(@"%d", i);
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    }
}
#pragma mark ========== label避免离屏渲染 ==========
-(void)createLabel {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(kscreenWidth/2-100/2, kscreenHeight/2-50/2, 100, 50)];
    label.layer.backgroundColor = [[UIColor orangeColor] CGColor];//这样设置背景颜色切圆角是不用使用maskTobounds 避免离屏渲染
    label.layer.cornerRadius = 10;
    label.clipsToBounds = YES;
    label.text = @"拍照";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}
#pragma mark ========== textfield避免离屏渲染 ==========
-(void)createTextfield{
    // 天然支持设置圆角边框
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(kscreenWidth/2-100/2, kscreenHeight/2-50/2, 100, 50)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    // 与 UIView 类似
    UITextField *textField2 = [[UITextField alloc] initWithFrame:CGRectMake(kscreenWidth/2-100/2, kscreenHeight/2-50/2, 100, 50)];
    textField2.layer.cornerRadius = 10;//与UIView类似，不必设置maskTobounds
    //    textField2.layer.backgroundColor = [[UIColor grayColor] CGColor];
    textField2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:textField];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
