//
//  KMGestureRecognizer.h
//  iOS手势
//
//  Created by ouyang on 2016/12/24.
//  Copyright © 2016年 ouyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, Direction) {
         DirectionUnknown,
         DirectionLeft,
         DirectionRight
     };

@interface KMGestureRecognizer : UIGestureRecognizer

@property (assign, nonatomic) NSUInteger tickleCount; //挠痒次数
@property (assign, nonatomic) CGPoint currentTickleStart; //当前挠痒开始坐标位置
@property (assign, nonatomic) Direction lastDirection; //最后一次挠痒方向

@end
