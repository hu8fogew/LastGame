//
//  StudyExperViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/2/22.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "StudyExperViewController.h"

@interface StudyExperViewController ()<UITableViewDelegate,UITableViewDataSource,EditingControllerBackStringDelegate>
{
    UIButton *yesBtn;  //是否状态按钮
    UIButton *noBtn;
    
    DateSelectView *dateView;
    UILabel *leftLab;   //时间显示
    UILabel *rightLab;
}

@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) UIView *footerView;

@property (strong,nonatomic) NSMutableArray *titleArr;
@property (strong,nonatomic) NSMutableArray *sLabelArr;


@end

@implementation StudyExperViewController

id studyCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"教育经历";

    self.titleArr = [NSMutableArray arrayWithObjects:@"学校名称",@"专业名称",@"是否统招",@"时间段",@"学历/学位", nil];
    self.sLabelArr = [NSMutableArray arrayWithObjects:@"请填写",@"请填写",@"",@"",@"请选择",nil];
    
    [self.view addSubview:self.tableView];
}

#pragma mark /-------footerView---------/
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
    studyCell = cell;
    cell.titleLabel.attributedText = [self attributedStr:self.titleArr[indexPath.row]];
    cell.selectLabel.text = self.sLabelArr[indexPath.row];
        
    if (indexPath.row == 2) {
        YesNoSelectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ce"];
        cell = [[YesNoSelectTableViewCell alloc]initWithFrame:cell.bounds];
        cell.titleLab.attributedText = [self attributedStr:@"是否统招"];
        studyCell = cell;
        [cell.yesBtn addTarget:self action:@selector(yesNoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        yesBtn = cell.yesBtn;
        
        [cell.noBtn addTarget:self action:@selector(yesNoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        noBtn = cell.noBtn;
    }
    
    //时间选择
    if (indexPath.row == 3) {
        cell.selectionStyle = NO;
        cell.selectLabel.text = self.sLabelArr[indexPath.row];
        
        cell.rightLab.text = @"请选择";
        rightLab = cell.rightLab;
        cell.rightLab.userInteractionEnabled = YES;
        [cell.rightLab addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseRightClick)]];
        
        cell.leftLab.text = @"请选择";
        leftLab = cell.leftLab;
        cell.leftLab.userInteractionEnabled = YES;
        [cell.leftLab addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseLeftClick)]];

        cell.lab.text = @"至";
    
    }
    
    return studyCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row==0||indexPath.row==1) {
        EditingController *edit = [[EditingController alloc]init];
        edit.kindTitle = self.titleArr[indexPath.row];
        edit.selectIndex = indexPath.row;
        edit.delegate = self;
        
        MainNavigationController *vc = [[MainNavigationController alloc]initWithRootViewController:edit];
        
        [self presentViewController:vc animated:YES completion:nil];
    }
    
    if (indexPath.row==4) {
        SingleSelectView *single = [[SingleSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectTtitle:self.titleArr[indexPath.row] TitleArr:@[@"初中",@"中技",@"高中",@"中专",@"大专",@"本科",@"硕士/MBA",@"EMBA/博士",@"其他"]];
        [single showView:^(NSString *singleStr) {
            [self.sLabelArr replaceObjectAtIndex:indexPath.row withObject:singleStr];
            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:indexPath.row inSection:0], nil] withRowAnimation:UITableViewRowAnimationNone];
        }];
    }
}

-(void)backStringToComeViewWith:(EditingController *)editVc andTag:(NSInteger)index{
//    if (![editVc.editText isEqualToString:@""]) {
//        if (index==0||index==1) {
//            [self.sLabelArr replaceObjectAtIndex:index withObject:editVc.editText];
//            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:index inSection:0], nil] withRowAnimation:UITableViewRowAnimationNone];
//        }
//    }
}

//是否选择
-(void)yesNoBtnClick:(UIButton *)sender{
    if (sender.tag == 100) {
        yesBtn.selected = YES;
        noBtn.selected = NO;
    }
    else{
        yesBtn.selected = NO;
        noBtn.selected = YES;
    }
}

//左右选择
-(void)chooseRightClick{
    dateView = [[DateSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectDateTtitle:@"时间"];
    [dateView showDateView:^(NSString *selectStr) {
        rightLab.text = selectStr;
    }];
}
-(void)chooseLeftClick{
    dateView = [[DateSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectDateTtitle:@"时间"];
    [dateView showDateView:^(NSString *selectStr) {
        leftLab.text = selectStr;
    }];
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
