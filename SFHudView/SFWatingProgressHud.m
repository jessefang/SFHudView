//
//  SFWatingProgressHud.m
//  SFHudView
//
//  Created by 方世峰 on 16/11/29.
//  Copyright © 2016年 richinginfo. All rights reserved.
//

#import "SFWatingProgressHud.h"

@implementation SFWatingProgressHud

- (void)addIndicator{
    self.indicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.indicatorView startAnimating];
}

- (void)addText{
    if (self.text.length > 0) {
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
}

- (void)compositeElements{
    if (self.textLable) {
        CGFloat width = CGRectGetWidth(self.textLable.frame) > 50 ? CGRectGetWidth(self.textLable.frame) + 35 : 85;
        CGFloat height = CGRectGetHeight(self.textLable.frame) + 80;
        self.backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
        self.indicatorView.center = CGPointMake(CGRectGetMidX(self.backView.bounds), CGRectGetMinY(self.backView.frame) + 35);
        self.textLable.center = CGPointMake(CGRectGetMidX(self.backView.bounds), (CGRectGetMaxY(self.backView.bounds) + CGRectGetMaxY(self.indicatorView.bounds)) / 2 + 6);
        [self.backView addSubview:self.textLable];
    }else{
        self.backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 85, 85)];
        self.indicatorView.center = CGPointMake(CGRectGetMidX(self.backView.bounds), CGRectGetMidY(self.backView.bounds));
    }
    self.backView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
    self.backView.layer.cornerRadius = 10;
    self.backView.center = CGPointMake(CGRectGetMidY(self.view.frame), CGRectGetMidY(self.view.frame));
    
    [self.backView addSubview:self.indicatorView];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
