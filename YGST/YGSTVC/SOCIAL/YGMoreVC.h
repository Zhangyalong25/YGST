//
//  YGMoreVC.h
//  YGST
//
//  Created by yalong zhang on 2018/2/6.
//  Copyright © 2018年 yalong zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGMoreVC : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *arrayBtns;
@property (weak, nonatomic) IBOutlet UIView *moreView;

@end
