//
//  ViewController.m
//  GrawDemo
//
//  Created by lanou on 16/1/25.
//  Copyright © 2016年 JasperSong. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#define kWidth [UIScreen mainScreen].bounds.size.width

 @implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [SecondViewController sayHell];
//    [[[SecondViewController alloc]init] say];
    
    self.lineWidthSlider.minimumValue = 1.0;
    self.lineWidthSlider.maximumValue = 10.0;
    self.lineWidthSlider.value = 3.0;
    
    self.drawBoard = [[DrawingBoard alloc] initWithFrame:CGRectMake((kWidth - 200)/2,100 , 200, 200)];
    self.drawBoard.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.drawBoard];
    
    NSLog(@"%ld",[self test:6]);
}
// 视图转换成图片
- (UIImage *)imageForView:(UIView *)view{
    // 绘制图片开始 (传入图片的大小)
    UIGraphicsBeginImageContext(view.bounds.size);
    // 把View上的层 绘制(翻译)到图片上
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    // 获取新的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 绘制结束
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"second"]){
        // 去除背景色
        self.drawBoard.backgroundColor = [UIColor clearColor];
        UIImage *image = [self imageForView:self.drawBoard];
        SecondViewController *vc = segue.destinationViewController;
        vc.image = image;
    }
}

- (IBAction)green:(id)sender {
    self.drawBoard.color = [UIColor greenColor];
}

- (IBAction)red:(id)sender {
    self.drawBoard.color = [UIColor redColor];
}

- (IBAction)redo:(id)sender {
    [self.drawBoard.lineArray removeLastObject];
    [self.drawBoard setNeedsDisplay];
}
- (IBAction)clear:(id)sender {
    [self.drawBoard.lineArray removeAllObjects];
    [self.drawBoard setNeedsDisplay];
}
- (IBAction)print:(id)sender {
}
- (IBAction)slider:(id)sender {
    self.drawBoard.lineWidth = self.lineWidthSlider.value;
}

- (NSInteger)test:(NSInteger)num{
    if (num == 0) {
        return 1 ;
    }
    return [self test:(num - 1)] * num;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
