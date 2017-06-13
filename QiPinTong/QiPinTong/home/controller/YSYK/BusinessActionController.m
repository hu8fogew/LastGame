//
//  BusinessActionController.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/6/1.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "BusinessActionController.h"
#import "ActionDetialCell.h"
@interface BusinessActionController ()<UITableViewDelegate,UITableViewDataSource,ActionDetialCellDelegate>

@property (nonatomic ,strong) UITableView *table;

@end

@implementation BusinessActionController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"商家活动";
    self.view.backgroundColor = whiteC;
    
    [self.view addSubview:self.table];
    
    
}




#pragma mark ---TableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YSYKLayout *lay = [[YSYKLayout alloc]initDetailAction];
    return lay.detailActionHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActionDetialCell *cell = [[ActionDetialCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    [self configCell:cell atIndexPath:indexPath];
    
    
    
    return cell;
}

-(void)configCell:(ActionDetialCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.delegate = self;
    __weak typeof(self) weakSelf = self;
    cell.clickedImageCall = ^(ActionDetialCell *cell, NSInteger imageIndex) {
      
        __strong typeof(weakSelf) sself = weakSelf;
        [sself tableViewCell:cell showImageBrowserWithImageIndex:imageIndex];
        
        
        
    };
    
    
}


- (void)tableViewCell:(ActionDetialCell *)cell showImageBrowserWithImageIndex:(NSInteger)imageIndex {
    NSMutableArray* tmps = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < cell.detialAction.photoPosition.count; i ++) {
        LWImageBrowserModel* model = [[LWImageBrowserModel alloc]
                                      initWithplaceholder:nil
                                      thumbnailURL:[NSURL URLWithString:[cell.detialAction.imageArr objectAtIndex:i]]
                                      HDURL:[NSURL URLWithString:[cell.detialAction.imageArr objectAtIndex:i]]
                                      containerView:cell.contentView
                                      positionInContainer:CGRectFromString(cell.detialAction.photoPosition[i])
                                      index:i];
        [tmps addObject:model];
    }
    LWImageBrowser* browser = [[LWImageBrowser alloc] initWithImageBrowserModels:tmps
                                                                    currentIndex:imageIndex];
    [browser show];
}

-(void)enterPersonDetialViewFrom:(ActionDetialCell *)cell andIndexPath:(NSIndexPath *)indexPath
{
    YCComDeViewController *comVc = [YCComDeViewController new];
    
    [self.navigationController pushViewController:comVc animated:YES];
}

#pragma mark ----Lazy
-(UITableView *)table
{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        
        _table.backgroundColor = whiteC;
        
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        
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
