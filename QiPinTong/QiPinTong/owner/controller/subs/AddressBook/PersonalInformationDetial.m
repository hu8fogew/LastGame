//
//  PersonalInformationDetial.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/5/20.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "PersonalInformationDetial.h"

#import "PersonInformationLay.h"
#import "PersonInformationCell.h"
#import "SendMessageCell.h"
#import "ChatViewController.h"
@interface PersonalInformationDetial ()<UITableViewDelegate,UITableViewDataSource,SendMessageDelegate>

@property (nonatomic ,strong) UITableView *tableView;

@property (nonatomic ,copy) NSString *locationStr;

@end

@implementation PersonalInformationDetial

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationStr = @"";
    [self.view addSubview:self.tableView];
    
}

#pragma mark

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else if (section == 1) {
        return 1;
    }else if (section == 2) {
        return 2;
    }else{
        return 1;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = whiteC;
    if (indexPath.section == 0) {
        PersonInformationCell *personCell = [[PersonInformationCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"person"];
        personCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return personCell;
        
    }else if (indexPath.section == 1){
        cell.textLabel.text = @"修改备注";
    }else if (indexPath.section == 2) {
        
        if (indexPath.row == 0) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.textLabel.text = [self.locationStr isEqualToString:@""] ? @"地区           拉斯维加斯":[NSString stringWithFormat:@"地区       %@",self.locationStr];
//            cell.textLabel.text = [NSString stringWithFormat:@"地区       %@",self.locationStr];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }else
        {
            
            cell.textLabel.text = @"相册";
            
        }
    }else
    {
        SendMessageCell *sendCell = [[SendMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sendCell"];
        
        sendCell.buttonStyleString = @"发消息";
        sendCell.delegate = self;
        return sendCell;
        
    }
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        PersonInformationLay *lay = [[PersonInformationLay alloc]initPersonInformation];
        return lay.HeaderCellHeight;
    }else
    {
        return 44;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 20;
    }else{
        return 0;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 3) {
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    }else{
       [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    
    if (indexPath.section == 2) {
        if (indexPath.row == 1) {
            
            YCPersonDeViewController *vc = [[YCPersonDeViewController alloc]init];
            
            vc.segStr = @"相册";
            
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    if (indexPath.section == 1) {
        
        EditingController *edit = [[EditingController alloc]init];
        edit.kindTitle = @"修改备注";
        
        edit.writeText = ^(NSString *WriteText) {
            
            HWLog(@"%@",WriteText);
            WeakSelf(self);
            self.locationStr = WriteText;
            [self.tableView reloadData];
            
        };
        MainNavigationController *nav = [[MainNavigationController alloc]initWithRootViewController:edit];
        
        [self presentViewController:nav animated:YES completion:nil];
        
        
    }
    
    
}

#pragma mark ----发消息

-(void)sendMessageWith:(SendMessageCell *)cell
{
    NSString *userid = @"001";
    NSString *name = @"企聘通用户";
    
    if ([[[RCIMClient sharedRCIMClient] currentUserInfo].userId isEqualToString:userid]) {
        userid = @"002";
        name = @"企聘通客服";
    }
    
    ChatViewController *chatVc = [[ChatViewController alloc]init];
    //设置聊天模式（单聊、群聊）
    chatVc.conversationType = ConversationType_PRIVATE;
    //设置用户
    chatVc.targetId = userid;
    
    chatVc.title = name;
    
    [self.navigationController pushViewController:chatVc animated:YES];
    
}


#pragma mark ------lazy

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.sectionFooterHeight = 0;
        
        
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
