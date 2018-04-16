//
//  YGSocialCircleVC.m
//  YGST
//
//  Created by yalong zhang on 2018/1/20.
//  Copyright © 2018年 yalong zhang. All rights reserved.
//

#import "YGSocialCircleVC.h"
#import "YGMoreVC.h"
#import "YGDetailDynamicVC.h"
#import <AVFoundation/AVFoundation.h>
#define h_line_y 53
@interface YGSocialCircleVC (){
    NSMutableArray *btn_width_array;
    UIButton *oldBtn;
    dispatch_queue_t videoProcessingQueue;
    dispatch_queue_t audioProcessingQueue;
}

@end
@implementation YGSocialCircleVC
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden =YES;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // [self setAnchorPoint:CGPointMake(100, 10) forView:_showview];
    // Do any additional setup after loading the view.
   // _showview.frame = CGRectMake(Iphone_Width-100, 64, 100, 150);
   
    videoProcessingQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    audioProcessingQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
//    _jfEncodeQueue_video = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    _jfEncodeQueue_audio = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //[self checkDeviceAuth];
    NSMutableArray *nums =[NSMutableArray arrayWithArray:@[@2,@5,@3,@7,@1,@9]];

   // [self bubbOrderArray:nums];
    [self qucikOrderArray:nums First:0 Last:5];
    
    for (int p=0; p<nums.count; p++) {
        
        NSLog(@"%@",nums[p]);
    }
    
    [_moreBtn.titleLabel setFont:iconfont(23)];
    [_moreBtn setTitle:@"\U0000e638" forState:UIControlStateNormal];
    [_moreBtn setTitleColor:mainGreen forState:UIControlStateNormal];
   
    NSArray *btn_titles =@[@"附近动态",@"消息",@"通讯录",@"朋友圈"];
    for (int b=0; b<_headerBtnArray.count; b++) {
        UIButton *tapBtn =_headerBtnArray[b];
        CGFloat width =[YGSTTool getWidthOfText:btn_titles[b] forHeight:30 andFontsize:15];
        [tapBtn setTitle:btn_titles[b] forState:UIControlStateNormal];
        [tapBtn setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
        [tapBtn setTitleColor:RGB(51, 51, 51) forState:UIControlStateHighlighted];
        [tapBtn setTitleColor:mainGreen forState:UIControlStateSelected];
        [btn_width_array addObject:[NSNumber numberWithFloat:width]];
        
        if (b==0){
            oldBtn=tapBtn;
            tapBtn.selected=YES;
            [self setH_LineWithBtn:tapBtn];
        }
        
    }
    
    //[self.navigationController pushViewController:[YGDetailDynamicVC new] animated:YES];
    
//    self.navigationController.navigationItem.titleView=_showview;
//    CGAffineTransform smaller = CGAffineTransformMakeScale(0.01, 0.01);//比例缩放
//    CGAffineTransform rightUpMove = CGAffineTransformMakeTranslation(_showview.frame.size.width/2, -_showview.frame.size.height/2);//平移
//    CGAffineTransform cat = CGAffineTransformConcat(smaller, rightUpMove);//合并两个矩阵变换
//    _showview.transform = cat;//设置_imageView的仿射变换
//    _showview.alpha = 0;//透明度
//    [self.view addSubview:_showview];
//    _showview.hidden = YES;
   
}

/**
 冒泡排序

 @param array 排序数组
 */
- (void)bubbOrderArray:(NSMutableArray *)array{
    
    NSNumber *g;
        for (int i=0; i<array.count-1; i++) {
    
             for (int p=i+1; p<array.count; p++) {
    
                 NSNumber *f =array[i];
                 NSNumber *s =array[p];
                 
                 if (f<s) {
                     g=array[i];
                     array[i]=array[p];
                     array[p]=g;
                 }
    
             }
    
    
        }
}

/**
 插入排序

 @param nums 排序数组
 */
- (void)inserOrderArray:(NSMutableArray *)nums{
    
    NSNumber *temp;
    int i,j;
    for(i=1;i<nums.count;i++){
        temp =nums[i];
        j=i-1;
        while (j>=0&&temp<nums[j]) {
            nums[j+1]=nums[j];
            j--;
        }
        
        nums[j+1]=temp;
        
    }
    
}
- (void)qucikOrderArray:(NSMutableArray *)a First:(int)i Last:(int)j{
    
    int m,n;
   
    NSNumber *temp;
    NSNumber *k;
    m=i;
    n=j;
    k=a[(i+j)/2]; /*选取的参照*/
    do {
        while(a[m]>k&&m<j) m++; /* 从左到右找比k大的元素*/
        while(a[n]<k&&n>i) n--; /* 从右到左找比k小的元素*/
        if(m<=n)
        { /*若找到且满足条件，则交换*/
            temp=a[m];
            a[m]=a[n];
            a[n]=temp;
            m++;
            n--;
        }
    }while(m<=n);
    
    if(m<j)[self qucikOrderArray:a First:m Last:j];
    
    if(n>i)[self qucikOrderArray:a First:i Last:n];
    
    
    
    
    
    
    
    
//    int m,n;
//    NSNumber *k;
//    NSNumber *temp;
//    m=f;
//    n=l;
//    k=array[(f+n)/2];
//    do {
//        while (array[m]<k&&m<l) {
//            m++;
//        }//从左到右找比k大的元素
//        while (array[m]>k&&n>f) {
//            n--;
//        }//从右到左找比k小的元素
//
//            if(m<=n){
//                temp=array[m];
//                array[m]=array[n];
//                array[n]=temp;
//                m++;
//                n--;
//            }
//    } while (m<=n);
//
//    if(m<l)[self qucikOrderArray:array First:m Last:l];
//    if(n>f)[self qucikOrderArray:array First:f Last:n];

    
}
-(void) setH_LineWithBtn:(UIButton *)btn{
    CGRect btnRect =btn.frame;
    [_h_line setFrame:CGRectMake(btnRect.origin.x, h_line_y, btnRect.size.width, 3)];
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
    NSLog(@"KKKKKKKKK%@",segue.destinationViewController);
}

