//
//  HGLPopMenuView.h
//  PopviewTest
//
//  Created by huang long on 15/11/12.
//  Copyright © 2015年 huang long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HGLPopMenuModel : NSObject

@property(nonatomic , copy)NSString * icon;

@property(nonatomic , copy)NSString * title;

@property(nonatomic,assign)id target;

@property(nonatomic , assign)SEL actionSel;

+(instancetype)menuModelWithIcon:(NSString *)icon title:(NSString *)title target:(id)target sel:(SEL)sel;


@end

//该视图只支持 上箭头
@interface HGLMenuView : UIView

@property(nonatomic,strong)NSMutableArray *menuArray;

-(void)showInView:(UIView *)view;

@property(nonatomic,strong)UIColor * menuColor;

@property(nonatomic,assign)CGFloat fontSize;

@end

@interface HGLPopMenuView : UIView

+ (instancetype)sharedMenu;

-(void)showInView:(UIView *)view rect:(CGRect)rect;

@property(nonatomic,strong)UIColor * menuColor;

@property(nonatomic,assign)CGFloat fontSize;

@property(nonatomic,strong)NSMutableArray *menuArray;

+(void)dissmmiss;

@end
