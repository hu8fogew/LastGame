//
//  PartDetailViewController.m
//  家长界
//
//  Created by taylor on 2016/12/15.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "PartDetailViewController.h"

@interface PartDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

/**tableview的headerview*/
@property (strong,nonatomic) UIView *headerView;

/**tableview*/
@property (strong,nonatomic) UITableView *tableView;

/*底部按钮视图*/
@property (strong,nonatomic) UIView *bottomView;

@end

@implementation PartDetailViewController

id partnerCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"合伙人详情";
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
}

#pragma mark -----懒加载------
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.46)];
        PartDeHeadView *vi = [[PartDeHeadView alloc]initWithFrame:_headerView.bounds];
        vi.backImageView.image = [UIImage imageNamed:@"deBackView"];
        vi.imgView.image = [UIImage imageNamed:@"perImage.jpg"];
        vi.nameLabel.text = @"童曼秀";
        vi.industryLabel.text = @"演员界";
        vi.wantLabel.text = @"寻求出演";
        vi.amountLabel.text = @"友情价 : 5W";
        vi.infoLabel.text = @"个人信息 : 23岁";
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
        _tableView.tableHeaderView.height = self.headerView.height;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GoodProjectLayout *layout = [[GoodProjectLayout alloc]initPartnerDetialCell];
    return layout.partnerCellHeight;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifier";
    GoodDeSecondTableViewCell *cell = [[GoodDeSecondTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
