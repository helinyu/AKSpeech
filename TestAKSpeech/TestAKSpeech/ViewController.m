//
//  ViewController.m
//  TestAKSpeech
//
//  Created by Aka on 2017/8/30.
//  Copyright © 2017年 Aka. All rights reserved.
//

#import "ViewController.h"
#import "AKSpeechMgr.h"
#import "AKSpeechModel.h"

@interface ViewController ()

@property (nonatomic, strong) UITextView *textview;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"播放语音" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onPlayUtterance) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 100, 100, 30);
    
    UIButton *pauseBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [pauseBtn setTitle:@"暂停播放" forState:UIControlStateNormal];
    [pauseBtn addTarget:self action:@selector(onPauseUtterance) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pauseBtn];
    pauseBtn.frame = CGRectMake(200, 100, 100, 30);

    UITextView *textView = [UITextView new];
    textView.frame = CGRectMake(100, 150, 200, 300);
    [self.view addSubview:textView];
    textView.backgroundColor = [UIColor yellowColor];
    textView.text = @"主角要走那一条比较坎坷的路，有个走过那条路的人劝主角不要走那条路，主角不听 非要走，结果体验到看艰辛 劝其他人不要走那条路，其他人也不听";
    _textview = textView;
    
    UIButton *stopBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [stopBtn setTitle:@"停止播放" forState:UIControlStateNormal];
    [stopBtn addTarget:self action:@selector(onStopUtterance) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopBtn];
    stopBtn.frame = CGRectMake(100, 500, 100, 30);
    
    UIButton *continueBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [continueBtn setTitle:@"继续播放" forState:UIControlStateNormal];
    [continueBtn addTarget:self action:@selector(onContinueSpeeaking) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:continueBtn];
    continueBtn.frame = CGRectMake(200, 500, 100, 30);
    

}

- (void)onPlayUtterance {
    AKSpeechMgr *mgr = [AKSpeechMgr shared];
    AKSpeechModel *item = [AKSpeechModel new];
    item.contentText =self.textview.text;
    item.language = @"zh-CN";
    [mgr speechWithItem:item complete:^(AVSpeechSynthesizer *synthesizer, AVSpeechUtterance *utterance, NSRange characterRange, AKASpeechDelegateType type) {
        NSLog(@"type :%ld , speech noew content : %@",type,[utterance.speechString substringWithRange:characterRange]);
    }];
}

- (void)onPauseUtterance {
    if([AKSpeechMgr shared].isSpeaking) {
//        [AKSpeechMgr shared]
        [[AKSpeechMgr shared] pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];
//        [[AKSpeechMgr shared] pauseSpeakingAtBoundary:AVSpeechBoundaryWord];
    }
}

- (void)onStopUtterance {
    [[AKSpeechMgr shared] stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
//    [[AKSpeechMgr shared] stopSpeakingAtBoundary:AVSpeechBoundaryWord];
}

- (void)onContinueSpeeaking{
    [[AKSpeechMgr shared] continueSpeaking];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
