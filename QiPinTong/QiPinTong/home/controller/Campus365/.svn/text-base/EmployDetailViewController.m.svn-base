
//
//  EmployDetailViewController.m
//  家长界
//
//  Created by taylor on 2016/11/30.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "EmployDetailViewController.h"

@interface EmployDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *headerView;

@end

@implementation EmployDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
}

-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.65+10)];

        EmployDetailView *vi = [EmployDetailView new];
        vi.titleLabel.text = @"2016年丝绸之路人才交流会";
        vi.addressLabel.text = @"中国.西安";
        vi.timeLabel.text = @"2016-11-20";
        vi.imgView.image = [UIImage imageNamed:@"hh"];
        
        [_headerView addSubview:vi];
    }
    return _headerView;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.headerView.height;
    }
    return _tableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSInteger rows = 0;
    switch (section) {
        case 0:
            rows = 4;
            break;
         case 1:
            rows = 1;
            break;
        default:
            rows = 1;
            break;
    }
    
    return rows;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        return 40;
    }
    else if (indexPath.section == 1){
        return 200;
    }
    else{
        
        return 120;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifier";
    if (indexPath.section == 0) {
            employFirstTableViewCell *firstCell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (firstCell == nil) {
                firstCell = [[employFirstTableViewCell alloc]initWithFrame:firstCell.bounds];
            }
        
        if (indexPath.row == 0) {
            firstCell.titleLabel.text = @"会期";
            firstCell.detailLabel.text = @"2016-11-15至11-23";
        }
        else if (indexPath.row == 1){
            firstCell.titleLabel.text = @"费用";
            firstCell.detailLabel.text = @"400元/场次";
        }
        else if (indexPath.row == 2){
            firstCell.titleLabel.text = @"类型";
            firstCell.detailLabel.text = @"综合招聘会";
        }
        else{
            firstCell.titleLabel.text = @"服务";
            firstCell.detailLabel.text = @"标准展位+海报+午餐";
        }
        return firstCell;
    }
    else if (indexPath.section == 1){
            employSecondTableViewCell *secondCell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (secondCell == nil) {
                secondCell = [[employSecondTableViewCell alloc]initWithFrame:secondCell.bounds];
                secondCell.titleLabel.text = @"参会须知";
                secondCell.detailLabel.text = @"建布局对象flowlaout的属性，横向滑动接下来就在创建collectionView的时候初始化，就很方便了（能直接带上layout）_myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 200, 320, 280) collectionViewLayout:flowLayout];建布局对象flowlaout的属性，横向滑动接下来就在创建collectionView的时候初始化，就很方便了（能直接带上layout";
            }
            return secondCell;
    }
    else{
       
        employThreeTableViewCell *thirdCell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (thirdCell == nil) {
            thirdCell = [[employThreeTableViewCell alloc]initWithFrame:thirdCell.bounds];
            thirdCell.contactLabel.text = @"联系方式";
            thirdCell.addressLabel.text = @"西安市南三环i都会";
            
        }
        return thirdCell;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
