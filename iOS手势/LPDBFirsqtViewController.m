//
//  LPDBFirsqtViewController.m
//  iOS手势
//
//  Created by ouyang on 2016/12/26.
//  Copyright © 2016年 ouyang. All rights reserved.
//

#import "LPDBFirsqtViewController.h"
#import "LPDBView.h"
#import "redView.h"
#import "GreenView.h"

@interface LPDBFirsqtViewController ()

@property (nonatomic, assign) CGFloat screenWidth;
@property (nonatomic, assign) CGFloat screenHeight;

@end

@implementation LPDBFirsqtViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.screenWidth = [UIScreen mainScreen].bounds.size.width;
    self.screenHeight = [UIScreen mainScreen].bounds.size.height;
    self.title = @"响应链";
    self.view.backgroundColor = [UIColor whiteColor];

    LPDBView *white = [[LPDBView alloc] initWithFrame:CGRectMake(0, 0, self.screenWidth, self.screenHeight)];
    white.backgroundColor = [UIColor lightGrayColor];

    redView *red = [[redView alloc] initWithFrame:CGRectMake(self.screenWidth/2 + 50, self.screenHeight/2 - 50, 100, 100)];
    red.backgroundColor = [UIColor redColor];
    [white addSubview:red];

    GreenView *green = [[GreenView alloc] initWithFrame:CGRectMake(self.screenWidth/2 - 150, self.screenHeight/2 - 50, 100, 100)];
    green.backgroundColor = [UIColor greenColor];
    [white addSubview:green];


    [self.view addSubview:white];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//事件的传递与响应：
//1、当一个事件发生后，事件会从父控件传给子控件，也就是说由UIApplication -> UIWindow -> UIView -> initial view,以上就是事件的传递，也就是寻找最合适的view的过程。
//
//2、接下来是事件的响应。首先看initial view能否处理这个事件，如果不能则会将事件传递给其上级视图（inital view的superView）；如果上级视图仍然无法处理则会继续往上传递；一直传递到视图控制器view controller，首先判断视图控制器的根视图view是否能处理此事件；如果不能则接着判断该视图控制器能否处理此事件，如果还是不能则继续向上传 递；（对于第二个图视图控制器本身还在另一个视图控制器中，则继续交给父视图控制器的根视图，如果根视图不能处理则交给父视图控制器处理）；一直到 window，如果window还是不能处理此事件则继续交给application处理，如果最后application还是不能处理此事件则将其丢弃
//
//3、在事件的响应中，如果某个控件实现了touches...方法，则这个事件将由该控件来接受，如果调用了[supertouches….];就会将事件顺着响应者链条往上传递，传递给上一个响应者；接着就会调用上一个响应者的touches….方法

//事件的传递和响应的区别：
//事件的传递是从上到下（父控件到子控件），事件的响应是从下到上（顺着响应者链条向上传递：子控件到父控件。

//如何做到一个事件多个对象处理：
//因为系统默认做法是把事件上抛给父控件，所以可以通过重写自己的touches方法和父控件的touches方法来达到一个事件多个对象处理的目的。
//
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    // 1.自己先处理事件...
//    NSLog(@"do somthing...");
//    // 2.再调用系统的默认做法，再把事件交给上一个响应者处理
//    [super touchesBegan:touches withEvent:event];
//}

//在iOS中不是任何对象都能处理事件，只有继承了UIResponder的对象才能接受并处理事件，我们称之为“响应者对象”。以下都是继承自UIResponder的，所以都能接收并处理事件。

//UIApplication
//UIViewController
//UIView
//
//那么为什么继承自UIResponder的类就能够接收并处理事件呢？
//
//因为UIResponder中提供了以下4个对象方法来处理触摸事件。
//UIResponder内部提供了以下方法来处理事件触摸事件
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
//- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;
//加速计事件
//- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event;
//- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event;
//- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event;
//远程控制事件
//- (void)remoteControlReceivedWithEvent:(UIEvent *)event;





