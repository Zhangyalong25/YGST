//
//  YGMineVC.h
//  YGST
//
//  Created by yalong zhang on 2018/1/20.
//  Copyright © 2018年 yalong zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGMineVC : UIViewController
@property (weak, nonatomic) IBOutlet UISlider *progress;

@property (weak, nonatomic) IBOutlet UILabel *showlab;
- (IBAction)showvalue:(UISlider *)sender;
- (IBAction)touch:(UISlider *)sender;

@end
