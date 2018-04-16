//
//  YGDetailDynamicVC.h
//  YGST
//
//  Created by yalong zhang on 2018/1/20.
//  Copyright © 2018年 yalong zhang. All rights reserved.
//

#import "YGSTBaseViewController.h"

@interface YGDetailDynamicVC : YGSTBaseViewController
@property (strong, nonatomic) UIView *header;
@property (strong, nonatomic) UIImageView *image;

@property (weak, nonatomic) IBOutlet UITableView *tab;
@end
