//
//  VCButton.m
//  触屏拖动和点击
//
//  Created by WangXueqi on 2017/12/14.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "VCButton.h"

@implementation VCButton

+ (VCButton *)buttonFrame:(CGRect)frame image:(NSString *)image {
    
    VCButton * button = [VCButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button setFrame:frame];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    return button;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    NSLog(@"hitTest x = %lf y = %lf",point.x,point.y);
    //将当前触摸点转换坐标系，转换到发布按钮的身上，生成一个新的点
    CGPoint newPoint = [self convertPoint:point toView:self];
    if ([self pointInside:newPoint withEvent:event]) {
        NSLog(@"按钮内部");
    }else{
        NSLog(@"按钮外部");
    }
    return [super hitTest:point withEvent:event];
}

@end
