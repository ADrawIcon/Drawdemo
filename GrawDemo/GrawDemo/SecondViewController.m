//
//  SecondViewController.m
//  GrawDemo
//
//  Created by lanou on 16/1/25.
//  Copyright © 2016年 JasperSong. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    self.imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 600)];
    [self.view addSubview:self.imageV];
    
    UIImage *image = [self imageAddImage:self.image ToImage:[UIImage imageNamed:@"xxxx"]];
    _imageV.image = image;
//    NSString
    
//    coreImage(图片对比度 饱和度 127个可以调节的)
}

+ (void)sayHell{
    NSLog(@"调用成功了");
    
    
    
}

- (void)say{
    NSLog(@"调用成功了");
}

// 合成图片
- (UIImage *)imageAddImage:(UIImage *)image ToImage:(UIImage *)targetImage{
    UIGraphicsBeginImageContext(targetImage.size);
    // 先绘制第一张 背景
    [targetImage drawInRect:CGRectMake(0, 0, self.imageV.frame.size.width, self.imageV.frame.size.height)];
    // 绘制水印
    [image drawInRect:CGRectMake( self.imageV.frame.size.width * 5 / 6, self.imageV.frame.size.height * 5 / 6,  self.imageV.frame.size.width / 6,self.imageV.frame.size.height / 6)];
    // 获取新图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
