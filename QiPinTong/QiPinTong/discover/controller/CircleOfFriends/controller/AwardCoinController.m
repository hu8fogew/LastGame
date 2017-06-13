//
//  AwardCoinController.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/5/19.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "AwardCoinController.h"
#import "CommentCell.h"
#import "ComentLayout.h"
@interface AwardCoinController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *awardTable;

@property (nonatomic ,strong) NSMutableArray *awardArray;

@end

@implementation AwardCoinController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.awardTable];
    
#warning mark----------添加提示图片的方法调用
    //是否数组为空，若为空则显示提示图片
//    [self crectPromptViewForUserWith:self.awardArray.count == 0 andView:self.awardTable image:@""];
    
    
    
    // Do any additional setup after loading the view.
}


#pragma mark ----tableViewDelegate&&dataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[CommentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
    }
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ComentLayout *lay = [[ComentLayout alloc]initCommentCell];
    
    return lay.commentHeight;
}


#pragma mark ----懒加载
//tableView
-(UITableView *)awardTable
{
    if (!_awardTable) {
        _awardTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _awardTable.delegate = self;
        _awardTable.dataSource = self;
        _awardTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _awardTable.backgroundColor = whiteC;
    }
    return _awardTable;
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
