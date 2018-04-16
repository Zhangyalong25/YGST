//
//  YGMoreVC.m
//  YGST
//
//  Created by yalong zhang on 2018/2/6.
//  Copyright © 2018年 yalong zhang. All rights reserved.
//

#import "YGMoreVC.h"

@interface YGMoreVC ()

@end

@implementation YGMoreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSArray *titile =@[@"  添加好友",@"  发表动态",@"  消息设置",@"  创建群聊",@"  搜索群聊"];
    NSArray *icons =@[@"\U0000e69e",@"\U0000e69b",@"\U0000e69d",@"\U0000e69c",@"\U0000e69f"];
    
    [_arrayBtns enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
         NSAttributedString *attStr =[YGSTTool getAttributedStringWithText:titile[idx] WithIcon:icons[idx] IconSize:18 IconLoction:YES TextSize:14 IconColor:RGB(204, 204, 204) TextColor:RGB(204, 204, 204)];
        UIButton *moreBtn =(UIButton *)obj;
        [moreBtn setAttributedTitle:attStr forState:UIControlStateNormal];
        
    }];
    
    CGAffineTransform smaller = CGAffineTransformMakeScale(0.01, 0.01);//比例缩放
    CGAffineTransform rightUpMove = CGAffineTransformMakeTranslation(_moreView.frame.size.width/2, -_moreView.frame.size.height/2);//平移
    CGAffineTransform cat = CGAffineTransformConcat(smaller, rightUpMove);//合并两个矩阵变换
    _moreView.transform = cat;//设置_imageView的仿射变换
    _moreView.alpha = 0;//透明度
    [self.view addSubview:_moreView];
    [self showMoreView];
    NSString *str=  NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES)[0];
    //NSString *path =[[NSBundle mainBundle] pathForResource:@"json" ofType:@"txt"];
    NSData *data =[NSData dataWithContentsOfFile:[NSString stringWithFormat:@"%@/json.txt",str]];
    NSLog(@"HHHHHHH%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    
}
- (void)showMoreView{
    CGAffineTransform larger = CGAffineTransformMakeScale(1, 1);//放大
    _moreView.hidden = NO;//显示视图
    [UIView animateWithDuration:0.2 animations:^{
        _moreView.transform = larger;
        _moreView.alpha = 1;
        
    }];
}
- (void)hidenMoreView{
    
    CGAffineTransform smaller = CGAffineTransformMakeScale(0.01, 0.01);//缩小
    CGAffineTransform rightUpMove = CGAffineTransformMakeTranslation(_moreView.frame.size.width/2, -_moreView.frame.size.height/2);//移动
    CGAffineTransform cat = CGAffineTransformConcat(smaller, rightUpMove);//合并transform
    [UIView animateWithDuration:0.2 animations:^{
        _moreView.transform = cat;
    } completion:^(BOOL finished) {
        _moreView.hidden = YES;
        _moreView.alpha = 0;
         [self.view removeFromSuperview];
        
    }];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self hidenMoreView];
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
