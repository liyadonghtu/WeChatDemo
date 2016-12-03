//
//  MessageMainViewController.m
//  WeChat
//
//  Created by 李亚东 on 16/11/26.
//  Copyright © 2016年 李亚东. All rights reserved.
//

#import "MessageMainViewController.h"
#import "MessageMainTableViewCell.h"
#import "HGLPopMenuView.h"


@interface MessageMainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

@property (nonatomic, strong) NSArray  *myDataSourceArray;

@property (nonatomic, strong) UIButton  *leftButton;

@end

@implementation MessageMainViewController

#pragma mark - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.myTableView];
    
    self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftButton.frame = CGRectMake(0, 0, 20, 20);
    [self.leftButton setImage:[UIImage imageNamed:@"add_button_image"] forState:UIControlStateNormal];
    [self.navigationController.navigationBar addSubview:self.leftButton];
    
    [self.leftButton addTarget:self action:@selector(handleLeftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftButton];
   
    NSMutableArray *finaNameArray = [NSMutableArray array];
    for (int i = 0; i < 100; i++) {
        [finaNameArray addObject:[self createRandomName]];
    }
    self.myDataSourceArray = finaNameArray;
    
//    self.myDataSourceArray = @[@"李彦龙",@"李朵雯",@"李浩鹏",@"李雨杭",@"李铁刚",@"李贞荪",@"李君昊",@"李瑾宛",@"李国艳",@"李滢玉",@"李恩德",@"李美穆",@"李文雅",@"李姗芝",@"李文轩",@"李宛娇",@"李文博",@"李箐思",@"李文璇",@"李蕖姿",@"李文萱",@"李雨昕",@"李文渲",@"李若蕴",@"李美红",@"李些忆"];
}


- (void)handleLeftButtonAction:(id)sender {

//    HGLPopMenuModel *model1 = [HGLPopMenuModel menuModelWithIcon:@"start_manyPeople_chat" title:@"发起群聊" target:self sel:@selector(pushMenuItem1:)];
//    HGLPopMenuModel *model2 = [HGLPopMenuModel menuModelWithIcon:@"add_friends" title:@"添加朋友" target:self sel:@selector(pushMenuItem2:)];
//    HGLPopMenuModel *model3 = [HGLPopMenuModel menuModelWithIcon:@"start_sweep" title:@"扫一扫    " target:self sel:@selector(pushMenuItem2:)];
//    HGLPopMenuModel *model4 = [HGLPopMenuModel menuModelWithIcon:@"start_manyPeople_chat" title:@"收付款    " target:self sel:@selector(pushMenuItem2:)];
//    HGLPopMenuView *menuView = [HGLPopMenuView sharedMenu];
//    CGRect rect = self.leftButton.frame;
//    rect.origin.y = 20;
//    rect.size.height = 44;
//    menuView.menuArray = [NSMutableArray arrayWithObjects:model1, model2, model3, model4, nil];
//    [menuView showInView:self.view.window rect:rect];
    
    
    
    
    
}
- (void)pushMenuItem1:(id)sender {
    NSLog(@"11111111111111");
}

- (void)pushMenuItem2:(id)sender {
    NSLog(@"2222222222222");
}

- (NSString *)createRandomName{
    
    // 获取一个随机数范围在：[500,1000），包括500，包括1000
    //int y = (arc4random() % 501) + 500;
    NSArray *familyArray = @[@"赵", @"钱", @"孙", @"李", @"周", @"吴", @"郑" ,@"王",@"万俟", @"司马"];
    NSArray *nameArray = @[@"彦龙",@"朵雯",@"浩鹏",@"雨杭",@"铁刚",@"贞荪",@"君昊",@"瑾宛",@"国艳",@"滢玉",@"恩德",@"美穆",@"文雅",@"姗芝",@"文轩",@"宛娇",@"文博",@"箐思",@"文璇",@"蕖姿",@"文萱",@"雨昕",@"文渲",@"若蕴",@"美红",@"些忆"];
    
    NSInteger familyIndex = arc4random() % familyArray.count;
    NSInteger nameIndex = arc4random() % nameArray.count;
    
    NSString *finaName = [NSString stringWithFormat:@"%@%@",familyArray[familyIndex],nameArray[nameIndex]];
    
    return finaName;
}
- (UIImage *)creatRandomImage {
    NSString *headerImage = [NSString stringWithFormat:@"headImage_%d",arc4random() % 11 + 1];
    return [UIImage imageNamed:headerImage];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - lazyload
- (UITableView *)myTableView {
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
    }
    return _myTableView;
}
- (NSArray *)myDataSourceArray {
    if (!_myDataSourceArray) {
        _myDataSourceArray = [NSArray array];
    }
    return _myDataSourceArray;
}



#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.myDataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"messageCell";
    MessageMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; //出列可重用的cell
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MessageMainTableViewCell" owner:self options:nil] lastObject];
    }
    cell.nameText.text = self.myDataSourceArray[indexPath.row];
   
    cell.iconView.image = [self creatRandomImage];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}


@end
