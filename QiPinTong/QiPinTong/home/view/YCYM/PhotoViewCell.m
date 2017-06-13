//
//  PhotoViewCell.m
//  家长界
//
//  Created by mac on 2016/12/8.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "PhotoViewCell.h"
#import "LWAsyncDisplayView.h"
#import "PhotoViewLayout.h"
@interface PhotoViewCell()<LWAsyncDisplayViewDelegate>

@property (nonatomic,strong) LWAsyncDisplayView* asyncDisplayView;

@end


@implementation PhotoViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.asyncDisplayView];
        
    }
    
    return self;
}

//点击LWImageStorage
- (void)lwAsyncDisplayView:(LWAsyncDisplayView *)asyncDisplayView
   didCilickedImageStorage:(LWImageStorage *)imageStorage
                     touch:(UITouch *)touch{
    NSInteger tag = imageStorage.tag;
    //tag 0~8 是图片，9是头像
    switch (tag) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:{
            if (self.clickedImageCallback) {
                self.clickedImageCallback(self,tag);
            }
        }break;
        case 9: {
           
        }break;
    }
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.asyncDisplayView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.photoLayout.photoCellHeight);
    
    
}



- (LWAsyncDisplayView *)asyncDisplayView {
    if (_asyncDisplayView) {
        return _asyncDisplayView;
    }
    _asyncDisplayView = [[LWAsyncDisplayView alloc] initWithFrame:CGRectZero];
    _asyncDisplayView.delegate = self;
    return _asyncDisplayView;
}


-(PhotoViewLayout *)photoLayout
{
    if (!_photoLayout) {
        _photoLayout = [[PhotoViewLayout alloc]initPhotoCellLayout];
        
        self.asyncDisplayView.layout = _photoLayout;
    }
    return _photoLayout;
}







@end
