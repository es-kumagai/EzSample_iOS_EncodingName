//
//  EzSampleViewController.h
//  EzSample_iOS_EncodingName
//
//  Created by 熊谷 友宏 on 2012/08/17.
//  Copyright (c) 2012年 EasyStyle G.K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EzSampleViewController : UIViewController

@property (nonatomic,readonly,weak) IBOutlet UITextField* encodingNameTextField;

@property (nonatomic,readonly,weak) IBOutlet UILabel* CFStringEncodingLabel;
@property (nonatomic,readonly,weak) IBOutlet UILabel* NSStringEncodingLabel;
@property (nonatomic,readonly,weak) IBOutlet UILabel* encodingNameLabel;
@property (nonatomic,readonly,weak) IBOutlet UILabel* localizedNameOfStringEncodingLabel;

- (IBAction)pushConvertButton:(UIButton*)sender;

@end
