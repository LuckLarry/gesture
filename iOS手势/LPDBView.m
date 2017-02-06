//
//  LPDBView.m
//  iOS手势
//
//  Created by ouyang on 2016/12/26.
//  Copyright © 2016年 ouyang. All rights reserved.
//

#import "LPDBView.h"

@implementation LPDBView

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    return nil;
//}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"white-touch");
}
// 手指移动就会调用这个方法
// 这个方法调用非常频繁
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"哎呀，不要拽人家！");
}
// 手指离开屏幕时就会调用一次这个方法
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"手放开还能继续玩耍！");
}

// 触摸结束前，某个系统事件(例如电话呼入)会打断触摸过程，系统会自动调用view的下面方法
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"打断触摸过程");
}
// 提示：touches中存放的都是UITouch对象

@end

//加速计事件
//- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event;
//- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event;
//- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event;
//远程控制事件
//- (void)remoteControlReceivedWithEvent:(UIEvent *)event;
