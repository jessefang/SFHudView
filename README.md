# SFHudView
simple progress hud
##usage
`
+ (instancetype)showInView:(UIView *)view withText:(NSString *)text animated:(BOOL)animated;

+ (instancetype)popMessage:(NSString *)text InView:(UIView *)view duration:(NSTimeInterval)duration animated:(BOOL)animated;`
##method for remove
`
+ (void)dismissInView:(UIView *)view animated:(BOOL)animated;
+ (void)dismissAll:(BOOL)animated;
- (void)dismiss:(BOOL)animated;`
