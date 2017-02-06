//
//  LPDBViewController.m
//  iOS手势
//
//  Created by ouyang on 2016/12/26.
//  Copyright © 2016年 ouyang. All rights reserved.
//

#import "LPDBViewController.h"
#import "LPDBFirsqtViewController.h"

@interface LPDBViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic, assign) CGFloat screenWidth;
@property (nonatomic, assign) CGFloat screenHeight;

@end

@implementation LPDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"doPush"] style:UIBarButtonItemStylePlain target:self action:@selector(doPush)];
    self.navigationItem.rightBarButtonItem = item;

    self.screenWidth = [UIScreen mainScreen].bounds.size.width;
    self.screenHeight = [UIScreen mainScreen].bounds.size.height;
    self.title = @"响应链";
    self.view.backgroundColor = [UIColor whiteColor];

    [self ThreeView];
    [self FirstView];
    [self SecendView];

    [self FourView];
}

- (void)FirstView{
    UIView *FirstView = [[UIView alloc] initWithFrame:CGRectMake(self.screenWidth/2 - 100, self.screenHeight/2 - 100, 200, 200)];
    FirstView.userInteractionEnabled = YES;
    FirstView.backgroundColor = [UIColor blueColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandlerFirst:)];
    tap.delegate = self;
    //            tap.numberOfTouchesRequired = 2;
    [FirstView addGestureRecognizer:tap];
    [self.view addSubview:FirstView];
}

- (void)SecendView{
    UIView *SecendView = [[UIView alloc] initWithFrame:CGRectMake(self.screenWidth/2 - 75, self.screenHeight/2 - 75, 150, 150)];
    SecendView.userInteractionEnabled = YES;
    SecendView.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.01];
//    SecendView.hidden = YES;
//    SecendView.alpha = 0.011;

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandlerSecend:)];
    tap.delegate = self;
    //            tap.numberOfTouchesRequired = 2;
    [SecendView addGestureRecognizer:tap];
    [self.view addSubview:SecendView];
}

- (void)ThreeView{
    UIButton *ThreeView = [[UIButton alloc] initWithFrame:CGRectMake(self.screenWidth/2 - 300/2, self.screenHeight/2 - 300/2, 300, 300)];
    [ThreeView setBackgroundColor:[UIColor redColor]];
    [ThreeView addTarget:self action:@selector(ThreeTouch:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ThreeView];
}

- (void)FourView{
    UIImageView *FourView = [[UIImageView alloc] initWithFrame:CGRectMake(self.screenWidth/2 - 25, self.screenHeight/2 - 25, 50, 50)];
    FourView.image = [UIImage imageNamed:@"image1"];
    UIButton *FourButton = [[UIButton alloc] initWithFrame:CGRectMake(self.screenWidth/2 - 25, self.screenHeight/2 - 25, 50, 50)];
    [FourButton setBackgroundColor:[UIColor lightTextColor]];
    [FourButton addTarget:self action:@selector(FourTouch:) forControlEvents:UIControlEventTouchUpInside];
    [FourView addSubview:FourButton];
    [self.view addSubview:FourView];
}

- (void)tapHandlerFirst:(UITapGestureRecognizer *)sender{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"First" message:@"The First UIResponder" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alertView show];
}

- (void)tapHandlerSecend:(UITapGestureRecognizer *)sender{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Secend" message:@"The Secend UIResponder" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alertView show];
}

- (void)ThreeTouch:(UIButton *)sender{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Three" message:@"The ThreeButton UIResponder" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alertView show];
}

- (void)FourTouch:(UIButton *)sender{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Four" message:@"The FourButton UIResponder" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alertView show];
}

- (void)doPush{
    [self.navigationController pushViewController:[LPDBFirsqtViewController new] animated:YES];
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




//注意：之所以会采取从后往前遍历子控件的方式寻找最合适的view只是为了做一些循环优化。因为相比较之下，后添加的view在上面，降低循环次数。

//hitTest:withEvent:方法
//pointInside方法
//
//3.3.1.1.hitTest：withEvent：方法
//什么时候调用？

