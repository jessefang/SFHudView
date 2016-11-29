//
//  TestViewController.m
//  SFHudView
//
//  Created by 方世峰 on 16/11/29.
//  Copyright © 2016年 richinginfo. All rights reserved.
//

#import "TestViewController.h"
#import "SFHudView.h"

@interface TestViewController ()

@property (strong, nonatomic)SFHudView *hud;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    _hud = [SFHudView showInView:self.view withText:@"TEST" animated:YES];
    [self fakeFetch];
}

- (void)fakeFetch{
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 2ull * NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        [_hud dismiss:YES];
    });
}

- (void)viewWillDisappear:(BOOL)animated{
    [_hud dismiss:YES];
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
