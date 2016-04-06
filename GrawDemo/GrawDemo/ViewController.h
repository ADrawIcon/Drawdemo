//
//  ViewController.h
//  GrawDemo
//
//  Created by lanou on 16/1/25.
//  Copyright © 2016年 JasperSong. All rights reserved.
//

#import <UIKit/UIKit.h>
// 画图
#import <UIKit/UIGraphics.h>
#import "DrawingBoard.h"
@interface ViewController : UIViewController

@property (nonatomic, strong) DrawingBoard *drawBoard;
@property (strong, nonatomic) IBOutlet UIView *greenPen;
@property (weak, nonatomic) IBOutlet UIButton *redPen;
@property (weak, nonatomic) IBOutlet UIButton *redoB;
@property (weak, nonatomic) IBOutlet UIButton *clearB;
@property (weak, nonatomic) IBOutlet UIButton *printB;
@property (weak, nonatomic) IBOutlet UISlider *lineWidthSlider;

@end

