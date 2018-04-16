//
//  YGSTBaseViewController.m
//  YGST
//
//  Created by yalong zhang on 2018/2/5.
//  Copyright © 2018年 yalong zhang. All rights reserved.
//

#import "YGSTBaseViewController.h"

@interface YGSTBaseViewController ()

@end

@implementation YGSTBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // self.navigationItem.hidesBackButton=YES;
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    
//    YGBackBtn *back =[YGBackBtn buttonWithType:UIButtonTypeCustom];
//    [back setBackgroundColor:[UIColor redColor]];
//    CGFloat titwidth =[YGSTTool getWidthOfText:@"附近动态" forHeight:44 andFontsize:16];
//    [back setbacktitle:@"附近动态"];
//    [back setFrame:CGRectMake(0, 0, 25+titwidth, 44)];
//    UIView *bg =[[UIView alloc] initWithFrame:CGRectMake(0, 0, Iphone_Width, 44)];
//    [bg setBackgroundColor:[UIColor greenColor]];
//    [bg addSubview:back];
  //  self.navigationItem.titleView=bg;
   // [self.navigationItem setLeftBarButtonItems:@[[[UIBarButtonItem alloc] initWithCustomView:back]]];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
