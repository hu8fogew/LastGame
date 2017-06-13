




/********************* 有任何问题欢迎反馈给我 liuweiself@126.com ****************************************/
/***************  https://github.com/waynezxcv/Gallop 持续更新 ***************************/
/******************** 正在不断完善中，谢谢~  Enjoy ******************************************************/









#import "DetailCommentCell.h"
#import "LWImageStorage.h"
#import "LWAlertView.h"
#import "LWAsyncDisplayView.h"
#import "Menu.h"

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
@interface DetailCommentCell ()<LWAsyncDisplayViewDelegate>


@property (nonatomic,strong) LWAsyncDisplayView* asyncDisplayView;
@property (nonatomic ,strong) UIButton *deleteButton;
@property (nonatomic,copy) NSString* preCopyText;
@property (nonatomic,strong) UIButton *menuBtn;//打赏

@property (nonatomic ,strong) UIButton *likeButton;//点赞
@property (nonatomic ,strong) UIButton *commentButton;//评论

@property (nonatomic,strong) Menu *menu;



@end

@implementation DetailCommentCell

#pragma mark - Init

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.asyncDisplayView];
        [self.contentView addSubview:self.deleteButton];
        
        [self.contentView addSubview:self.menu];
        [self.contentView addSubview:self.menuBtn];
        [self.contentView addSubview:self.likeButton];
        [self.contentView addSubview:self.commentButton];
        
        
    }
    return self;
}

#pragma mark - LWAsyncDisplayViewDelegate

//额外的绘制
- (void)extraAsyncDisplayIncontext:(CGContextRef)context
                              size:(CGSize)size
                       isCancelled:(LWAsyncDisplayIsCanclledBlock)isCancelled {
    if (!isCancelled()) {
        CGContextMoveToPoint(context, 0.0f, self.bounds.size.height);
        CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height);
        CGContextSetLineWidth(context, 0.2f);
        CGContextSetStrokeColorWithColor(context,RGB(220.0f, 220.0f, 220.0f, 1).CGColor);
        CGContextStrokePath(context);
        if ([self.cellLayout.statusModel.type isEqualToString:MESSAGE_TYPE_WEBSITE]) {
            CGContextAddRect(context, self.cellLayout.websitePosition);
            CGContextSetFillColorWithColor(context, RGB(240, 240, 240, 1).CGColor);
            CGContextFillPath(context);
        }
    }
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
            if (self.clickedAvatarCallback) {
                self.clickedAvatarCallback(self);
            }
        }break;
    }
}

//点击LWTextStorage
- (void)lwAsyncDisplayView:(LWAsyncDisplayView *)asyncDisplayView
    didCilickedTextStorage:(LWTextStorage *)textStorage
                  linkdata:(id)data {
    //回复评论
    if ([data isKindOfClass:[NSString class]]) {
        //展开Cell
        if ([data isEqualToString:@"open"]) {
            if (self.clickedOpenCellCallback) {
                self.clickedOpenCellCallback(self);
            }
        }else if ([data isEqualToString:@"打赏通币"]){
            
            if (self.clickedCheckOutAwardCellCallback) {
                self.clickedCheckOutAwardCellCallback(self);
            }
        }else {//其他
            [LWAlertView shoWithMessage:data];
        }
    }
}


//长按内容文字
- (void)lwAsyncDisplayView:(LWAsyncDisplayView *)asyncDisplayView didLongpressedTextStorage:(LWTextStorage *)textStorage linkdata:(id)data {
    [self becomeFirstResponder];
    UIMenuItem* copyLink = [[UIMenuItem alloc] initWithTitle:@"复制"
                                                      action:@selector(copyText)];
    [[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObjects:copyLink, nil]];
    
    CGRect rect = CGRectMake(textStorage.center.x - 50.0f, textStorage.top, 100.0f, 50.0f);
    [UIMenuController sharedMenuController].arrowDirection = UIMenuControllerArrowDown;
    [[UIMenuController sharedMenuController] setTargetRect:rect inView:self];
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
    self.preCopyText = data;
}

//复制
- (void)copyText {
    UIPasteboard* pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.preCopyText;
    
    [self resignFirstResponder];
    [self.asyncDisplayView removeHighlightIfNeed];
    
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    if(action == @selector(copyText)){
        return YES;
    }
    return [super canPerformAction:action withSender:sender];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}


#pragma mark - Actions
//点击菜单按钮

- (void)onAvatar{
    
}

- (void)onMore{
    
}

-(void)deleteClick
{
    HWLog(@"删除");
    if (_delegate && [_delegate respondsToSelector:@selector(onDeleteInCell:)]) {
        [_delegate onDeleteInCell:self];
    }
    
}


#pragma mark -

