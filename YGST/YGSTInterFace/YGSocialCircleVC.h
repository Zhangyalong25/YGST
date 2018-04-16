//
//  YGSocialCircleVC.h
//  YGST
//
//  Created by yalong zhang on 2018/1/20.
//  Copyright © 2018年 yalong zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface YGSocialCircleVC : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UIView *showview;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *headerBtnArray;
@property(nonatomic,strong)AVCaptureSession *session;
@property(nonatomic,strong)AVCaptureDevice *videoDevice;
@property(nonatomic,strong)AVCaptureVideoPreviewLayer *previewLayer;
@property(nonatomic,strong)AVCaptureDevice *audioDevice;
@property(nonatomic,strong)AVCaptureDeviceInput *audioInput;
@property(nonatomic,strong)AVCaptureAudioDataOutput *audioOutput;
@property(nonatomic,strong)AVCaptureDeviceInput *videoInput;
@property(nonatomic,strong)AVCaptureVideoDataOutput *videoOutput;
//@property(nonatomic,strong)AVCaptureMetadataOutput *MetadataOutput;
@property (weak, nonatomic) IBOutlet UIView *h_line;
- (IBAction)Nslog:(UIButton *)sender;
- (IBAction)clickToShowMoreView:(UIButton *)sender;

@end
