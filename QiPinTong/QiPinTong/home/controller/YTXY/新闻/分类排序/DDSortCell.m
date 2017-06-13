//
//  DDSortCell.m
//  DDNews
//
//  Created by Dvel on 16/4/15.
//  Copyright © 2016年 Dvel. All rights reserved.
//

#import "DDSortCell.h"

@implementation DDSortCell

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
        self.backgroundColor = whiteC;
		self.button = [[CustomButton alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
		[self addSubview:self.button];
        
        
        self.delOrAddBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.delOrAddBtn setImage:[UIImage imageNamed:@"minus_gray"] forState:UIControlStateNormal];
        [self.delOrAddBtn setImage:[UIImage imageNamed:@"add_gray"] forState:UIControlStateSelected];
        self.delOrAddBtn.hidden = YES;
        [self addSubview:self.delOrAddBtn];
        [self.delOrAddBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.right.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(24, 24));
        }];
	}
    
	return self;
}


@end
