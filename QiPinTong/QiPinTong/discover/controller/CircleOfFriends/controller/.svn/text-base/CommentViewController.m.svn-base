//
//  CommentViewController.m
//  家长界
//
//  Created by mac on 2016/12/29.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "CommentViewController.h"
#import "ComentLayout.h"
#import "CommentCell.h"

@interface CommentViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *commentTable;

@end

@implementation CommentViewController

-(UITableView *)commentTable
{
    if (!_commentTable) {
        _commentTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _commentTable.delegate = self;
        _commentTable.dataSource = self;
        _commentTable.backgroundColor = [UIColor whiteColor];
        _commentTable.separatorStyle = UITableViewCellAccessoryNone;
    }
    return _commentTable;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加tableView
    [self.view addSubview:self.commentTable];
    
    
    
    self.view.backgroundColor = [UIColor purpleColor];
    [self setupNavigationItem];
}


- (void)setupNavigationItem {
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(jumpToPost) image:@"timeline_icon_add_friends" highImage:@"timeline_icon_add_friends"andTitle:@"评论"];
}


#pragma mark ---------commentAction
-(void)jumpToPost
{
    HWLog(@"发表评论");
    SendLifeController *vc = [SendLifeController new];
    
    NSString *comment = @"comment";
    vc.editingType = comment;
    MainNavigationController *nav = [[MainNavigationController alloc]initWithRootViewController:vc];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
    
}


#pragma mark =======实现TableView的dateSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[CommentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ComentLayout *lay = [[ComentLayout alloc]initCommentCell];
    return lay.commentHeight+1.5;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
