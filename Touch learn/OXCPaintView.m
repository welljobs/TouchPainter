//
//  OXCPaintView.m
//  Touch learn
//
//  Created by mac on 2017/5/3.
//  Copyright © 2017年 魏素宝. All rights reserved.
//

#import "OXCPaintView.h"

@interface OXCPaintView ()

@property (nonatomic,strong) NSMutableArray * totalPathPoints;
@property (nonatomic,strong) UIBezierPath  *bezierPath;

@end

@implementation OXCPaintView

- (NSMutableArray *)totalPathPoints{
    if (nil == _totalPathPoints) {
        _totalPathPoints = [[NSMutableArray alloc] init];
    }
    return _totalPathPoints;
}
#pragma mark - Touches Event


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //No.1
    //开始写代码,不使用贝塞尔曲线,补全TouchesBegan事件,实现涂鸦效果
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self];
    self.bezierPath = [[UIBezierPath alloc] init];
   
    [self.bezierPath moveToPoint:currentPoint];
    
    [self.totalPathPoints addObject:self.bezierPath];

    //end_code
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [self drawLineWithTouches:touches];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self drawLineWithTouches:touches];
}

- (void)drawLineWithTouches:(NSSet *)touches {
    //No.2
    //开始写代码,完成TouchesMove和TouchesEnded事件,实现涂鸦效果
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self];
    CGPoint previousPoint = [touch previousLocationInView:self];
    CGPoint midP = midpoint(previousPoint,currentPoint);
    [self.bezierPath addQuadCurveToPoint:currentPoint   controlPoint:midP];
    // touchesMoved
    [self setNeedsDisplay];
     //end_code
}
#pragma mark - Draw Rect

- (void)drawRect:(CGRect)rect {
    //No.3
    //开始写代码,要求不使用贝塞尔曲线,实现画线效果(线条默认宽度为5,尽量使线圆滑)

    if (self.totalPathPoints.count) {
        for (UIBezierPath *path in self.totalPathPoints) {
            
            
            path.lineCapStyle = kCGLineCapRound;
            path.lineJoinStyle = kCGLineCapRound;
            path.lineWidth = 10;    //   这里可抽取出来枚举定义
            [path strokeWithBlendMode:kCGBlendModeDestinationIn alpha:1.0];
            
            [path stroke];
            
        }
        
    }
    
    
    [super drawRect:rect];
    
    //end_code
}
static CGPoint midpoint(CGPoint p0, CGPoint p1) {
    return (CGPoint) {
        (p0.x + p1.x) / 2.0,
        (p0.y + p1.y) / 2.0
    };
}
- (void)back {
    //No.4
    //开始写代码,实现撤销上一笔画功能
    if(self.totalPathPoints.count>0){
        [self.totalPathPoints removeObjectAtIndex:self.totalPathPoints.count-1];
        [self setNeedsDisplay];
    }
    
    //end_code
}

- (void)clear {
    //No.5
    //开始写代码,实现清空所有涂鸦功能
    [self.totalPathPoints removeAllObjects];
    [self setNeedsDisplay];
    
    //end_code
}

@end
