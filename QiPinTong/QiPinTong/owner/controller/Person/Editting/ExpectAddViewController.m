//
//  ExpectAddViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/2/23.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "ExpectAddViewController.h"

@interface ExpectAddViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) UIView *footerView;
@property (strong,nonatomic) NSMutableArray *titleArr;
@property (strong,nonatomic) NSMutableArray *sLabelArr;

@end

@implementation ExpectAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"期望职位";

    self.titleArr = [NSMutableArray arrayWithObjects:@"职位性质",@"期望职位",@"所属行业",@"薪资要求",@"工作城市", nil];
    self.sLabelArr = [NSMutableArray arrayWithObjects:@"请选择",@"请选择",@"请选择",@"请选择",@"请选择",nil];
    
    [self.view addSubview:self.tableView];
}

#pragma mark /--------footerView---------/
-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 240)];
        _footerView.backgroundColor = whiteC;
        
        UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
        saveBtn.backgroundColor = blueC;
        saveBtn.layer.masksToBounds = YES;
        saveBtn.layer.cornerRadius = 4;
        [saveBtn addTarget:self action:@selector(saveBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:saveBtn];
        [saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_footerView.mas_centerY).offset(-10);
            make.centerX.equalTo(_footerView);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, formBtnHeight));
        }];
        
        UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
        [deleteBtn setTitleColor:SecondTitleColor forState:UIControlStateNormal];
        deleteBtn.backgroundColor = grayC;
        deleteBtn.layer.masksToBounds = YES;
        deleteBtn.layer.cornerRadius = 3;
        [deleteBtn addTarget:self action:@selector(deleteBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:deleteBtn];
        [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_footerView);
            make.top.equalTo(_footerView.mas_centerY).offset(30);
            make.size.equalTo(saveBtn);
        }];

    }
    return _footerView;
}

//保存
-(void)saveBtnClick{
    
}

//删除
-(void)deleteBtnClick{
    
}

#pragma mark /--------tableView---------/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = self.footerView;
        _tableView.tableFooterView.height = self.footerView.height;
        _tableView.sectionFooterHeight = 0;
        _tableView.backgroundColor = whiteC;
        _tableView.separatorStyle = NO;
        
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.titleArr.count;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, topToMargin)];
    headView.backgroundColor = grayC;
    
    return headView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return topToMargin;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return formCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YCYMFormTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"c"];
    cell = [[YCYMFormTableViewCell alloc]initWithFrame:cell.bounds];
    cell.titleLabel.attributedText = [self attributedStr: self.titleArr[indexPath.row]];
    cell.selectLabel.text = self.sLabelArr[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

//红色星星✨
-(NSMutableAttributedString *)attributedStr:(NSString *)str{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:[@"* "stringByAppendingString:str]];
    [attributedStr addAttribute:NSForegroundColorAttributeName value:redC range:NSMakeRange(0, 1)];
    return attributedStr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
