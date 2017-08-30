//
//  AKSpeechModel.m
//  AKSpeech
//
//  Created by Aka on 2017/8/30.
//  Copyright © 2017年 Aka. All rights reserved.
//

#import "AKSpeechModel.h"

@implementation AKSpeechModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _rate = 0.5;
        _volume = 1.f;
    }
    return self;
}

@end
