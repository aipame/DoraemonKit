//
//  DoraemonBaseBigTitleView.m
//  DoraemonKit-DoraemonKit
//
//  Created by yixiang on 2018/12/2.
//

#import "DoraemonBaseBigTitleView.h"
#import "DoraemonDefine.h"
#import "UIView+Doraemon.h"
#import "UIColor+Doraemon.h"
#import "UIImage+Doraemon.h"

@interface DoraemonBaseBigTitleView()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) UIView *downLine;

@end

@implementation DoraemonBaseBigTitleView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kDoraemonSizeFrom750(32), self.doraemon_height/2-kDoraemonSizeFrom750(67)/2, self.doraemon_width-kDoraemonSizeFrom750(32)-self.doraemon_height, kDoraemonSizeFrom750(67))];
        _titleLabel.textColor = [UIColor doraemon_colorWithString:@"#324456"];
        _titleLabel.font = [UIFont systemFontOfSize:kDoraemonSizeFrom750(48)];
        [self addSubview:_titleLabel];
        
        _closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.doraemon_width-self.doraemon_height, 0, self.doraemon_height, self.doraemon_height)];
        _closeBtn.imageView.contentMode = UIViewContentModeCenter;
        [_closeBtn setImage:[UIImage doraemon_imageNamed:@"doraemon_close"] forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(closeClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_closeBtn];
        
        _downLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.doraemon_height-kDoraemonSizeFrom750(1), self.doraemon_width, kDoraemonSizeFrom750(1))];
        _downLine.backgroundColor = [UIColor doraemon_colorWithHex:0x000000 andAlpha:0.1];
        [self addSubview:_downLine];
    }
    return self;
}

- (void)setTitle:(NSString *)title{
    _title = title;
    _titleLabel.text = _title;
}

- (void)closeClick{
    if (self.delegate && [self.delegate respondsToSelector:@selector(bigTitleCloseClick)]) {
        [self.delegate bigTitleCloseClick];
    }
}

@end
