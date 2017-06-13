//
//  ResumeLibraryViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/5/4.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "ResumeLibraryViewController.h"

@interface ResumeLibraryViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property (strong,nonatomic) UITableView *tableView;

@end

@implementation ResumeLibraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
    
    self.navigationItem.title = @"简历库";
    
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

#pragma mark --------tableView---------
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = NO;
        _tableView.backgroundColor = whiteC;
        
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return SubCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TalentsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"co"];
    if (cell == nil) {
        cell = [[TalentsTableViewCell alloc]initWithFrame:cell.bounds];
        [cell.imgView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"classics.jpg"]];
        cell.nameLab.text = @"杜鹃";
        cell.dateLab.text = @"05-04";
        cell.jobLab.text = @"高级程序猿、UI设计师";
        cell.salaryLab.text = @"8-10k";
        cell.academicLab.text = @"大专";
        cell.experienceLab.text = @"5年";
        cell.addressLab.text = @"西安市";
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