- (void)checkDeviceAuth{
    switch ([AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo]) {
        case AVAuthorizationStatusAuthorized:   // 已授权
            NSLog(@"已授权");
            [self initAVCaptureSession];
            break;
        case AVAuthorizationStatusNotDetermined:    // 用户尚未进行允许或者拒绝,
        {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                if (granted) {
                    NSLog(@"已授权");
                    [self initAVCaptureSession];
                } else {
                    NSLog(@"用户拒绝授权摄像头的使用, 返回上一页, 请打开--> 设置 -- > 隐私 --> 通用等权限设置");
                }
            }];
        }
            break;
        default:
        {
            NSLog(@"用户尚未授权摄像头的使用权");
        }
            break;
    }
}
// 初始化 管理者
- (void)initAVCaptureSession {
    
    self.session = [[AVCaptureSession alloc] init];
    // 设置录像的分辨率
    // 先判断是被是否支持要设置的分辨率
    if ([self.session canSetSessionPreset:AVCaptureSessionPreset1280x720]) {
        // 如果支持则设置
        [self.session canSetSessionPreset:AVCaptureSessionPreset1280x720];
    } else if ([self.session canSetSessionPreset:AVCaptureSessionPresetiFrame960x540]) {
        [self.session canSetSessionPreset:AVCaptureSessionPresetiFrame960x540];
    } else if ([self.session canSetSessionPreset:AVCaptureSessionPreset640x480]) {
        [self.session canSetSessionPreset:AVCaptureSessionPreset640x480];
    }
    // 开始配置
    [self.session beginConfiguration];
    // 初始化视频管理
    self.videoDevice = nil;
    // 创建摄像头类型数组
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    // 便利管理抓捕道德所有支持制定类型的 设备集合
    for (AVCaptureDevice *device in devices) {
        if (device.position == AVCaptureDevicePositionBack) {
            self.videoDevice = device;
        }
    }
    // 视频
    [self videoInputAndOutput];
    
    // 音频
    [self audioInputAndOutput];
    
    // 录制的同时播放
    [self initPreviewLayer];
    
    // 提交配置
    [self.session commitConfiguration];
    
}
/// 视频输入输出
- (void)videoInputAndOutput {
    NSError *error;
    // 视频输入
    // 初始化 根据输入设备来初始化输出对象
    self.videoInput = [[AVCaptureDeviceInput alloc] initWithDevice:self.videoDevice error:&error];
    if (error) {
        NSLog(@"-- 摄像头出错 -- %@", error);
        return;
    }
    // 将输入对象添加到管理者 -- AVCaptureSession 中
    // 先判断是否能搞添加输入对象
    if ([self.session canAddInput:self.videoInput]) {
        // 管理者能够添加 才可以添加
        [self.session addInput:self.videoInput];
    }
    
    // 视频输出
    // 初始化 输出对象
    self.videoOutput = [[AVCaptureVideoDataOutput alloc] init];
    // 是否允许卡顿时丢帧
    self.videoOutput.alwaysDiscardsLateVideoFrames = NO;
    if ([self supportsFastTextureUpload])
    {
        // 是否支持全频色彩编码 YUV 一种色彩编码方式, 即YCbCr, 现在视频一般采用该颜色空间, 可以分离亮度跟色彩, 在不影响清晰度的情况下来压缩视频
        BOOL supportsFullYUVRange = NO;

        // 获取输出对象 支持的像素格式
        NSArray *supportedPixelFormats = self.videoOutput.availableVideoCVPixelFormatTypes;

        for (NSNumber *currentPixelFormat in supportedPixelFormats)
        {
            if ([currentPixelFormat intValue] == kCVPixelFormatType_420YpCbCr8BiPlanarFullRange)
            {
                supportsFullYUVRange = YES;
            }
        }

        // 根据是否支持 来设置输出对象的视频像素压缩格式,
        if (supportsFullYUVRange)
        {
            [self.videoOutput setVideoSettings:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:kCVPixelFormatType_420YpCbCr8BiPlanarFullRange] forKey:(id)kCVPixelBufferPixelFormatTypeKey]];
        }
        else
        {
            [self.videoOutput setVideoSettings:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange] forKey:(id)kCVPixelBufferPixelFormatTypeKey]];
        }
    }
    else
    {
        [self.videoOutput setVideoSettings:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:kCVPixelFormatType_32BGRA] forKey:(id)kCVPixelBufferPixelFormatTypeKey]];
    }

    // 设置代理
    [self.videoOutput setSampleBufferDelegate:self queue:videoProcessingQueue];
    
   
    // 判断管理是否可以添加 输出对象
    if ([self.session canAddOutput:self.videoOutput]) {
        [self.session addOutput:self.videoOutput];
        AVCaptureConnection *connection = [self.videoOutput connectionWithMediaType:AVMediaTypeVideo];
        // 设置视频的方向
        connection.videoOrientation = AVCaptureVideoOrientationPortrait;
        // 视频稳定设置
        if ([connection isVideoStabilizationSupported]) {
            connection.preferredVideoStabilizationMode = AVCaptureVideoStabilizationModeAuto;
        }
        connection.videoScaleAndCropFactor = connection.videoMaxScaleAndCropFactor;
    }
    
}


