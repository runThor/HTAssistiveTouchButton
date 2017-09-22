//
//  ViewController.m
//  HTAssistiveTouchButtonDemo
//
//  Created by chenghong on 2017/9/22.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "ViewController.h"
#import "HTAssistiveTouchButton.h"

@interface ViewController ()

@property (nonatomic, strong) HTAssistiveTouchButton *ATButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建悬浮按钮
    self.ATButton = [[HTAssistiveTouchButton alloc] initWithFrame:CGRectMake(0, 0, 52, 52)];
    [self.ATButton setCenter:CGPointMake([UIScreen mainScreen].bounds.size.width - 15, 100)];
    [self.ATButton setBackgroundImage:[UIImage imageNamed:@"ATButton"] forState:UIControlStateNormal];
    self.ATButton.alpha = 0.8;
    [self.ATButton addTarget:self
                      action:@selector(assistiveTouchButtonClicked:)
            forControlEvents:UIControlEventTouchUpInside];
    [self.ATButton addTarget:self
                      action:@selector(assistiveTouchButtonTouchDrag)
            forControlEvents:UIControlEventTouchDragInside];
    
    [[UIApplication sharedApplication].keyWindow addSubview:self.ATButton];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
