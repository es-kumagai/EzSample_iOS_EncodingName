//
//  EzSampleViewController.m
//  EzSample_iOS_EncodingName
//
//  Created by 熊谷 友宏 on 2012/08/17.
//  Copyright (c) 2012年 EasyStyle G.K. All rights reserved.
//

#import "EzSampleViewController.h"

@interface EzSampleViewController ()

@end

@implementation EzSampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.CFStringEncodingLabel.text = nil;
    self.NSStringEncodingLabel.text = nil;
    self.encodingNameLabel.text = nil;
	self.localizedNameOfStringEncodingLabel.text = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)pushConvertButton:(UIButton *)sender
{
    NSString* encodingName = self.encodingNameTextField.text;
    
    if (encodingName.length > 0)
    {
		// 文字列から NSStringEncoding に変換します。
        CFStringEncoding cf_encoding = CFStringConvertIANACharSetNameToEncoding((__bridge CFStringRef)encodingName);
		NSStringEncoding ns_encoding = CFStringConvertEncodingToNSStringEncoding(cf_encoding);

		// 取得した NSStringEncoding の表示名を取得していますが、取得できない場合が多いようです。
		NSString* ns_localizedNameOfStringEncoding = [NSString localizedNameOfStringEncoding:ns_encoding];
		
		// NSStringEncoding から文字列に変換し直します。（検証用）
		NSStringEncoding re_cf_encoding = CFStringConvertNSStringEncodingToEncoding(ns_encoding);
		NSString* re_encodingName = (__bridge NSString*)CFStringConvertEncodingToIANACharSetName(re_cf_encoding);
		
		// 変換結果を表示します。
		self.CFStringEncodingLabel.text = [[NSString alloc] initWithFormat:@"%ld", (CFIndex)cf_encoding];
		self.NSStringEncodingLabel.text = [[NSString alloc] initWithFormat:@"%lu", (UInt32)ns_encoding];
		self.encodingNameLabel.text = re_encodingName;
		self.localizedNameOfStringEncodingLabel.text = ns_localizedNameOfStringEncoding;
    }
    else
    {
        self.CFStringEncodingLabel.text = nil;
        self.NSStringEncodingLabel.text = nil;
        self.encodingNameLabel.text = nil;
		self.localizedNameOfStringEncodingLabel.text = nil;
    }
}

@end
