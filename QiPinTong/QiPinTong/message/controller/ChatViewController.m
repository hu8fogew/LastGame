//
//  ChatViewController.m
//  QiPinTong
//
//  Created by mac on 2017/3/28.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()
@property(nonatomic,strong)RCPluginBoardView *boardView;
@end

@implementation ChatViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.chatSessionInputBarControl.pluginBoardView insertItemWithImage:[UIImage imageNamed:@"redPackage"] title:@"赏通币" tag:1004];
    
}

-(void)didTapCellPortrait:(NSString *)userId
{
    
    PersonalInformationDetial *vc = [[PersonalInformationDetial alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
    HWLog(@"%@",userId);
//
//    [LWAlertView shoWithMessage:userId];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
