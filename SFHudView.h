//
//  SFHudView.h
//  SFHudView
//
//  Created by 方世峰 on 16/11/29.
//  Copyright © 2016年 richinginfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFHudView : UIView

@property (nonatomic, weak)UIView *view;
@property (nonatomic, strong)UIView *backView;
@property (nonatomic, strong)UIActivityIndicatorView *indicatorView;
@property (nonatomic, strong)UILabel *textLable;
@property (nonatomic, copy)NSString *text;

//waiting
+ (instancetype)showInView:(UIView *)view withText:(NSString *)text animated:(BOOL)animated;

//show message
+ (instancetype)popMessage:(NSString *)text InView:(UIView *)view duration:(NSTimeInterval)duration animated:(BOOL)animated;

//dismiss hud in view
+ (void)dismissInView:(UIView *)view animated:(BOOL)animated;

//dismiss all hud
+ (void)dismissAll:(BOOL)animated;

- (void)dismiss:(BOOL)animated;

- (void)addIndicator;
- (void)addText;
- (void)compositeElements;

@end
