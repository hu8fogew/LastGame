//
//  TalentGangViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/5/20.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "TalentFormViewController.h"

@interface TalentFormViewController ()<UITableViewDelegate,UITableViewDataSource,EditingControllerBackStringDelegate,UIGestureRecognizerDelegate>

@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) UIView *footerView;

@property (strong,nonatomic) NSMutableArray *titleAry;
@property (strong,nonatomic) NSMutableArray *sLabAry;

@end

@implementation TalentFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"达人帮";
    [self.view addSubview:self.tableView];
    
    self.titleAry = [NSMutableArray arrayWithObjects:@"区域范围",@"数量要求",@"共享单价",@"性别条件",@"年龄", nil];
    self.sLabAry = [NSMutableArray arrayWithObjects:@"请选择",@"请填写",@"请填写(通币个数)",@"请选择",@"请填写", nil];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.navigationController.viewControllers.count == 1) {
        return NO;
    }
    else{
        return YES;
    }
}

#pragma mark ---------footerView----------
-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
        _footerView.backgroundColor = whiteC;
        
        UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
        saveBtn.backgroundColor = orangeC;
        saveBtn.layer.masksToBounds = YES;
        saveBtn.layer.cornerRadius = 3;
        [saveBtn addTarget:self action:@selector(saveBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:saveBtn];
        [saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.and.bottom.equalTo(_footerView);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, formBtnHeight));
        }];
    }
    return _footerView;
}

-(void)saveBtnClick{
    ShareRecordViewController *vc = [ShareRecordViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark |--------tableView---------|
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = whiteC;
        _tableView.sectionFooterHeight = 0;
        _tableView.separatorStyle = NO;
        
        _tableView.tableFooterView = self.footerView;
        _tableView.tableFooterView.height = self.footerView.height;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.titleAry.count;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, topToMargin)];
    vi.backgroundColor = grayC;
    
    return vi;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return topToMargin;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YCYMFormTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[YCYMFormTableViewCell alloc]initWithFrame:cell.bounds];
        if (indexPath.row==3) {
            cell.titleLabel.text = @"   性别条件";
        }
        else{
            cell.titleLabel.attributedText = [self attributedStr:self.titleAry[indexPath.row]];
        }
        cell.selectLabel.text = self.sLabAry[indexPath.row];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row==1||indexPath.row==2||indexPath.row==4) {
        EditingController *editVc = [[EditingController alloc]init];
        editVc.kindTitle = self.titleAry[indexPath.row];
        editVc.selectIndex = indexPath.row;
        editVc.delegate = self;
        MainNavigationController *vc = [[MainNavigationController alloc]initWithRootViewController:editVc];
        [self presentViewController:vc animated:YES completion:nil];
    }
    else if (indexPath.row==0){
        AddressSelectView *address = [[AddressSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectCityTtitle:@"区域"];
        [address showCityView:^(NSString *proviceStr, NSString *cityStr, NSString *disStr) {
            [self.sLabAry replaceObjectAtIndex:indexPath.row withObject:[NSString stringWithFormat:@"%@-%@-%@",proviceStr,cityStr,disStr]];
            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:indexPath.row inSection:0], nil] withRowAnimation:UITableViewRowAnimationNone];
        }];
    }
    else{
        SingleSelectView *single = [[SingleSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectTtitle:self.titleAry[indexPath.row] TitleArr:@[@"全部",@"男",@"女"]];
        [single showView:^(NSString *singleStr) {
            [self.sLabAry replaceObjectAtIndex:indexPath.row withObject:singleStr];
            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:indexPath.row inSection:0], nil] withRowAnimation:UITableViewRowAnimationNone];
        }];
    }
}

-(void)backStringToComeViewWith:(EditingController *)editVc andTag:(NSInteger)index{
    //    if (index==1||index==2||index==4) {
    //        if (![editVc.editText isEqualToString:@""]) {
    //            [self.sLabAry replaceObjectAtIndex:index withObject:editVc.editText];
    //            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:index inSection:0], nil] withRowAnimation:UITableViewRowAnimationNone];
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
