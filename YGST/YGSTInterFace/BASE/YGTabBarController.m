//
//  YGTabBarController.m
//  YGST
//
//  Created by yalong zhang on 2018/1/20.
//  Copyright © 2018年 yalong zhang. All rights reserved.
//

#import "YGTabBarController.h"

@interface YGTabBarController ()

@end

@implementation YGTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    for (int b=0; b<self.tabBar.items.count; b++) {
        UITabBarItem *bar =self.tabBar.items[b];
        NSDictionary *selectdic =@{NSForegroundColorAttributeName:mainGreen};
        NSDictionary *normaldic =@{NSForegroundColorAttributeName:RGB(153, 153, 153)};
        [bar setTitleTextAttributes:selectdic forState:UIControlStateSelected];
        [bar setTitleTextAttributes:normaldic forState:UIControlStateNormal];
    }
    
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
