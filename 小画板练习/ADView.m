//
//  ADView.m
//  小画板
//
//  Created by 王奥东 on 16/3/23.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "ADView.h"
#import "ADPath.h"
@implementation ADView

-(NSMutableArray *)pathArray{
    if (_pathArray==nil) {
        _pathArray = [NSMutableArray array];
    }
    return _pathArray;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    UITouch *touch = touches.anyObject;
    CGPoint loc = [touch locationInView:touch.view];
    ADPath *path = [[ADPath alloc]init];
    
    [path moveToPoint:loc];
    path.lineWidth = self.widthLine;
    
    path.LineColor = self.LineColor;
    [self.pathArray addObject:path];
    
    [self setNeedsDisplay];
    
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    UITouch *touch = touches.anyObject;
    CGPoint loc = [touch locationInView:touch.view];
    [[self.pathArray lastObject]addLineToPoint:loc];
    
    [self setNeedsDisplay];
    
}
- (void)drawRect:(CGRect)rect {
    for (ADPath *path in self.pathArray) {
        [path.LineColor set];
        [path stroke];
    }
}

@end