// 音频输入输出
- (void)audioInputAndOutput {
    NSError *jfError;
    // 音频输入设备
    self.audioDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeAudio];
    
    // 音频输入对象
    self.audioInput = [[AVCaptureDeviceInput alloc] initWithDevice:self.audioDevice error:&jfError];
    if (jfError) {
        NSLog(@"-- 录音设备出错 -- %@", jfError);
    }
    
    // 将输入对象添加到 管理者中
    if ([self.session canAddInput:self.audioInput]) {
        [self.session addInput:self.audioInput];
    }
    
    // 音频输出对象
    self.audioOutput = [[AVCaptureAudioDataOutput alloc] init];
    // 将输出对象添加到管理者中
    if ([self.session canAddOutput:self.audioOutput]) {
        [self.session addOutput:self.audioOutput];
    }
    
    // 设置代理
    [self.audioOutput setSampleBufferDelegate:self queue:audioProcessingQueue];
}
// 是否支持快速纹理更新
- (BOOL)supportsFastTextureUpload;
{
#if TARGET_IPHONE_SIMULATOR
    return NO;
#else
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wtautological-pointer-compare"
    return (CVOpenGLESTextureCacheCreate != NULL);
#pragma clang diagnostic pop
    
#endif
}
// 播放同时进行播放
- (void)initPreviewLayer {
    [self.view layoutIfNeeded];
    // 初始化对象
    UIView *liveView =[[UIView alloc] initWithFrame:CGRectMake(0, 100, Iphone_Width, 300)];
    //[liveView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:liveView];
    self.previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.session];
    self.previewLayer.frame = CGRectMake(0, 0, Iphone_Width, 300);
    self.previewLayer.connection.videoOrientation = [self.videoOutput connectionWithMediaType:AVMediaTypeVideo].videoOrientation;
    [self.previewLayer setBackgroundColor:[UIColor redColor].CGColor];
    self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    
   // self.previewLayer.position = CGPointMake(liveView.frame.size.width*0.5,liveView.frame.size.height*0.5);
    
    CALayer *layer = liveView.layer;
    layer.masksToBounds = true;
    [layer addSublayer:self.previewLayer];
  
}
#pragma mark --  AVCaptureAudioDataOutputSampleBufferDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection {
    
    if (captureOutput == self.audioOutput) {
//        [self.audioEncoder encodeSampleBuffer:sampleBuffer timeStamp:self.currentTimestamp completionBlock:^(NSData *encodedData, NSError *error) {
//            fwrite(encodedData.bytes, 1, encodedData.length, _aacFile);
//        }];
    } else {
//        [self.videoEncoder encodeWithSampleBuffer:sampleBuffer timeStamp:self.currentTimestamp completionBlock:^(NSData *data, NSInteger length) {
//            fwrite(data.bytes, 1, length, _h264File);
//        }];
    }
}
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    
    NSString *stringValue;
    if ([metadataObjects count] >0){
        //停止扫描 [_sessionstopRunning];
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0]; stringValue = metadataObject.stringValue; }
   
    
}
- (IBAction)Nslog:(UIButton *)sender {
    [self.session startRunning];
    if (sender==oldBtn)return;
    oldBtn.selected=NO;
    oldBtn=sender;
    sender.selected=YES;
   
    [UIView animateWithDuration:0.3 animations:^{
        [_h_line setFrame:CGRectMake(sender.frame.origin.x, h_line_y, sender.frame.size.width, 3)];
    } completion:^(BOOL finished) {
        
    }];
    
}

- (IBAction)clickToShowMoreView:(UIButton *)sender {
    YGMoreVC *more =[[YGMoreVC alloc] init];
    [more.view setFrame:self.view.bounds];
    [self.view addSubview:more.view];
    [self addChildViewController:more];
}
@end
