//
//  TheResultViewController.m
//  iOS手势
//
//  Created by ouyang on 2016/12/24.
//  Copyright © 2016年 ouyang. All rights reserved.
//

#import "TheResultViewController.h"
#import "KMGestureRecognizer.h"

@interface TheResultViewController ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *deleteButton;
@property (nonatomic, copy) NSArray *images;
@property (nonatomic, assign) NSInteger CurrentIndex;
@property (nonatomic, strong) KMGestureRecognizer *customGestureRecognizer;

@end

@implementation TheResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;

    self.title = @"动画界面";
    self.view.backgroundColor = [UIColor whiteColor];

    self.images = @[@"image1",@"image2",@"image3",@"image4",@"image5"];
    self.CurrentIndex = 0;


    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(screenWidth/2 - 100, screenHeight/2 - 100, 200, 200)];
    self.imageView.image = [UIImage imageNamed:@"image2"];
    self.imageView.center = self.view.center;
    self.imageView.userInteractionEnabled = YES;
    [self.view addSubview:self.imageView];

    self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(180, 0, 20, 20)];
    self.deleteButton.hidden = YES;
    [self.deleteButton setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
    [self.deleteButton addTarget:self action:@selector(click_delete:) forControlEvents:UIControlEventTouchUpInside];
    [self.imageView addSubview:self.deleteButton];

    switch (self.type) {
        case 0:
        {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandler:)];
            tap.delegate = self;
            //            tap.numberOfTouchesRequired = 2;
            [self.imageView addGestureRecognizer:tap];
        }
            break;
        case 1:
        {
            UILongPressGestureRecognizer *longpress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressHandler:)];
            longpress.delegate = self;
            longpress.minimumPressDuration = 2;  //长按反应时间
            [self.imageView addGestureRecognizer:longpress];
        }
            break;
        case 2:
        {
            UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panHandler:)];
            [self.imageView addGestureRecognizer:pan];
        }
            break;
        case 3:
        {
            UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scaleHandler:)];
            [self.imageView addGestureRecognizer:pinch];
        }
            break;
        case 4:
        {
            UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationHandler:)];
            [self.imageView addGestureRecognizer:rotation];
        }
            break;
        case 5:
        {
            UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandler:)];
            swipe.direction = UISwipeGestureRecognizerDirectionRight;
            [self.view addGestureRecognizer:swipe];
        }
            break;
        case 6:
        {
            _customGestureRecognizer = [[KMGestureRecognizer alloc] initWithTarget:self action:@selector(handleCustomGestureRecognizer:)];
            [self.view addGestureRecognizer:_customGestureRecognizer];
        }
            break;
        default:
            break;
    }

}

- (void)tapHandler:(UITapGestureRecognizer *)sender
{
    if (sender.numberOfTouchesRequired == 2) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"TapGesture" message:@"Two Fingers" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"ok", nil];
        [alertView show];
        return;
    }
    UIActionSheet *actsheet = [[UIActionSheet alloc] initWithTitle:@"TapGesture" delegate:nil cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"OK", nil];
    [actsheet showInView:self.view];
}
- (void)panHandler:(UIPanGestureRecognizer *)pan
{
    CGPoint location = [pan locationInView:self.view];
    pan.view.center = location;
}
-(void)longPressHandler:(UILongPressGestureRecognizer *)sender
{
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Gesture" message:@"LongPressGesture" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
//    [alertView show];
    [self start:self.imageView];
}
-(void)rotationHandler:(UIRotationGestureRecognizer *)sender
{
    CGPoint location = [sender locationInView:self.view];
    self.imageView.center = location;
    CGAffineTransform tran = sender.view.transform;
    CGAffineTransform newTran = CGAffineTransformRotate(tran, sender.rotation);
    self.imageView.transform = newTran;
}
- (void)scaleHandler:(UIPinchGestureRecognizer *)pinch
{
    CGFloat scale = pinch.scale;
    pinch.view.transform = CGAffineTransformScale(pinch.view.transform, scale, scale);

    pinch.scale = 1.0;

//    CGPoint location = [pinch locationInView:self.view];
//    self.imageView.center = location;
//    CGAffineTransform tran = pinch.view.transform;
//    CGAffineTransform newTran = CGAffineTransformScale(tran, pinch.scale,pinch.scale);
//    self.imageView.transform = newTran;
}
- (void)swipeHandler:(UISwipeGestureRecognizer *)sender
{
    if (sender.direction == UISwipeGestureRecognizerDirectionRight && self.CurrentIndex == 0) {
        self.CurrentIndex = self.images.count - 1;

    }else if(sender.direction == UISwipeGestureRecognizerDirectionLeft && self.CurrentIndex == self.images.count-1){
        self.CurrentIndex = 0;
    }else if (sender.direction == UISwipeGestureRecognizerDirectionLeft){
        self.CurrentIndex++;
    }else{
        self.CurrentIndex--;
    }
    self.imageView.image = [UIImage imageNamed:[self.images objectAtIndex:self.CurrentIndex]];
}

//开始抖动
- (void)start : (UIView *)view {
    double angle1 = -3.0 / 180.0 * M_PI;
    double angle2 = 3.0 / 180.0 * M_PI;
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"transform.rotation";

    anim.values = @[@(angle1),  @(angle2), @(angle1)];
    anim.duration = 0.25;
    // 动画的重复执行次数
    anim.repeatCount = MAXFLOAT;

    // 保持动画执行完毕后的状态
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;

    [view.layer addAnimation:anim forKey:@"shake"];
    self.deleteButton.hidden = NO;
}

// 停止抖动
- (void)stop : (UIView *)view{
    [view.layer removeAnimationForKey:@"shake"];
}

- (void)click_delete: (UIButton *)btn{

    [self stop:self.imageView];
    self.deleteButton.hidden = YES;

//    [self.imageView removeFromSuperview];
//    self.imageView.hidden = YES;
}


//处理自定义手势
- (void)handleCustomGestureRecognizer:(KMGestureRecognizer *)recognizer {
    //代码块方式封装操作方法
    void (^positionOperation)() = ^() {
        CGPoint newPoint = recognizer.view.center;
        newPoint.y -= 100.0;
        self.imageView.center = newPoint;
    };

    positionOperation();
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
//    if ([touch.view isKindOfClass:[UIButton class]])
//    {
//        return NO;
//    }
    return YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
