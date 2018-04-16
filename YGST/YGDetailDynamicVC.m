//
//  YGDetailDynamicVC.m
//  YGST
//
//  Created by yalong zhang on 2018/1/20.
//  Copyright © 2018年 yalong zhang. All rights reserved.
//

#import "YGDetailDynamicVC.h"

@interface YGDetailDynamicVC ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@end

@implementation YGDetailDynamicVC
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden =NO;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.header =[[UIView alloc] init];
    [self.header setBackgroundColor:[UIColor blueColor]];
    self.image =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Imageh"]];
    [self.header setFrame:CGRectMake(0, 0, Iphone_Width, 144)];
    [self.image setFrame:CGRectMake(0, 0, Iphone_Width, 144)];
    [_header addSubview:_image];
    _tab.tableHeaderView=self.header;
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offset = scrollView.contentOffset;
    if(offset.y<0){
        CGRect rect = self.header.frame;
        rect.origin.y = offset.y;
        rect.size.height =  self.header.frame.size.height- offset.y;
        self.image.frame = CGRectMake(0, rect.origin.y, rect.size.width, rect.size.height);
       // NSLog(@"hdfhsadg%@%f",NSStringFromCGRect(rect),self.header.frame.size.height - offset.y);
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *iden =@"YGOrderCell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    [cell setBackgroundColor:[UIColor redColor]];
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return 49;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"hdfhsadg%@",NSStringFromCGRect(self.header.frame));
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"KKKKKKKKK%@",segue.sourceViewController);
}


@end

