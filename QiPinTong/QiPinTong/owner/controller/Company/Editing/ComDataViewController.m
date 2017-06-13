//
//  ComDataViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/3/16.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "ComDataViewController.h"

@interface ComDataViewController ()<UITableViewDelegate,UITableViewDataSource,EditingControllerBackStringDelegate>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *footerView;

@property (strong,nonatomic) NSMutableArray *titleAry;
@property (strong,nonatomic) NSMutableArray *sLabAry;

@property (strong,nonatomic) UIImageView *imgView;

@property (assign,nonatomic) NSInteger indexS;

@property (strong,nonatomic) NSMutableArray *contactTitleAry;

@end

@implementation ComDataViewController

id daCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    self.navigationItem.title = @"基础资料";
    
     self.contactTitleAry = [NSMutableArray arrayWithObjects:@"联系人",@"联系人职务",@"联系电话",@"   企业官网",@"企业地址",@"",@"",nil];

    self.titleAry = [NSMutableArray arrayWithObjects:@"企业全称",@"企业简称",@"所属行业",@"   企业性质",@"企业规模",@"   企业亮点",@"发展阶段",@"   企业介绍", nil];
    self.sLabAry = [NSMutableArray arrayWithObjects:@"请填写",@"请填写",@"请选择",@"请选择",@"请选择",@"请选择",@"请选择",@"请填写", nil];
}

#pragma mark /--------footerView--------/
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
            make.centerX.equalTo(_footerView);
            make.bottom.mas_equalTo(-leftToMargin);
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
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = self.footerView;
        _tableView.tableFooterView.height = self.footerView.height;
        _tableView.sectionFooterHeight = 0;
        _tableView.backgroundColor = whiteC;
        _tableView.separatorStyle = NO;
    }
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSInteger rows = 0;
    
    if (section == 1) {
        rows = 6;
    }
    else if (section==4) {
        rows = 2;
    }
    else{
        rows = 1;
    }
    
    return rows;
}

//自定义分组头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, topToMargin)];
    headView.backgroundColor = grayC;
    
    return headView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return topToMargin;
    }
    return leftToMargin;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return SubCellHeight;
    }
    
    return formCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YCYMFormTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ce"];
    cell = [[YCYMFormTableViewCell alloc]initWithFrame:cell.bounds];
    daCell = cell;
    if (indexPath.section == 0) {
        EditFirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"c"];
        cell = [[EditFirstTableViewCell alloc]initWithFrame:cell.bounds];
        daCell = cell;
        cell.imgView.image = [UIImage imageNamed:@"MF"];
        self.imgView = cell.imgView;
        cell.changeLab.text = @"更换图片";
    }
    else if  (indexPath.section == 1) {
        cell.selectLabel.text = self.sLabAry[indexPath.row];
        if (indexPath.row==3||indexPath.row==5) {
            cell.titleLabel.text = self.titleAry[indexPath.row];
        }else{
            cell.titleLabel.attributedText = [self attributedStr:self.titleAry[indexPath.row]];
        }
    }
    else if (indexPath.section==2||indexPath.section==3) {
        cell.titleLabel.attributedText = [self attributedStr: indexPath.section==2?@"形象墙":@"联系方式"];
        cell.selectLabel.text = indexPath.section==2?@"上传":nil;
    }
    else {
        if (indexPath.row==0) {
            cell.titleLabel.attributedText = [self attributedStr:self.titleAry[indexPath.row+6]];
        }else{
            cell.titleLabel.text = self.titleAry[indexPath.row+6];
        }
        cell.selectLabel.text = self.sLabAry[indexPath.row+6];
    }
    return daCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.indexS = indexPath.section;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        [BDImagePicker showImagePickerFromViewController:self allowsEditing:YES finishAction:^(UIImage *image) {
            if (image){
                self.imgView.image = image;
            }
        }];
    }
    else if (indexPath.section==1) {
        if (indexPath.row==0||indexPath.row==1) {
            EditingController *editVc = [[EditingController alloc]init];
            editVc.kindTitle = @[@"企业全称",@"企业简称"][indexPath.row];
            editVc.selectIndex = indexPath.row;
            editVc.delegate = self;
            MainNavigationController *vc = [[MainNavigationController alloc]initWithRootViewController:editVc];
            [self presentViewController:vc animated:YES completion:nil];
        }
        else{
            
        }
    }
    else if (indexPath.section==2) {
        YCYMFormTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        [BDImagePicker showImagePickerFromViewController:self allowsEditing:YES finishAction:^(UIImage *image) {
            if (image) {
                
                cell.imgView.image = image;
            }
        }];
    }
    else if (indexPath.section==3) {
        ContactInfoViewController *vc = [ContactInfoViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    else if (indexPath.section==4) {
        if (indexPath.row==0) {
            SingleSelectView *sinle = [[SingleSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectTtitle:@"" TitleArr:@[@"未融资",@"天使轮",@"A轮",@"B轮",@"C轮",@"D轮及以上",@"已上市",@"不需要融资"]];
            [sinle showView:^(NSString *singleStr) {
                [self.sLabAry replaceObjectAtIndex:indexPath.row+6 withObject:singleStr];
                [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:0 inSection:4],nil] withRowAnimation:UITableViewRowAnimationNone];
            }];
            
        }
        else{
            EditingController *editVc = [[EditingController alloc]init];
            editVc.kindTitle = @"企业介绍";
            editVc.selectIndex = indexPath.row;
            editVc.delegate = self;
            MainNavigationController *vc = [[MainNavigationController alloc]initWithRootViewController:editVc];
            [self presentViewController:vc animated:YES completion:nil];
        }
    }
}

-(void)backStringToComeViewWith:(EditingController *)editVc andTag:(NSInteger)index
{
//    HWLog(@"=======%@",editVc.editText);
//    
//    HWLog(@"=------%zd",index);
//    if (![editVc.editText isEqualToString:@""]) {
//        if (index == 0||index == 1) {
//            [self.sLabAry replaceObjectAtIndex:self.indexS==1?index:7 withObject:editVc.editText];
//            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:self.indexS==1?index:1 inSection:self.indexS==1?1:4],nil] withRowAnimation:UITableViewRowAnimationNone];
//        
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
