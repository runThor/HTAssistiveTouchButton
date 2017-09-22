//
//  HTAssistiveTouchButton.m
//  HTAssistiveTouchButtonDemo
//
//  Created by chenghong on 2017/9/22.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "HTAssistiveTouchButton.h"

#define kScreenWidth    [UIScreen mainScreen].bounds.size.width
#define kScreenHeight   [UIScreen mainScreen].bounds.size.height

@interface HTAssistiveTouchButton ()

@property (nonatomic, assign) BOOL isMoving;  // button是否处于移动状态
@property (nonatomic, assign) CGPoint beginPosition;  // button触摸开始时的触摸点坐标
@property (nonatomic, assign) float offsetX;  // x坐标偏移量
@property (nonatomic, assign) float offsetY;  // y坐标偏移量

@end

@implementation HTAssistiveTouchButton

// 开始触摸按钮 
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    self.isMoving = NO;  // 开始触摸时为非移动状态
    
    UITouch *touch = [touches anyObject];
    self.beginPosition = [touch locationInView:self];  // 触摸开始点的坐标
}

// 按钮拖动事件
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    
    UITouch *touch = [touches anyObject];
    CGPoint currentPosition = [touch locationInView:self];  // 当前触摸点的坐标
    
    // 位置偏移量
    self.offsetX = currentPosition.x - self.beginPosition.x;
    self.offsetY = currentPosition.y - self.beginPosition.y;
    
    // 如果按钮偏移量很微小，视为没有移动
    if (self.offsetX > 1 || self.offsetX < -1 || self.offsetY > 1 || self.offsetY < -1) {
        self.isMoving = YES;
    }
    
    [self setCenter:CGPointMake(self.center.x + self.offsetX, self.center.y + self.offsetY)];  // 移动后的中心坐标
    
    // 按钮左右方向极限坐标
    if (self.center.x > kScreenWidth) {
        [self setCenter:CGPointMake(kScreenWidth, self.center.y)];
    }
    else if (self.center.x < 0) {
        [self setCenter:CGPointMake(0, self.center.y)];
    }
    
    // 按钮上下方向极限坐标
    if (self.center.y > kScreenHeight) {
        [self setCenter:CGPointMake(self.center.x, kScreenHeight)];
    }
    else if (self.center.y < (self.frame.size.height/2 + 20)) {
        [self setCenter:CGPointMake(self.center.x, self.frame.size.height/2 + 20)];
    }
}

// 结束触摸按钮
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    
    // 悬浮按钮始终贴在屏幕的一侧
    if (self.center.x > kScreenWidth/2) {
        // 吸附在右侧
        if (self.frame.origin.y + 40 + self.frame.size.height <= kScreenHeight) {
            [UIView animateWithDuration:0.5
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                 [self setCenter:CGPointMake(kScreenWidth - 15, self.center.y)];
             }
                             completion:nil];
        }
        // 吸附在右下角
        else {
            [UIView animateWithDuration:0.5
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                 [self setCenter:CGPointMake(kScreenWidth - 15, kScreenHeight - 15)];
             }
                             completion:nil];
            
        }
    }
    else {
        // 吸附在左侧
        if (self.frame.origin.y + 40 + self.frame.size.height <= kScreenHeight) {
            [UIView animateWithDuration:0.5
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                 [self setCenter:CGPointMake(15, self.center.y)];
             }
                             completion:nil];
            
        }
        // 吸附在左下角
        else {
            [UIView animateWithDuration:0.5
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^
             {
                 [self setCenter:CGPointMake(15, kScreenHeight - 15)];
             }
                             completion:nil];
        }
    }
}


@end
