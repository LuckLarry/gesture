//
//  ViewController.m
//  iOS手势
//
//  Created by ouyang on 2016/12/24.
//  Copyright © 2016年 ouyang. All rights reserved.
//

#import "ViewController.h"
#import "TheResultViewController.h"
#import "LPDBViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *UIGestureRecognizerTableView;

@property (nonatomic, strong) NSArray *titls;

@property (nonatomic, strong) NSArray *contents;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"doPush"] style:UIBarButtonItemStylePlain target:self action:@selector(doPush)];
    self.navigationItem.rightBarButtonItem = item;

    self.title = @"手势";
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;

    self.UIGestureRecognizerTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height) style:UITableViewStyleGrouped];
    self.UIGestureRecognizerTableView.delegate =self;
    self.UIGestureRecognizerTableView.dataSource = self;
    self.titls = @[@"UITapGestureRecognizer",@"UILongPressGestureRecognizer",@"UIPanGestureRecognizer",@"UIPinchGestureRecognizer",@"UIRotationGestureRecognizer",@"UISwipeGestureRecognizer",@"customize"];
    self.contents = @[@"点按",@"长按",@"拖动",@"捏合",@"旋转",@"轻扫",@"自定义"];
    [self.view addSubview:self.UIGestureRecognizerTableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 7;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.titls[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"UIGestureRecognizerCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.textLabel.text = self.contents[indexPath.section];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TheResultViewController *vc = [[TheResultViewController alloc] init];
    vc.type = indexPath.section;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)doPush{
    [self.navigationController pushViewController:[LPDBViewController new] animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
