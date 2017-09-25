# HTAssistiveTouchButton
## Show
![demoImg](https://github.com/runThor/HTAssistiveTouchButton/raw/master/Other/pic1.png)<br>
![demoImg](https://github.com/runThor/HTAssistiveTouchButton/raw/master/Other/pic2.png)<br>
![demoImg](https://github.com/runThor/HTAssistiveTouchButton/raw/master/Other/pic3.png)
## Usage
```Objective-C
// ViewController.m

#import "HTAssistiveTouchButton.h"

@interface ViewController ()

@property (nonatomic, strong) HTAssistiveTouchButton *ATButton;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // 创建悬浮按钮
    self.ATButton = [[HTAssistiveTouchButton alloc] initWithFrame:CGRectMake(0, 0, 52, 52)];
    [self.ATButton setCenter:CGPointMake([UIScreen mainScreen].bounds.size.width - 15, 100)];
    [self.ATButton setBackgroundImage:[UIImage imageNamed:@"ATButton"] forState:UIControlStateNormal];
    self.ATButton.alpha = 0.8;
    [[UIApplication sharedApplication].keyWindow addSubview:self.ATButton];
    
    // 创建子按钮
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 52, 52)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    backBtn.hidden = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:backBtn];
    backBtn.alpha = 0.8;
    [self.ATButton.childButtons addObject:backBtn];
    
    UIButton *settingBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 52, 52)];
    [settingBtn setBackgroundImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
    settingBtn.hidden = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:settingBtn];
    settingBtn.alpha = 0.8;
    [self.ATButton.childButtons addObject:settingBtn];
    
    UIButton *homeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 52, 52)];
    [homeBtn setBackgroundImage:[UIImage imageNamed:@"home"] forState:UIControlStateNormal];
    homeBtn.hidden = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:homeBtn];
    homeBtn.alpha = 0.8;
    [self.ATButton.childButtons addObject:homeBtn];
}
```
