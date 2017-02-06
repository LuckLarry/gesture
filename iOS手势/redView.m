//
//  redView.m
//  iOS手势
//
//  Created by ouyang on 2016/12/26.
//  Copyright © 2016年 ouyang. All rights reserved.
//

#import "redView.h"

@implementation redView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"red-touch");
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    // 想让控件随着手指移动而移动,监听手指移动
    // 获取UITouch对象
    UITouch *touch = [touches anyObject];
    // 获取当前点的位置
    CGPoint curP = [touch locationInView:self];
    // 获取上一个点的位置
    CGPoint preP = [touch previousLocationInView:self];
    // 获取它们x轴的偏移量,每次都是相对上一次
    CGFloat offsetX = curP.x - preP.x;
    // 获取y轴的偏移量
    CGFloat offsetY = curP.y - preP.y;
    // 修改控件的形变或者frame,center,就可以控制控件的位置
    // 形变也是相对上一次形变(平移)
    // CGAffineTransformMakeTranslation:会把之前形变给清空,重新开始设置形变参数
    // make:相对于最原始的位置形变
    // CGAffineTransform t:相对这个t的形变的基础上再去形变
    // 如果相对哪个形变再次形变,就传入它的形变
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
}

@end

//UITouch对象
//当用户用一根手指触摸屏幕时，会创建一个与手指相关的UITouch对象
//一根手指对应一个UITouch对象
//
//如果两根手指同时触摸一个view，那么view只会调用一次touchesBegan:withEvent:方法，touches参数中装着2个UITouch对象
//
//如果这两根手指一前一后分开触摸同一个view，那么view会分别调用2次touchesBegan:withEvent:方法，并且每次调用时的touches参数中只包含一个UITouch对象
//UITouch的作用
//保存着跟手指相关的信息，比如触摸的位置、时间、阶段
//当手指移动时，系统会更新同一个UITouch对象，使之能够一直保存该手指在的触摸位置
//当手指离开屏幕时，系统会销毁相应的UITouch对象
//提 示:iPhone开发中，要避免使用双击事件！

//触摸产生时所处的窗口
//@property(nonatomic,readonly,retain) UIWindow *window;
//
//触摸产生时所处的视图
//@property(nonatomic,readonly,retain) UIView *view
//;
//
//短时间内点按屏幕的次数，可以根据tapCount判断单击、双击或更多的点击
//@property(nonatomic,readonly) NSUInteger tapCount;
//
//记录了触摸事件产生或变化时的时间，单位是秒@property(nonatomic,readonly) NSTimeInterval timestamp;
//
//当前触摸事件所处的状态
//@property(nonatomic,readonly) UITouchPhase phase;
