//
//  DrawTouchPointView.m
//  12
//
//  Created by 吴灶洲 on 2017/5/21.
//  Copyright © 2017年 吴灶洲. All rights reserved.
//

#import "DrawTouchPointView.h"
#import "DWStroke.h"

@interface DrawTouchPointView () {
     CGMutablePathRef currentPath;//路径
}
//是否擦除
@property (nonatomic, assign) BOOL isEarse;
//存储所有的路径
@property (nonatomic, strong) NSMutableArray *stroks;
//画笔颜色
@property (nonatomic, strong) UIColor *lineColor;
//线条宽度
@property (nonatomic, assign) CGFloat lineWidth;
@end

@implementation DrawTouchPointView


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    currentPath = CGPathCreateMutable();
    DWStroke *stroke = [[DWStroke alloc] init];
    stroke.path = currentPath;
    stroke.blendMode = _isEarse ? kCGBlendModeDestinationIn : kCGBlendModeNormal;
    stroke.strokeWidth = _isEarse ? 20.0 : _lineWidth;
    stroke.lineColor = _isEarse ? [UIColor clearColor] : _lineColor;
    [_stroks addObject:stroke];
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
//    CGAffineTransform transform = CGAffineTransformMakeTranslation(0, 0);
//    CGPathAddArc(currentPath, &transform, point.x, point.y, 0.1, 0, 2*M_PI, 1);
    CGPathMoveToPoint(currentPath, NULL, point.x, point.y);
//    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    CGPathAddLineToPoint(currentPath, NULL, point.x, point.y);
    [self setNeedsDisplay];
}



- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _stroks = [[NSMutableArray alloc] initWithCapacity:1];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (DWStroke *stroke in _stroks) {
        [stroke strokeWithContext:context];
    }
    
}


- (void)dealloc {
    CGPathRelease(currentPath);
}

/** 清屏 */
- (void)clearScreen {
    _isEarse = NO;
    [_stroks removeAllObjects];
    [self setNeedsDisplay];
}

/** 撤消操作 */
- (void)revokeScreen {
    _isEarse = NO;
    [_stroks removeLastObject];
    [self setNeedsDisplay];
}

/** 擦除 */
- (void)eraseSreen {
    self.isEarse = YES;
}
/** 设置画笔颜色 */
- (void)setStrokeColor:(UIColor *)lineColor {
    _isEarse = NO;
    self.lineColor = lineColor;
//    [self setNeedsDisplay];
}
/** 设置画笔大小 */
- (void)setStrokeWidth:(CGFloat)lineWidth {
    _isEarse = NO;
    self.lineWidth = lineWidth;
}




@end
