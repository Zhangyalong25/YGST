//
//  YGMineVC.m
//  YGST
//
//  Created by yalong zhang on 2018/1/20.
//  Copyright © 2018年 yalong zhang. All rights reserved.
//

#import "YGMineVC.h"
#import <AVKit/AVKit.h>
@interface YGMineVC (){
    AVPlayer *player;
    CGFloat _fps;
    CGFloat _duration;
}

@end

@implementation YGMineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *str=  NSSearchPathForDirectoriesInDomains(NSPicturesDirectory, NSUserDomainMask, YES)[0];
    NSLog(@"HSGJdhsDh%@",str);
    NSURL *url = [NSURL URLWithString:@"file:///Users/yalongzhang/Desktop/qw/%E9%A3%9E%E9%BE%99%E7%8C%9B%E5%B0%86-%E9%AB%98%E6%B8%85%E5%9B%BD%E8%AF%AD.mp4"];
    // 2.创建AVPlayerItem
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
    _fps = [[[item.asset tracksWithMediaType:AVMediaTypeVideo] objectAtIndex:0] nominalFrameRate];
    _duration=CMTimeGetSeconds(item.asset.duration);
    player = [AVPlayer playerWithPlayerItem:item];
    
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:player]; layer.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width * 9 / 16);
    [layer setBackgroundColor:[UIColor redColor].CGColor];
    [self.view.layer addSublayer:layer];
    [player play];
    CMTime interval = _duration > 60 ? CMTimeMake(1, 1) : CMTimeMake(1, 30);
    [player addPeriodicTimeObserverForInterval:interval queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        CGFloat times =CMTimeGetSeconds(time);
        NSString *showstr =[NSString stringWithFormat:@"%@/%@",[self convert:times],[self convert:_duration]];
        self.progress.value =times/_duration;
        [self.showlab setText:showstr];
    }];
    
}
- (NSString *)convert:(CGFloat)time{
    int minute = time / 60; int second = time - minute * 60; NSString *minuteString; NSString *secondString;
    if(minute < 10){ minuteString = [NSString stringWithFormat:@"0%d", minute]; }else{ minuteString = [NSString stringWithFormat:@"%d", minute]; }
    if(second < 10){ secondString = [NSString stringWithFormat:@"0%d", second]; }else{ secondString = [NSString stringWithFormat:@"%d", second]; }
    return [NSString stringWithFormat:@"%@:%@", minuteString, secondString];
    
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

- (IBAction)showvalue:(UISlider *)sender {
    
    CMTime time = CMTimeMakeWithSeconds(_duration * sender.value, _fps);
    
    [player seekToTime:time toleranceBefore:kCMTimeZero toleranceAfter:kCMTimeZero completionHandler:^(BOOL finished) {
         [player play]; 
        
    }];
    
    
}

- (IBAction)touch:(UISlider *)sender {
    [player pause];
    
}
@end
