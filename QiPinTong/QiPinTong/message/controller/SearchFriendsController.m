//
//  SearchFriendsController.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/5/23.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "SearchFriendsController.h"

@interface SearchFriendsController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *table;
@end

@implementation SearchFriendsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"添加好友";
    
    [self.view addSubview:self.table];
    
}

#pragma mark ---tableviewDelegate&&dataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else
    {
        return 2;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 55;
    }
    return 60;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sousou"];
        
        cell.imageView.image = [UIImage imageNamed:@"sousuo_blue"];
        
        cell.textLabel.textColor = SecondTitleColor;
        cell.textLabel.font = [UIFont systemFontOfSize:MTitleSize];
        cell.textLabel.text = @" 企聘通账号／手机号";
        return cell;
    }else
    {
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"subCell"];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.textColor = MainColor;
        
        cell.textLabel.font = [UIFont systemFontOfSize:MTitleSize];
        
        cell.detailTextLabel.textColor = SecondTitleColor;
        
        cell.detailTextLabel.font = [UIFont systemFontOfSize:subTitleSize-2];
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"扫一扫-2"];
            cell.textLabel.text = @"扫一扫";
            cell.detailTextLabel.text = @"扫瞄二维码名片";
            
        }else if (indexPath.row == 1) {
            cell.imageView.image = [UIImage imageNamed:@"通讯录"];
            cell.textLabel.text = @"手机联系人";
            cell.detailTextLabel.text = @"添加通讯录好友";
        }
        
        
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    if (indexPath.section == 0) {
        //搜索
        [LWAlertView shoWithMessage:@"搜索"];
        
    }else
    {
        if (indexPath.row == 0) {
            //扫一扫
            [self scanOtherPeoplesCode];
            
        }else
        {//通讯录添加好友
            [LWAlertView shoWithMessage:@"通讯录添加好友"];
        }
    }
}


#pragma mark ---lazy
-(UITableView *)table
{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        
        _table.delegate = self;
        _table.dataSource = self;
        _table.sectionFooterHeight = 0;
    }
    return _table;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
