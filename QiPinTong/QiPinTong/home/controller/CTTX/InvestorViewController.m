//
//  InvestorViewController.m
//  家长界
//
//  Created by taylor on 2016/12/15.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "InvestorViewController.h"

#import "InvestorDescView.h"

@interface InvestorViewController ()<UITableViewDelegate,UITableViewDataSource>

/**tableview的headerview*/
@property (strong,nonatomic) UIView *headerView;

/**tableview*/
@property (strong,nonatomic) UITableView *tableView;

@property(nonatomic,strong) InvestorDescView *descView;

/*底部按钮视图*/
@property (strong,nonatomic) UIView *bottomView;

@end

@implementation InvestorViewController

id investCell = nil;

-(InvestorDescView *)descView
{
    if (!_descView) {
        InvestmentLayout *lay = [[InvestmentLayout alloc]initInvestmentPersonDescView];
        _descView = [[InvestorDescView alloc]initWithFrame:CGRectMake(0, self.headerView.botoom, SCREEN_WIDTH, lay.investorViewHeight)];
        
    }
    return _descView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"投资人详情";

    [self.view addSubview:self.tableView];
    [self.headerView addSubview:self.descView];
    [self.view addSubview:self.bottomView];
}

#pragma mark -----懒加载------
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.46)];
        InvestorHeadView *vi = [[InvestorHeadView alloc]initWithFrame:_headerView.bounds];
        vi.backImageView.image = [UIImage imageNamed:@"deBackView"];
        vi.imgView.image = [UIImage imageNamed:@"perImage.jpg"];
        vi.nameLabel.text = @"韩雪冬";
        vi.fundLabel.text = @"银江资本";
        vi.jobLabel.text = @"投资经理";
        vi.addressIcon.image = [UIImage imageNamed:@"wlocationIcon"];
        vi.addressLabel.text = @"西安";
        [_headerView addSubview:vi];
    }
    return _headerView;
}

-(UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-60-64, SCREEN_WIDTH, 60)];
        _bottomView.backgroundColor = whiteC;
        NSArray *icon = @[@"关注",@"好友",@"咨询"];
        NSArray *title = @[@"加关注",@"加好友",@"立即咨询"];
        NSArray *color = @[blueC,HWColor(139, 195, 62),orangeC];
        for (int i = 0; i < 3; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(10+i*(SCREEN_WIDTH-40)/3+i*10, 15, (SCREEN_WIDTH-40)/3, 30);
            btn.layer.masksToBounds = YES;
            btn.layer.cornerRadius = 3;
            btn.titleLabel.font = [UIFont systemFontOfSize:mainTitleSize];
            btn.imageView.size = CGSizeMake(16, 16);
            [btn setTitle:title[i] forState:UIControlStateNormal];
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, -3, 0, 3);
            btn.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, -3);
            btn.adjustsImageWhenHighlighted = NO;
            [btn setImage:[UIImage imageNamed:icon[i]] forState:UIControlStateNormal];
            [btn setBackgroundColor:color[i]];
            [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
            
            [_bottomView addSubview:btn];
        }
        
    }
    return _bottomView;
}

-(void)clickBtn:(UIButton *)sender{
    if (sender.tag == 0) {
        
    }
    else if (sender.tag == 1){
        
    }
    else{
        
    }
}

#pragma mark ------tableview及方法------
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-60-64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.descView.botoom;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView.allowsSelection = NO;
    }
    
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
        return SCREEN_WIDTH*0.32;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifier";
        InvestorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[InvestorTableViewCell alloc]initWithFrame:cell.bounds];
            investCell = cell;
            cell.nameLabel.text = @"投资机构";
            cell.imgView.image = [UIImage imageNamed:@"comImage.jpg"];
            cell.titleLabel.text = @"中国银江投资集团";
            cell.vIcon.image = [UIImage imageNamed:@"vip"];
            cell.fieldLabel.text = @"领域 : 社交、电子商务、媒体分类";
            cell.numberLabel.text = @"5位投资人";
            
            [cell.arrowIcon setImage:[UIImage imageNamed:@"rgrayArrowIcon"] forState:UIControlStateNormal];
            [cell.arrowIcon addTarget:self action:@selector(clickArrowBtn) forControlEvents:UIControlEventTouchUpInside];
        }
    return investCell;
}

-(void)clickArrowBtn{
    
    InstiDetailViewController *vc = [InstiDetailViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
