//
//  PersonInformationCell.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/5/22.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "PersonInformationCell.h"


@interface PersonInformationCell ()<LWAsyncDisplayViewDelegate>

@property (nonatomic,strong)LWAsyncDisplayView *asycView;


@end

@implementation PersonInformationCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = whiteC;
        
        [self.contentView addSubview:self.asycView];
        
    }
    return self;
}


-(void)lwAsyncDisplayView:(LWAsyncDisplayView *)asyncDisplayView didCilickedImageStorage:(LWImageStorage *)imageStorage touch:(UITouch *)touch
{
    if (imageStorage.tag == 1001) {
        [LWAlertView shoWithMessage:@"查看头像"];
    }
    
    
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    self.asycView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.inforLay.HeaderCellHeight);
    
}


-(LWAsyncDisplayView *)asycView
{
    if (!_asycView) {
        _asycView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        
        _asycView.delegate = self;
        
    }
    return _asycView;
}

-(PersonInformationLay *)inforLay
{
    if (!_inforLay) {
        _inforLay = [[PersonInformationLay alloc]initPersonInformation];
        
        self.asycView.layout = self.inforLay;
        
    }
    return _inforLay;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
