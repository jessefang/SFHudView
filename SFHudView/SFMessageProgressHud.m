//
//  SFMessageProgressHud.m
//  SFHudView
//
//  Created by 方世峰 on 16/11/29.
//  Copyright © 2016年 richinginfo. All rights reserved.
//

#import "SFMessageProgressHud.h"

@implementation SFMessageProgressHud

- (void)addText{
    self.textLable = [[UILabel alloc]init];
    self.textLable.text = self.text;
    self.textLable.textColor = [UIColor whiteColor];
    
    self.textLable.lineBreakMode = NSLineBreakByWordWrapping;
    [self.textLable sizeToFit];
    
    NSUInteger line = CGRectGetWidth(self.textLable.frame) / (CGRectGetWidth([UIScreen mainScreen].bounds) - 130);
    if (line >= 1) {
        self.textLable.numberOfLines = line + 1;
        self.textLable.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds) - 130, CGRectGetHeight(self.textLable.frame));
        CGSize size = [self.textLable sizeThatFits:self.textLable.frame.size];
        self.textLable.frame = CGRectMake(0, 0, size.width, size.height);
    }
}

- (void)compositeElements{
    self.backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.textLable.frame) + 35, CGRectGetHeight(self.textLable.frame) + 35)];
    self.backView.center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame));
    self.backView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
    self.backView.layer.cornerRadius = 10;
    self.textLable.center = CGPointMake(CGRectGetMidX(self.backView.bounds), CGRectGetMidY(self.backView.bounds));
    
    [self.backView addSubview:self.textLable];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
