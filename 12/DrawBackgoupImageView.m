//
//  DrawBackgoupImageView.m
//  12
//
//  Created by 吴灶洲 on 2017/5/22.
//  Copyright © 2017年 吴灶洲. All rights reserved.
//

#import "DrawBackgoupImageView.h"
#import "DrawTouchPointView.h"

@interface DrawBackgoupImageView()
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, strong) DrawTouchPointView *drawView;
@end

@implementation DrawBackgoupImageView

+ (DrawBackgoupImageView *)initWithImage:(UIImage *)image frame:(CGRect)frame lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor {
    DrawBackgoupImageView *backGourp = [[DrawBackgoupImageView alloc] initWithFrame:frame];
    backGourp.frame = frame;
    backGourp.image = image;
    backGourp.lineColor = lineColor;
    backGourp.lineWidth = lineWidth;
    return backGourp;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self addControl];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addControl];
    }
    return self;
}

//添加控件
- (void)addControl {
    _drawView = [[DrawTouchPointView alloc] initWithFrame:self.bounds];
    [self addSubview:_drawView];
    self.userInteractionEnabled = YES;
}

- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    [self setStrokeColor:lineColor];
}

- (void)setLineWidth:(CGFloat)lineWidth {
    _lineWidth = lineWidth;
    [self setStrokeWidth:lineWidth];
}

/** 清屏 */
- (void)clearScreen {
    [_drawView clearScreen];
}

/** 撤消操作 */
- (void)revokeScreen {
    [_drawView revokeScreen];
}

/** 擦除 */
- (void)eraseSreen {
    [_drawView eraseSreen];
}

/** 设置画笔颜色 */
- (void)setStrokeColor:(UIColor *)lineColor {
    [_drawView setStrokeColor:lineColor];
}

/** 设置画笔大小 */
- (void)setStrokeWidth:(CGFloat)lineWidth {
    [_drawView setStrokeWidth:lineWidth];
}

/** 获取图片 */
- (UIImage *)getImage {
    
    //1.开启一个位图上下文
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 1);
    //2.把画板上的内容渲染到上下文当中
    CGContextRef ctx =  UIGraphicsGetCurrentContext();
    [self.layer renderInContext:ctx];
    //3.从上下文当中取出一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //4.关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
