//
//  EditResumeViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/5/17.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "EditResumeViewController.h"

@interface EditResumeViewController ()<UITableViewDelegate,UITableViewDataSource,EditingControllerBackStringDelegate>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UILabel *selectLab;

@end

@implementation EditResumeViewController

id etCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"编辑简历";
    [self.view addSubview:self.tableView];
}

#pragma mark //----------tableView-----------/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = NO;
        _tableView.backgroundColor = whiteC;
        _tableView.sectionFooterHeight = 0;
    }
    return _tableView;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, topToMargin)];
    vi.backgroundColor = grayC;

    return vi;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return topToMargin;
    }
    return leftToMargin;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YCYMFormTableViewCell *formCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    AddTableViewCell *addCell = [tableView dequeueReusableCellWithIdentifier:@"cia"];
    if (indexPath.section == 0) {
        formCell = [[YCYMFormTableViewCell alloc]initWithFrame:formCell.bounds];
        etCell = formCell;
        formCell.titleLabel.text = indexPath.row==0?@"期望职位":@"我的优势";
        self.selectLab = formCell.selectLabel;
    }
    else if (indexPath.section == 1) {
        addCell = [[AddTableViewCell alloc]initWithFrame:addCell.bounds];
        etCell = addCell;
        addCell.addImage.image = [UIImage imageNamed:@"bPlusIcon"];
        addCell.addLabel.text = @"添加工作经历";
    }
    else{
        addCell = [[AddTableViewCell alloc]initWithFrame:addCell.bounds];
        etCell = addCell;
        addCell.addImage.image = [UIImage imageNamed:@"bPlusIcon"];
        addCell.addLabel.text = @"添加教育经历";
    }
    
    return etCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (indexPath.section == 0){
        if (indexPath.row == 0) {
        ExpectJobViewController *vc = [ExpectJobViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else{
            EditingController *editVc = [[EditingController alloc]init];
            editVc.kindTitle = @"我的优势";
            editVc.selectIndex = indexPath.row;
            editVc.delegate = self;
            MainNavigationController *vc = [[MainNavigationController alloc]initWithRootViewController:editVc];
            [self presentViewController:vc animated:YES completion:nil];
        }
        
    }
    else if (indexPath.section == 1){
        WorkExperViewController *vc = [WorkExperViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else{
        StudyExperViewController *vc = [StudyExperViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }

}

-(void)backStringToComeViewWith:(EditingController *)editVc andTag:(NSInteger)index{
//    if (![editVc.editText isEqualToString:@""]) {
//        if (index == 1) {
//            self.selectLab.text = editVc.editText;
//        }
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
