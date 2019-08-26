//
//  FirstViewController.m
//  test
//
//  Created by wdyzmx on 2018/5/10.
//  Copyright © 2018年 wdyzmx. All rights reserved.
//

#import "FirstViewController.h"
#import <Masonry.h>
@interface FirstViewController ()
@property (nonatomic, strong) UILabel *textLabel;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.textLabel = [[UILabel alloc] init];
    [self.view addSubview:self.textLabel];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        // 设置宽度小于等于200
        make.width.lessThanOrEqualTo(@200);
        // 设置高度大于等于10
        make.height.greaterThanOrEqualTo(@(10));
    }];
    
    self.textLabel.text = @"这是测试的字符串。能看到1、2、3个步骤，第一步当然是上传照片了，要上传正面近照哦。上传后，网站会自动识别你的面部，如果觉得识别的不准，你还可以手动修改一下。左边可以看到16项修改参数，最上面是整体修改，你也可以根据自己的意愿单独修改某项，将鼠标放到选项上面，右边的预览图会显示相应的位置。";
    self.textLabel.numberOfLines = 0;
    // Do any additional setup after loading the view.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self UITests];
}
-(void)UITests{
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
    NSLog(@"UI单元测试");
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
