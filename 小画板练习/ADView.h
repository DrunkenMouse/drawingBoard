//
//  ADView.h
//  小画板
//
//  Created by 王奥东 on 16/3/23.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADView : UIView
@property(strong,nonatomic)NSMutableArray *pathArray;
@property(assign,nonatomic)CGFloat widthLine;
@property(strong,nonatomic)UIColor *LineColor;
@end
