//
//  ViewController.m
//  NSTimer
//
//  Created by yi on 16/2/29.
//  Copyright © 2016年 yi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.frame = CGRectMake(30, 100, 100, 30);
    testBtn.selected = YES;
    [testBtn setTitle:@"本地通知" forState:UIControlStateNormal];
    testBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [testBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [testBtn addTarget:self action:@selector(testBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
}


- (void)testBtnClick:(UIButton *)btn
{
    NSLog(@"-----10s后出现本地通知-----");
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    if (notification)
    {
        NSDate *now = [NSDate new];
        notification.fireDate = [now dateByAddingTimeInterval:10]; //10秒后通知
        notification.repeatInterval=0; //重复次数，kCFCalendarUnitWeekday一周一次
        notification.timeZone = [NSTimeZone defaultTimeZone]; //设置时区
        notification.applicationIconBadgeNumber = 0; //应用的角标
        notification.soundName = UILocalNotificationDefaultSoundName; //声音，可以换成alarm.soundName = @sound.wav
        //去掉下面2行就不会弹出提示框
        notification.alertBody = @"------------UILocalNotification本地通知------------"; //提示信息 弹出提示框
        notification.alertAction = @"打开"; //提示框按钮
        //notification.hasAction = NO; //是否显示额外的按钮，为no时alertAction消失
        NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"name" forKey:@"key"];;
        //设置userinfo 方便在之后需要撤销的时候使用 也可以传递其他值，当通知触发时可以获取
        notification.userInfo = infoDict;
        
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    }
}

- (void)countTimer:(NSTimer*)theTimer
{
    static int i = 0;
    NSLog(@"%d",i++);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
