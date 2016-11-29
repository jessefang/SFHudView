//
//  SFHudView.m
//  SFHudView
//
//  Created by 方世峰 on 16/11/29.
//  Copyright © 2016年 richinginfo. All rights reserved.
//

#import "SFHudView.h"
#import "SFMessageProgressHud.h"
#import "SFWatingProgressHud.h"

static NSMutableArray *HUDs;

@interface SFHudView ()

@end

@implementation SFHudView

+ (void)load{
    HUDs = [NSMutableArray array];
}

+ (instancetype)showInView:(UIView *)view withText:(NSString *)text animated:(BOOL)animated{
    SFHudView *hud = [[SFWatingProgressHud alloc]initWithFrame:view.bounds];
    hud.text = text;
    hud.view = view;
    [hud addIndicator];
    [hud addText];
    [hud compositeElements];
    
    [hud show:animated withDuration:0 completion:nil];
    
    return hud;
}

+ (instancetype)popMessage:(NSString *)text InView:(UIView *)view duration:(NSTimeInterval)duration animated:(BOOL)animated{
    SFHudView *hud = [[SFMessageProgressHud alloc]initWithFrame:view.bounds];
    hud.view = view;
    hud.text = text;
    
    [hud addText];
    [hud compositeElements];
    
    [hud show:animated withDuration:duration completion:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration *NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud dismiss:animated];
        });
    }];
    return hud;
}

+ (void)dismissInView:(UIView *)view animated:(BOOL)animated{
    for (SFHudView *hud  in HUDs) {
        if ([hud.view isEqual:view]) {
            [hud dismiss:animated];
        }
    }
}

+ (void)dismissAll:(BOOL)animated{
    for (SFHudView *hud  in HUDs) {
        [hud dismiss:animated];
    }
}

- (void)dismiss:(BOOL)animated{
    if (animated) {
        [UIView animateWithDuration:0.3 animations:^{
            for (UIView *view in self.subviews) {
                view.alpha = 0;
            }
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            [HUDs removeObject:self];
        }];
    }else{
        [self removeFromSuperview];
        [HUDs removeObject:self];
    }
}

- (void)show:(BOOL)animated withDuration:(NSTimeInterval)duration completion:(void(^)())completion{
    [self addSubview:self.backView];
    [HUDs addObject:self];
    if (animated) {
        self.alpha = 0;
        [self.view addSubview:self];
        [UIView animateWithDuration:0.3 animations:^{
            self.alpha = 1;
        } completion:^(BOOL finished) {
            if (completion) {
                completion();
            }
        }];
    }else{
        [self.view addSubview:self];
    }
}

- (void)layoutSubviews{
    self.backView.center = CGPointMake(CGRectGetWidth(self.view.frame) / 2, CGRectGetHeight(self.view.frame) / 2 - CGRectGetMinY(self.view.frame));
    
}

- (void)addText{
    
}

- (void)addIndicator{
    
}

- (void)compositeElements{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
