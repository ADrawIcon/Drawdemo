//
//  DrawingBoard.h
//  GrawDemo
//
//  Created by lanou on 16/1/25.
//  Copyright © 2016年 JasperSong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawingBoard : UIView
/**
 *  保存线的数组
 */
@property (nonatomic, strong) NSMutableArray *lineArray;
/**
 *  画笔颜色
 */
@property (nonatomic, strong) UIColor *color;
/**
 *  线的粗细
 */
@property (nonatomic, assign) CGFloat lineWidth;
/**
 *  保存点的数组
 */
//@property (nonatomic, strong) NSMutableArray *pointArray;
/**
 *  线条字典
 */
@property (nonatomic, strong) NSMutableDictionary *lineDictionary;

@end
