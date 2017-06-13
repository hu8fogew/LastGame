//
//  MessageViewController.m
//  家长界
//
//  Created by 张波 on 2016/11/7.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import "MessageViewController.h"
#import "ChatViewController.h"
#import "SearchFriendsController.h"
@interface MessageViewController ()<YBPopupMenuDelegate>

@property (nonatomic,strong) UIButton *btnNvc;

@property (nonatomic ,strong) NSFetchedResultsController *fetchResult;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的消息";
    
    [self.navigationController.navigationBar setBarTintColor:blueC];

    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:whiteC}];
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE)]];
    self.conversationListTableView.tableFooterView = [UIView new];
    self.showConnectingStatusOnNavigatorBar = YES;
    self.isShowNetworkIndicatorView = YES;
    
    [self setupNav];
    
    NSString *token = @"z8R4Rrx4HEM1W5Dj9QM2RAYYofz8p7x0yigxTEVxyCgVyacMpBlRQ0x5opmqubxUNKbLzOHqsLeIDykMso3NfA==";
    [self connectToIMWithToken:token];
    
    
}

- (void)connectToIMWithToken:(NSString *)token
    {
        
        [[RCIM sharedRCIM] connectWithToken:token success:^(NSString *userId) {
            [self loginSuccessWithToken:token];
            
            
        } error:^(RCConnectErrorCode status) {
            if (status == RC_CONNECTION_EXIST) {
                [self loginSuccessWithToken:token];
            }else
            {
                [LWAlertView shoWithMessage:@"login failed!token is over time"];
            }
            
        } tokenIncorrect:^{
            [LWAlertView shoWithMessage:@"login failed!token is over time"];
        }];
        
        
    }



//登录
-(void)loginSuccessWithToken:(NSString *)token
{
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"com.ccp.im"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}





-(void)setupNav
{
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    
    [btn setImage:[UIImage imageNamed:@"add_icon_nav"] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(addUser) forControlEvents:UIControlEventTouchUpInside];
    
    btn.frame = CGRectMake(SCREEN_WIDTH-50, 0, 40, 40);
    
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
    
    btn.backgroundColor = clearC;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    self.btnNvc = btn;
    
    self.navigationItem.rightBarButtonItem = item;
    
    
}
//进入聊天界面
-(void)addUser
{
    
    
    
    
//    YBPopupMenu *menuVc = [YBPopupMenu showRelyOnView:self.btnNvc.imageView titles:@[@"加好友",@"聊天"] icons:nil menuWidth:80 delegate:self];
    
    YBPopupMenu *menuPop = [YBPopupMenu showAtPoint:CGPointMake(self.btnNvc.x+self.btnNvc.imageView.centerX, 67) titles:@[@"通讯录",@"加好友",@"聊一聊"] icons:nil menuWidth:80 delegate:self];
    
    menuPop.type = YBPopupMenuTypeDefault;
    
    
    
    /*
    
    */
}

#pragma mark YBPopMenuDelegate
-(void)ybPopupMenuDidSelectedAtIndex:(NSInteger)index ybPopupMenu:(YBPopupMenu *)ybPopupMenu
{
    NSLog(@"%zd",index);
    if (index == 0) {
        //通讯录
        AddressBookViewController *vc = [[AddressBookViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
    if (index == 1) {
        //加好友
        SearchFriendsController *vc = [[SearchFriendsController alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];
        
//        [LWAlertView shoWithMessage:@"****加好友****"];
        
        
    }
    if (index == 2) {
        //聊天
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
    
}



-(void)back:(UIBarButtonItem *)item
{
    
    NSString *token = @"z8R4Rrx4HEM1W5Dj9QM2RAYYofz8p7x0yigxTEVxyCgVyacMpBlRQ0x5opmqubxUNKbLzOHqsLeIDykMso3NfA==";
    [self connectToIMWithToken:token];
}

-(void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath
{
    ChatViewController *chatVc = [[ChatViewController alloc]init];
    chatVc.conversationType = model.conversationType;
    chatVc.targetId = model.targetId;
    chatVc.title = model.conversationTitle;
    
    [self.navigationController pushViewController:chatVc animated:YES];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