- (void)layoutSubviews {
    [super layoutSubviews];
    self.asyncDisplayView.frame = CGRectMake(0,0,SCREEN_WIDTH,self.cellLayout.cellHeight);
    
    //主线程runloop空闲时执行
    LWTransaction* layerAsyncTransaction = self.layer.lw_asyncTransaction;
    [layerAsyncTransaction
     addAsyncOperationWithTarget:self
     selector:@selector(_layouSubViews)
     object:nil
     completion:^(BOOL canceled) {}];
}

- (void)_layouSubViews {
    self.deleteButton.frame = self.cellLayout.deleteFrame;
    self.menu.frame = CGRectMake(self.cellLayout.menuPosition.origin.x - 5.0f, self.cellLayout.menuPosition.origin.y, 0.0f, 34.0f);
    self.menuBtn.frame = self.cellLayout.menuPosition;
    
    self.likeButton.frame = self.cellLayout.likePosition;
    
    self.commentButton.frame = self.cellLayout.commentPosition;
    
    
}

- (void)setCellLayout:(CellLayout *)cellLayout {
    
    [self.menu menuHide];
    
    if (_cellLayout != cellLayout) {
        _cellLayout = cellLayout;
        self.asyncDisplayView.layout = self.cellLayout;
        
        //主线程runloop空闲时执行
        LWTransaction* layerAsyncTransaction = self.layer.lw_asyncTransaction;
        [layerAsyncTransaction
         addAsyncOperationWithTarget:self
         selector:@selector(_setCellLayout)
         object:nil
         completion:^(BOOL canceled) {}];
    }
}

- (void)_setCellLayout {
    
    self.menu.statusModel = self.cellLayout.statusModel;
}


#pragma mark - Getter

- (LWAsyncDisplayView *)asyncDisplayView {
    if (_asyncDisplayView) {
        return _asyncDisplayView;
    }
    _asyncDisplayView = [[LWAsyncDisplayView alloc] initWithFrame:CGRectZero];
    _asyncDisplayView.delegate = self;
    return _asyncDisplayView;
}

-(UIButton *)deleteButton
{
    if (!_deleteButton) {
        
        _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _deleteButton.frame = CGRectZero;
        
        [_deleteButton setImage:[UIImage imageNamed:@"deleteIcon"] forState:UIControlStateNormal];
        
        
        _deleteButton.backgroundColor = clearC;
        
        [_deleteButton addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return _deleteButton;
}

- (UIButton *)menuBtn {
    if (_menuBtn) {
        return _menuBtn;
    }
    _menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _menuBtn.tag = 3;
    [_menuBtn setImage:[UIImage imageNamed:@"icon_image"] forState:UIControlStateNormal];
    _menuBtn.imageEdgeInsets = UIEdgeInsetsMake(12.5f, 12.0f, 12.5f, 12.0f);
    [_menuBtn addTarget:self action:@selector(didClickedMenuButton:)
          forControlEvents:UIControlEventTouchUpInside];
    return _menuBtn;
}

-(UIButton *)likeButton
{
    if (!_likeButton) {
        _likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_likeButton setImage:[UIImage imageNamed:@"praiseSIcon"] forState:UIControlStateNormal];
        _likeButton.tag = 0;
        _likeButton.imageEdgeInsets = UIEdgeInsetsMake(12.5f, 12.0f, 12.5f, 12.0f);
        [_likeButton addTarget:self action:@selector(didClickedMenuButton:)
           forControlEvents:UIControlEventTouchUpInside];
    }
    return _likeButton;
}

-(UIButton *)commentButton
{
    if (!_commentButton) {
        _commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_commentButton setImage:[UIImage imageNamed:@"commentIcon"] forState:UIControlStateNormal];
        _commentButton.tag = 1;
        _commentButton.imageEdgeInsets = UIEdgeInsetsMake(12.5f, 12.0f, 12.5f, 12.0f);
        [_commentButton addTarget:self action:@selector(didClickedMenuButton:)
              forControlEvents:UIControlEventTouchUpInside];
    }
    return _commentButton;
}

- (Menu *)menu {
    if (_menu) {
        return _menu;
    }
    _menu = [[Menu alloc] initWithFrame:CGRectZero];
    _menu.backgroundColor = [UIColor whiteColor];
    _menu.opaque = YES;
    
    return _menu;
}


//点击菜单按钮
- (void)didClickedMenuButton:(UIButton *)sender {
    
    if (sender.tag == 0) {
        
        if (self.clickedLikeButtonCallback) {
            self.clickedLikeButtonCallback(self,!self.cellLayout.statusModel.isLike);
        }
    }else if (sender.tag == 1){
        if (self.clickedCommentButtonCallback) {
            self.clickedCommentButtonCallback(self);
            [self.menu menuHide];
        }
    }else
    {
        if (_delegate && [_delegate respondsToSelector:@selector(onAwardIncell:)]) {
            [_delegate onAwardIncell:self];
        }
    }
    
}




@end
