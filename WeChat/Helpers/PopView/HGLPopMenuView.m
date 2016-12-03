//
//  HGLPopMenuView.m
//  PopviewTest
//
//  Created by huang long on 15/11/12.
//  Copyright © 2015年 huang long. All rights reserved.
//

#import "HGLPopMenuView.h"

#define              View_Width             120
#define              View_Frame_y            10
#define              View_button_Height      40



@implementation HGLPopMenuModel

+(instancetype)menuModelWithIcon:(NSString *)icon title:(NSString *)title target:(id)target sel:(SEL)sel{
    HGLPopMenuModel *model = [[HGLPopMenuModel alloc] init];
    model.icon = icon;
    model.title = title;
    model.target = target;
    model.actionSel = sel;
    return model;
}

@end

@implementation HGLMenuView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.menuColor = [UIColor redColor];
        self.fontSize = 15;
    }
    return self;
}

-(void)showInView:(UIView *)view{
    if (self.subviews.count > 0) {
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }

    for (int i = 0; i < self.menuArray.count; i ++) {
        HGLPopMenuModel *model = [self.menuArray objectAtIndex:i];
        UIButton *button = [[UIButton alloc] init];
        button.backgroundColor = [UIColor colorWithRed:47/255.0 green:46/255.0 blue:52/255.0 alpha:1.0];
        if (i == 0) {
            UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, View_Frame_y- 10, View_Width, 55)];
            imageView1.image = [UIImage imageNamed:@"xuele_menu_up"];
            [self addSubview:imageView1];
        }
        
        button.frame = CGRectMake(0, View_Frame_y + View_button_Height * i, View_Width, 47);
 
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        button.tag = i;
        button.titleLabel.font = [UIFont systemFontOfSize:self.fontSize];
        [button setImage:[UIImage imageNamed:model.icon] forState:(UIControlStateNormal)];
        [button setTitle:model.title forState:(UIControlStateNormal)];
        [button setTitleColor:self.menuColor forState:(UIControlStateHighlighted)];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:button];
    }
    self.frame = CGRectMake(self.frame.origin.x - 5, self.frame.origin.y, View_Width, View_Frame_y);
    [view addSubview:self];
    
}

-(void)buttonClick:(UIButton *)button{
    HGLPopMenuModel *model = [self.menuArray objectAtIndex:button.tag];
    if ([model.target respondsToSelector:model.actionSel]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [model.target performSelector:model.actionSel withObject:model];
#pragma clang diagnostic pop
    }
    if ([self.superview isKindOfClass:[HGLPopMenuView class]]) {
        [HGLPopMenuView dissmmiss];
    }else{
        [self removeFromSuperview];
    }
}



@end

@interface HGLPopMenuView ()

@property(nonatomic,weak)HGLMenuView * menuView;

@end

@implementation HGLPopMenuView

static HGLPopMenuView * instance;

+ (instancetype)sharedMenu
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[HGLPopMenuView alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    if (instance) {
        return instance;
    }else{
        self = [super init];
        if (self) {
            [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)]];
//            UIView *backView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//            backView.backgroundColor = [UIColor grayColor];
//            [self addSubview:backView];
//            backView.alpha = 0.3;
        }
        return self;
    }
}


-(void)showInView:(UIView *)view rect:(CGRect)rect{
    if (self.menuView) {
        [self dissmiss];
        return;
    }
    self.frame = view.bounds;
    HGLMenuView *menuView = [[HGLMenuView alloc] init];
    menuView.frame = CGRectMake(CGRectGetMaxX(rect) - View_Width + 10, CGRectGetMaxY(rect), 0, 0);
    menuView.menuArray = self.menuArray;
    [menuView showInView:self];
    _menuView = menuView;
    [view addSubview:self];
}

-(void)dissmiss{
    [_menuView removeFromSuperview];
    [self removeFromSuperview];
}

+(void)dissmmiss{
    if (instance) {
        [instance dissmiss];
    }
}

-(void)tapClick:(UIGestureRecognizer *)gesture{
    CGPoint point = [gesture locationInView:self];
    if (!CGRectContainsPoint(_menuView.frame, point)) {
        [self dissmiss];
    }
}

@end
