//
//  BasicDataViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/2/22.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "BasicDataViewController.h"

@interface BasicDataViewController ()<UITableViewDelegate,UITableViewDataSource,EditingControllerBackStringDelegate,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *footerView;

@property (strong,nonatomic) NSMutableArray *titleArr;
@property (strong,nonatomic) NSMutableArray *sLabelArr;

@property (strong,nonatomic) UIButton *yesBtn;
@property (strong,nonatomic) UIButton *noBtn;

@end

@implementation BasicDataViewController
id dataCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    self.navigationItem.title = @"基础资料";
    
    self.titleArr = [NSMutableArray arrayWithObjects:@"姓名",@"性别",@"学历",@"出生年月",@"工作年份",@"工作城市", nil];
    self.sLabelArr = [NSMutableArray arrayWithObjects:@"请填写",@"",@"请选择",@"请选择",@"请选择",@"请选择",nil];
}


#pragma mark /-------懒加载---------/

-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
        _footerView.backgroundColor = whiteC;
        
        UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
        saveBtn.backgroundColor = blueC;
        saveBtn.layer.masksToBounds = YES;
        saveBtn.layer.cornerRadius = 3;
        [saveBtn addTarget:self action:@selector(saveBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:saveBtn];
        [saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.and.centerX.equalTo(_footerView);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, formBtnHeight));
        }];
    }
    return _footerView;
}

-(void)saveBtnClick{
    
}

#pragma mark /--------tableView--------/
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return formCellHeight;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, topToMargin)];
    headView.backgroundColor = grayC;

    return headView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return topToMargin;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YCYMFormTableViewCell *fCell = [tableView dequeueReusableCellWithIdentifier:@"cia"];
    fCell = [[YCYMFormTableViewCell alloc]initWithFrame:fCell.bounds];
    dataCell = fCell;
    fCell.selectLabel.text = self.sLabelArr[indexPath.row];
    if (indexPath.row == 1){
        SexSelectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ce"];
        cell = [[SexSelectTableViewCell alloc]initWithFrame:cell.bounds];
        dataCell = cell;
        cell.titleLab.text = @"   性别";
        [cell.switchBtn addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    }else{
        fCell.titleLabel.attributedText = [self attributedStr:self.titleArr[indexPath.row]];
    }

    return dataCell;
}

-(void)switchValueChanged:(UISwitch *)sender{
    if (sender.isOn) {
        HWLog(@"on");
    }else{
        HWLog(@"off");
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        EditingController *editVc = [[EditingController alloc]init];
        editVc.kindTitle = self.titleArr[indexPath.row];
        editVc.selectIndex = indexPath.row;
        editVc.delegate = self;
        MainNavigationController *vc = [[MainNavigationController alloc]initWithRootViewController:editVc];
        [self presentViewController:vc animated:YES completion:nil];
    }
    
    if (indexPath.row==2) {
        SingleSelectView *sinle = [[SingleSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectTtitle:self.titleArr[indexPath.row] TitleArr:@[@"初中",@"中技",@"高中",@"中专",@"大专",@"本科",@"硕士/MBA",@"EMBA/博士",@"其他"]];
        [sinle showView:^(NSString *singleStr) {
            [self.sLabelArr replaceObjectAtIndex:indexPath.row withObject:singleStr];
             [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:indexPath.row inSection:0], nil] withRowAnimation:UITableViewRowAnimationNone];
        }];
    }
    
    if (indexPath.row==3||indexPath.row==4) {
        DateSelectView *dateView = [[DateSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectDateTtitle:@"时间"];
        [dateView showDateView:^(NSString *selectStr) {
        [self.sLabelArr replaceObjectAtIndex:indexPath.row withObject:selectStr];
            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:indexPath.row inSection:0],nil] withRowAnimation:UITableViewRowAnimationNone];
        }];
    }
    if (indexPath.row==5) {
    }
}

-(void)backStringToComeViewWith:(EditingController *)editVc andTag:(NSInteger)index
{
//    HWLog(@"=======%@",editVc.editText);
//    
//    HWLog(@"=------%zd",index);
//    if (![editVc.editText isEqualToString:@""]) {
//        if (index == 0) {
//            [self.sLabelArr replaceObjectAtIndex:index withObject:editVc.editText];
//            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:index inSection:0],nil] withRowAnimation:UITableViewRowAnimationNone];
//        }
//       
//    }
}

-(void)yesNoBtnClick:(UIButton *)sender{
    if (sender.tag == 100) {
        self.yesBtn.selected = YES;
        self.noBtn.selected = NO;
        
    }
    else{
        self.yesBtn.selected = NO;
        self.noBtn.selected = YES;
    }
}

//红色星星✨
-(NSMutableAttributedString *)attributedStr:(NSString *)str{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:[@"* "stringByAppendingString:str]];
    [attributedStr addAttribute:NSForegroundColorAttributeName value:redC range:NSMakeRange(0, 1)];
    return attributedStr;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
