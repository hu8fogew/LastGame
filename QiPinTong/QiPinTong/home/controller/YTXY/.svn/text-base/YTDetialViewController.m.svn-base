//
//  YTDetialViewController.m
//  家长界
//
//  Created by taylor on 2016/12/10.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YTDetialViewController.h"

@interface YTDetialViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UIView *headerView;

@property (nonatomic,strong) UIView *footerView;

/*轮播数组*/
@property(nonatomic,strong)NSMutableArray *arrLunBo;


@end

@implementation YTDetialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 20, 20);
    [btn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [btn addTarget: self action: @selector(popToLastVC) forControlEvents: UIControlEventTouchUpInside];
    UIBarButtonItem *back=[[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = back;
    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回"] style:UIBarButtonItemStylePlain target:self action:@selector(popToLastVC)];
    
    
}

#pragma mark ++++懒加载++++

-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*1.6)];
        YTDetailHeadView *vi = [YTDetailHeadView new];
        vi.titleLabel.text = @"几点了几分都快放假没动力开放加盟的大课间麻烦";
        vi.subLabel.text = @"下降搜到";
        vi.timeLabel.text = @"12-10 12:09";
        vi.detailLabel.text = @"等级分类数据的分类是甲方魔力可激发动力就发的什么空间发呆了空间放对面路口见父母看来大家没事了就打开链接发到空间发呆了会计法迪欧基金合计房间丹佛， 积分都是浪费进口撒；就oil手机放到了手机发的VC项目VC密码降低热具体UR我家庭金融借款时间就放了多久发多少了空间发的是了解佛我了解佛我阿双方交流节日就副教授来得及覅偶是了解佛我了解佛UR我家庭金";
        vi.imgView.image = [UIImage imageNamed:@"ytdeImage"];
        vi.listTitleLabel.text = @"相关推荐";
        [_headerView addSubview:vi];
    }
    return _headerView;
}

-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_HEIGHT, 50)];
        _footerView.backgroundColor = [UIColor whiteColor];
        UIImageView *cIcon = [UIImageView new];
        cIcon.image = [UIImage imageNamed:@"评"];
        [_footerView addSubview:cIcon];
        [cIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_footerView).with.offset(10);
            make.centerY.equalTo(_footerView);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        UILabel *lab = [UILabel new];
        lab.font = [UIFont systemFontOfSize:15];
        lab.textColor = HWColor(153, 153, 153);
        lab.text = @"评一下";
        [_footerView addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_footerView);
            make.left.equalTo(cIcon.mas_right).with.offset(5);
        }];
        
        UIImageView *rIcon = [UIImageView new];
        rIcon.image = [UIImage imageNamed:@"relaynomal"];
        [_footerView addSubview:rIcon];
        [rIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_footerView).with.offset(-10);
            make.centerY.equalTo(_footerView);
            make.size.mas_equalTo(CGSizeMake(20, 23));
        }];
        
        UILabel *numLab = [UILabel new];
        numLab.textColor = HWColor(153, 153, 153);
        numLab.font = [UIFont systemFontOfSize:15];
        numLab.text = @"23";
        [_footerView addSubview:numLab];
        [numLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(rIcon.mas_left).with.offset(-10);
            make.centerY.equalTo(_footerView);
        }];
        
        UIImageView *pIcon = [UIImageView new];
        pIcon.image = [UIImage imageNamed:@"赞赞"];
        [_footerView addSubview:pIcon];
        [pIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(numLab.mas_left).with.offset(-5);
            make.centerY.equalTo(_footerView);
        }];
    }
    return _footerView;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.headerView.height;
        
        _tableView.tableFooterView = self.footerView;
        _tableView.tableFooterView.height = self.footerView.height;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 128;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifier";
    WorkGuideTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[WorkGuideTableViewCell alloc]initWithFrame:cell.bounds];
        cell.titleLabel.text = @"减肥的减肥的链接发到了空间方面的路口见父母都快来";
        cell.classLabel.text = @"专题";
        cell.noLabel.text = @"186好评";
        cell.fromLabel.text = @"来自精彩微课";
    }
    return cell;
}

-(void)popToLastVC{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
                                            

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
