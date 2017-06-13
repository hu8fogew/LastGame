//
//  TeamManageViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/5/24.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "TeamManageViewController.h"

@interface TeamManageViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *footerView;

@property (strong,nonatomic) NSMutableArray *listAry;

@property (assign,nonatomic) NSInteger i;

@end

@implementation TeamManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"团队管理";
    [self.view addSubview:self.tableView];
    
    self.listAry = [NSMutableArray arrayWithObjects:@"商户事业部",@"招聘事业部",@"校招事业部",@"运营管理部", nil];
}

#pragma mark /-------footerView---------/
-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
        
        UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [addBtn setTitle:@"新增部门" forState:UIControlStateNormal];
        [addBtn setTitleColor:MainColor forState:UIControlStateNormal];
        addBtn.backgroundColor = whiteC;
        addBtn.layer.masksToBounds = YES;
        addBtn.layer.cornerRadius = 3;
        addBtn.layer.borderColor = SecondTitleColor.CGColor;
        addBtn.layer.borderWidth = 1;
        [addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:addBtn];
        [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.and.bottom.equalTo(_footerView);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, formBtnHeight));
        }];
    }
    return _footerView;
}

-(void)addBtnClick{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请输入部门名称" message:@"\n\n"preferredStyle:UIAlertControllerStyleAlert];
    UITextField * text = [[UITextField alloc] initWithFrame:CGRectMake(15, 55, 240, 30)];
    text.borderStyle = UITextBorderStyleRoundedRect;
    text.delegate = self;
    [alert.view addSubview:text];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [cancel setValue:SecondTitleColor forKey:@"titleTextColor"];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        HWLog(@"%@",text.text);
        [self.listAry insertObject:text.text atIndex:4];
        [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:4 inSection:0], nil] withRowAnimation:UITableViewRowAnimationFade];
    }];
    [ok setValue:blueC forKey:@"titleTextColor"];
    
    [alert addAction:cancel];
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark /-------tableView---------/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = NO;
        _tableView.tableFooterView = self.footerView;
        _tableView.tableFooterView.height = self.footerView.height;
        _tableView.sectionFooterHeight = 0;
        _tableView.backgroundColor = grayC;
    }
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return self.listAry.count;
    }
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return topToMargin;
    }
    return leftToMargin;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return formCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DiscoverTableViewCell *cell = [[DiscoverTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.selectionStyle = NO;
    cell.icon.image = [UIImage imageNamed:@"empty"];
    if (indexPath.section==0) {
        cell.title.text = self.listAry[indexPath.row];
    }
    else{
        cell.title.text = indexPath.section==1?@"达人帮":@"排行榜";
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TeamListViewController *vc = [TeamListViewController new];
    RankingViewController *rank= [RankingViewController new];
    if (indexPath.section==2) {
        [self.navigationController pushViewController:rank animated:YES];
    }
    else{
        vc.titleStr = self.listAry[indexPath.row];
        if (indexPath.section==1) {
            vc.titleStr = @"达人帮";
        }
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
