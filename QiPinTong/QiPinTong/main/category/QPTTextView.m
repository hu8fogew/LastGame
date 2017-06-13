//
//  QPTTextView.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/5/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "QPTTextView.h"


@interface QPTTextView()

@property (nonatomic, strong) UILabel *placeholderLabel;

@end


@implementation QPTTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self addSubview:self.placeholderLabel];
        self.alwaysBounceVertical = YES;
        self.font = [UIFont systemFontOfSize:14.0];
        self.placeholderColor = [UIColor grayColor];
        self.placeholderLabel.frame = CGRectMake(5, 10, 0, 0);
        // 监听文字改变
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}


#pragma mark - API
- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    self.placeholderLabel.font = font;
    [self computePlaceholderLabelSize];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    self.placeholderLabel.textColor = placeholderColor;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = [placeholder copy];
    self.placeholderLabel.text = placeholder;
    [self computePlaceholderLabelSize];
}

- (void)setPlaceHolderOffsetX:(CGFloat)placeHolderOffsetX
{
    _placeHolderOffsetX = placeHolderOffsetX;
    [self computePlaceholderLabelSize];
}

- (void)setPlaceHolderOffsetY:(CGFloat)placeHolderOffsetY
{
    _placeHolderOffsetY = placeHolderOffsetY;
    [self computePlaceholderLabelSize];
}

- (void)setCursorOffset:(UIOffset)cursorOffset
{
    _cursorOffset = cursorOffset;
    self.textContainerInset = UIEdgeInsetsMake(cursorOffset.vertical, cursorOffset.horizontal, cursorOffset.vertical,cursorOffset.horizontal);
}

- (void)setPlaceHolderHidden:(BOOL)placeHolderHidden
{
    _placeHolderHidden = placeHolderHidden;
    self.placeholderLabel.hidden = placeHolderHidden;
}


-(void)setContentSize:(CGSize)contentSize
{
    CGSize oriSize = self.contentSize;
    [super setContentSize:contentSize];
    if(oriSize.height != self.contentSize.height){
        CGRect newFrame = self.frame;
        newFrame.size.height = self.contentSize.height;
        self.frame = newFrame;
        if([self.sizeDelegate respondsToSelector:@selector(textView:heightChanged:)]){
            [self.sizeDelegate textView:self heightChanged:floorf(self.contentSize.height - oriSize.height)];
        }
    }
    
    
    
}


#pragma mark - hanlde
-(void)computePlaceholderLabelSize
{
    CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width - 2 * (self.placeholderLabel.frame.origin.x - self.placeHolderOffsetX);
    CGSize maxSize = CGSizeMake(maxWidth, MAXFLOAT);
    CGSize computeSize = [self.placeholder boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : self.font} context:nil].size;
    
    CGRect frame = self.placeholderLabel.frame;
    frame.size = computeSize;
    frame.origin.x = self.placeHolderOffsetX + frame.origin.x;
    frame.origin.y = self.placeHolderOffsetY + frame.origin.y;
    self.placeholderLabel.frame = frame;
}

- (void)textDidChange
{
    self.placeHolderHidden = self.hasText;
}

#pragma mark - lazy
- (UILabel *)placeholderLabel
{
    if (!_placeholderLabel) {
        // 添加一个用来显示占位文字的label
        _placeholderLabel = [[UILabel alloc] init];
        _placeholderLabel.numberOfLines = 0;
    }
    return _placeholderLabel;
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
