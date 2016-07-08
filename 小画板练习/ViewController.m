//
//  ViewController.m
//  小画板练习
//
//  Created by 王奥东 on 16/3/23.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "ViewController.h"
#import "ADView.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet ADView *MyView;
@property (strong, nonatomic) IBOutlet UIButton *btnY;
@property (strong, nonatomic) IBOutlet UISlider *Slider;

@end

@implementation ViewController

- (IBAction)back:(UIBarButtonItem *)sender {
    [_MyView.pathArray removeLastObject];
}
- (IBAction)erarse:(UIBarButtonItem *)sender {
    _MyView.LineColor = _MyView.backgroundColor;
}
- (IBAction)clean:(UIBarButtonItem *)sender {
    [_MyView.pathArray removeAllObjects];
}
- (IBAction)Save:(UIBarButtonItem *)sender {
    UIGraphicsBeginImageContextWithOptions(self.MyView.bounds.size, NO, 0.0);
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    [self.MyView.layer renderInContext:ref];
    
    UIImage *SImage = UIGraphicsGetImageFromCurrentImageContext();
    
    
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(SImage, nil, nil, nil);  
    
    
    
}

- (IBAction)MoveSlider:(UISlider *)sender {
    
    _MyView.widthLine = sender.value;
    
}
- (IBAction)btnColor:(UIButton *)sender {
    
    _MyView.LineColor = sender.backgroundColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _MyView.widthLine = _Slider.value;
    _MyView.LineColor = _btnY.backgroundColor;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
