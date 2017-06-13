//
//  CompanyShowViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/3/8.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "ComShowViewController.h"

@interface ComShowViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property (strong,nonatomic) UITableView *tableView;

@end

@implementation ComShowViewController

id seleCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.selectIndex==101) {
        self.navigationItem.title = @"收到的简历";
    }
    if (self.selectIndex==102) {
        self.navigationItem.title = @"我的收藏";
    }
    
    [self.view addSubview:self.tableView];
    
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

#pragma mark /--------tableView--------/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = NO;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat cellH = 0;
    if (self.selectIndex == 102)
    {
        MessageLayout *messageLay = [[MessageLayout alloc]initMessageCell];
        cellH = messageLay.messageCellHeight;
    }
    else{
        cellH = DeCellHeight;
    }

    return cellH;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     if (self.selectIndex == 101)
    {
        ResumeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cc"];
        cell = [[ResumeTableViewCell alloc]initWithFrame:cell.bounds];
        cell.nameLab.text = @"张苗仔";
        cell.postLab.text = @"应聘岗位: 软件工程师";
        cell.arrowIcon.image = [UIImage imageNamed:@"rgrayArrowIcon"];
        cell.dateLab.text = @"2017-03-10";
        cell.educaLab.text = @"大专";
        cell.ageLab.text = @"3年";
        cell.addressLab.text = @"西安市雁塔区唐延南路";
        seleCell = cell;
    }
    else
    {
        MessageTableViewCell *cell = [[MessageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"messageCell"];
        seleCell = cell;
    }
    return seleCell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
