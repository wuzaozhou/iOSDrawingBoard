//
//  DWStroke.m
//  12
//
//  Created by 吴灶洲 on 2017/5/21.
//  Copyright © 2017年 吴灶洲. All rights reserved.
//

#import "DWStroke.h"

@implementation DWStroke


- (void)strokeWithContext:(CGContextRef)context {
    CGContextSetStrokeColorWithColor(context, [_lineColor CGColor]);
    CGContextSetFillColorWithColor(context, [_lineColor CGColor]);
    CGContextSetLineWidth(context, _strokeWidth);
    CGContextSetBlendMode(context, _blendMode);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextBeginPath(context);
    CGContextAddPath(context, _path);
    CGContextStrokePath(context);
}


@end
