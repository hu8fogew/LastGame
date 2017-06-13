//
//  StoreFormViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/3/9.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "StoreEditViewController.h"

@interface StoreEditViewController ()<UITableViewDelegate,UITableViewDataSource,EditingControllerBackStringDelegate,UIGestureRecognizerDelegate>

@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) UIView *footerView;

@property (strong,nonatomic) UIImageView *imgView;
@property (strong,nonatomic) NSMutableArray *titleAry;

@end

@implementation StoreEditViewController
id sEditCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"商户编辑";
    
    [self.view addSubview:self.tableView];
    
self.titleAry = [NSMutableArray arrayWithObjects:@"商圈",@"联系电话",@"店铺地址",@"",@"",nil];
    
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


#pragma mark /--------footerView--------/
-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 240)];
        
        UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
        saveBtn.backgroundColor = blueC;
        saveBtn.layer.masksToBounds = YES;
        saveBtn.layer.cornerRadius = 3;
        [saveBtn addTarget:self action:@selector(saveBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:saveBtn];
        [saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_footerView.mas_centerY).offset(-leftToMargin);
            make.centerX.equalTo(_footerView);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, formBtnHeight));
        }];
        
        UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [addBtn setTitle:@"新增店铺" forState:UIControlStateNormal];
        [addBtn setTitleColor:MainColor forState:UIControlStateNormal];
        addBtn.backgroundColor = grayC;
        addBtn.layer.masksToBounds = YES;
        addBtn.layer.cornerRadius = 3;
        addBtn.layer.borderColor = SecondTitleColor.CGColor;
        addBtn.layer.borderWidth = 1;
        [addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:addBtn];
        [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_footerView);
            make.top.equalTo(_footerView.mas_centerY).offset(30);
            make.size.equalTo(saveBtn);
        }];
        
    }
    return _footerView;
}

//发布按钮跳转
-(void)saveBtnClick{
    
}

-(void)addBtnClick{
    
}

#pragma mark /--------tableView--------/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = NO;
        _tableView.sectionFooterHeight = 0;
        _tableView.backgroundColor = whiteC;
        _tableView.tableFooterView = self.footerView;
        _tableView.tableFooterView.height = self.footerView.height;
    }
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0||section==2) {
        return 1;
    }
    return 2;
}

//自定义分组头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, topToMargin)];
    headView.backgroundColor = grayC;
    
    return headView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
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
    YCYMFormTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cc"];
    cell = [[YCYMFormTableViewCell alloc]initWithFrame:cell.bounds];
    sEditCell = cell;
    if (indexPath.section == 0) {
        EditFirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"c"];
        cell = [[EditFirstTableViewCell alloc]initWithFrame:cell.bounds];
        sEditCell = cell;
        cell.imgView.image = [UIImage imageNamed:@"MF"];
        self.imgView = cell.imgView;
        cell.changeLab.text = @"更换图片";
    }
    else if (indexPath.section == 1){
        cell.titleLabel.attributedText = [self attributedStr:indexPath.row==0?@"门店名称":@"经营品类"];
        cell.selectLabel.text = indexPath.row==0?@"请填写":@"请选择";
    }
    else if (indexPath.section == 2){
        cell.titleLabel.text = @"   资质认证";
        cell.selectLabel.text = @"上传";
    }
    else{
        if (indexPath.row==0) {
            cell.titleLabel.attributedText = [self attributedStr:@"联系方式"];
        }else{
            cell.titleLabel.text = @"   环境照片";
        }
        cell.selectLabel.text = indexPath.row==0?@"":@"请上传环境照片";
    }
    
    return sEditCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==0) {
        [BDImagePicker showImagePickerFromViewController:self allowsEditing:YES finishAction:^(UIImage *image) {
            if (image) {
                self.imgView.image = image;
            }
        }];
    }
    if (indexPath.section==2) {
        PhotoUploadViewController *vc = [PhotoUploadViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section==3) {
        if (indexPath.row==0) {
            ContactWayViewController *vc = [ContactWayViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            
        }
        
    }
    else{
        
    }
}

-(void)backStringToComeViewWith:(EditingController *)editVc andTag:(NSInteger)index{
//    if (index==0||index==2||index==3) {
//        if (![editVc.editText isEqualToString:@""]) {
//            [self.sLabelAry replaceObjectAtIndex:index withObject:editVc.editText];
//            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:index inSection:0], nil] withRowAnimation:UITableViewRowAnimationNone];
//        }
//        
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
