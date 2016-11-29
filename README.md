# SFHudView
simple progress hud
# usage
`//waiting progress
+ (instancetype)showInView:(UIView *)view withText:(NSString *)text animated:(BOOL)animated;

//show message
+ (instancetype)popMessage:(NSString *)text InView:(UIView *)view duration:(NSTimeInterval)duration animated:(BOOL)animated;`

# remove hud
`
//show message
+ (instancetype)popMessage:(NSString *)text InView:(UIView *)view duration:(NSTimeInterval)duration animated:(BOOL)animated;

//dismiss hud in view
+ (void)dismissInView:(UIView *)view animated:(BOOL)animated;

//dismiss all hud
+ (void)dismissAll:(BOOL)animated;
//dismiss
- (void)dismiss:(BOOL)animated;`
