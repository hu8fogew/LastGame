//
//  ContactWayViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/5/23.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "ContactWayViewController.h"

@interface ContactWayViewController ()<UITableViewDelegate,UITableViewDataSource,EditingControllerBackStringDelegate>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *headerView;
@property (strong,nonatomic) UIView *footerView;

@property (strong,nonatomic) NSMutableArray *titleAry;
@property (strong,nonatomic) NSMutableArray *sLabelAry;

@end

@implementation ContactWayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"商户编辑";
    
    [self.view addSubview:self.tableView];
    
    self.titleAry = [NSMutableArray arrayWithObjects:@"商圈",@"联系电话",@"店铺地址",@"",@"",nil];
    
    self.sLabelAry = [NSMutableArray arrayWithObjects:@"请填写",@"请填写",@"请选择",@"请填写详细地址",@"", nil];
}

#pragma mark /--------headerView--------/
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        _headerView.backgroundColor = blueC;
        
        UILabel *title = [UILabel labelWithTextColor:whiteC FontSize:MTitleSize Sview:_headerView];
        title.text = @"联系方式";
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(leftToMargin);
            make.centerY.equalTo(_headerView);
        }];
        
        UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [closeBtn setImage:[UIImage imageNamed:@"error_white"] forState:UIControlStateNormal];
        [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_headerView addSubview:closeBtn];
        [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-leftToMargin);
            make.centerY.equalTo(title);
            make.size.mas_equalTo(CGSizeMake(MTitleSize, MTitleSize));
        }];
    }
    return _headerView;
}

-(void)closeBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark /--------footerView--------/
-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"确定" forState:UIControlStateNormal];
        btn.backgroundColor = blueC;
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 3;
        [btn addTarget:self action:@selector(confirmBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.and.centerX.equalTo(_footerView);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, formBtnHeight));
        }];
    }
    return _footerView;
}

-(void)confirmBtnAction{
    HWLog(@"确定");
    
}

#pragma mark /--------tableView--------/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.headerView.height;
        _tableView.tableFooterView = self.footerView;
        _tableView.tableFooterView.height = self.footerView.height;
        _tableView.separatorStyle = NO;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.titleAry.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return formCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YCYMFormTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cia"];
    if (cell == nil) {
        cell = [[YCYMFormTableViewCell alloc]initWithFrame:cell.bounds];
        if (indexPath.row==3||indexPath.row==4) {
            cell.titleLabel.text = self.titleAry[indexPath.row];
        }else{
            cell.titleLabel.attributedText = [self attributedStr:self.titleAry[indexPath.row]];
        }
        cell.selectLabel.text = self.sLabelAry[indexPath.row];
        
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row==0||indexPath.row==1) {
        EditingController *editVc = [[EditingController alloc]init];
        editVc.kindTitle = self.titleAry[indexPath.row];
        editVc.selectIndex = indexPath.row;
        editVc.delegate = self;
        MainNavigationController *vc = [[MainNavigationController alloc]initWithRootViewController:editVc];
        [self presentViewController:vc animated:YES completion:nil];
    }
    else if (indexPath.row==2){
        AddressSelectView *address = [[AddressSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectCityTtitle:@""];
        [address showCityView:^(NSString *proviceStr, NSString *cityStr, NSString *disStr) {
            [self.sLabelAry replaceObjectAtIndex:indexPath.row withObject:[NSString stringWithFormat:@"%@-%@-%@",proviceStr,cityStr,disStr]];
            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:indexPath.row inSection:0],nil] withRowAnimation:UITableViewRowAnimationNone];
        }];
    }
    
}

-(void)backStringToComeViewWith:(EditingController *)editVc andTag:(NSInteger)index{
//    HWLog(@"=======%@",editVc.editText);
//
//    HWLog(@"=------%zd",index);
//    if (![editVc.editText isEqualToString:@""]) {
//        if (index==0||index==1||index==2||index==3||index==5) {
//            [self.sLabelAry replaceObjectAtIndex:index withObject:editVc.editText];
//            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:index inSection:0],nil] withRowAnimation:UITableViewRowAnimationNone];
//        }
//    }
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
