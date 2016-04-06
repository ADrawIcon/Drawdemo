//
//  DrawingBoard.m
//  GrawDemo
//
//  Created by lanou on 16/1/25.
//  Copyright © 2016年 JasperSong. All rights reserved.
//

#import "DrawingBoard.h"

@implementation DrawingBoard


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        self.lineArray = [NSMutableArray array];
        self.color = [UIColor cyanColor];
        self.lineWidth = 3.0;

    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 获取手指信息
    UITouch *touch = [touches anyObject];
    // 获取开始点
    CGPoint startPoint = [touch locationInView:self];
    // 构建点数组
    NSMutableArray *pointArray = [NSMutableArray array];
    // 点转化成NSValue
    NSValue *startValue = [NSValue valueWithCGPoint:startPoint];
    [pointArray addObject:startValue];
    
    //添加到保存所有线的数组中
    self.lineDictionary = [NSMutableDictionary dictionary];
    self.lineDictionary[@"color"] = self.color;
    self.lineDictionary[@"width"] = [NSNumber numberWithFloat:self.lineWidth];
    self.lineDictionary[@"points"] = pointArray;
    [self.lineArray addObject:self.lineDictionary];
    
    // 重新绘图 刷新视图
    [self setNeedsDisplay];
}

// 保存所有移动的点
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    NSValue *value = [NSValue valueWithCGPoint:point];
    // 最新的数组 就是正在画的数组
    NSMutableDictionary *dic = self.lineArray.lastObject;
    NSMutableArray *array = dic[@"points"];
    [array addObject:value];
    
    // 重新绘图 刷新视图
    [self setNeedsDisplay];
}

// 绘制视图的方法
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    // 遍历所有线的数组
    for (int i = 0; i < self.lineArray.count; i++){
        NSMutableDictionary *dic = self.lineArray[i];
        
        // Drawing code
        // 1. 获取绘制视图的上下文 (类似CoreData的助理)
        CGContextRef context = UIGraphicsGetCurrentContext();
        // 2. 设置画笔的属性
        CGContextSetStrokeColorWithColor(context, ((UIColor *)dic[@"color"]).CGColor);
        // 3. 设置线的粗细
        CGContextSetLineWidth(context, ((NSNumber *) dic[@"width"]).floatValue);
        
        
        
        // 取出每一条线的小数组
        NSMutableArray *pointArray = dic[@"points"];
//        NSMutableArray *pointArray = self.lineArray.lastObject;
        // 遍历小数组
        for (int j = 0; j < pointArray.count - 1; j ++) {
            NSValue *startValue = pointArray[j];
            NSValue *nextValue = pointArray[j + 1];
            // 还原成点
            CGPoint startPoint = [startValue CGPointValue];
            CGPoint nextPoint = [nextValue CGPointValue];
            
            // 思路
            // 1> 把画笔移动到开始点
            CGContextMoveToPoint(context, startPoint.x, startPoint.y);
            // 2> 两点连成线
            CGContextAddLineToPoint(context, nextPoint.x, nextPoint.y);
            // 3> 提交连线的路径(轨迹)
            CGContextStrokePath(context);
            
        }
    }
}


@end
