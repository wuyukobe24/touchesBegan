//
//  ViewController.m
//  触屏拖动和点击
//
//  Created by WangXueqi on 2017/12/14.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "ViewController.h"
#import "VCButton.h"

@interface ViewController ()
@property(nonatomic,strong) UIImageView *image;
@property(nonatomic,strong) VCButton * button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //触摸图片 拖动 停止
    [self.view addSubview:self.image];
    //点击按钮
    [self.view addSubview:self.button];
}

- (VCButton *)button {
    
    if (!_button) {
        _button = [VCButton buttonFrame:CGRectMake(0, 0, 60, 60) image:@"anv_xinjian"];
        [_button setCenter:CGPointMake(self.view.frame.size.width/2, 150)];
    }
    return _button;
}

- (UIImageView *)image {
    
    if (!_image) {
        _image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 62, 62)];
        _image.center = self.view.center;
        _image.image = [UIImage imageNamed:@"anv_xinjian"];
        _image.tag = 100;
        [self.view addSubview:_image];
    }
    return _image;
}

//触摸图片
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch  locationInView:self.view];
    NSLog(@"startPoint x = %lf y = %lf",point.x,point.y);
}

//移动图片
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    UIImageView *view1 = (UIImageView*)[self.view  viewWithTag:100];
    CGPoint point = [touch  locationInView:self.view];
    view1.center = point;
    NSLog(@"movePoint x = %lf y = %lf",point.x,point.y);
}

//停止移动
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch  locationInView:self.view];
    NSLog(@"endPoint x = %lf y = %lf",point.x,point.y);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
