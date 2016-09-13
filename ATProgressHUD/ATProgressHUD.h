//
//  ATProgressHUD.h
//  ATKit
//
//  Created by Aesir Titan on 2016-09-12.
//  Copyright © 2016 Titan Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

#define atMarkSelfView [ATProgressHUD at_target:self.view showInfo:@"抱歉，此功能尚未开发！" duration:1]
#define atMarkSelf [ATProgressHUD at_target:self showInfo:@"抱歉，此功能尚未开发！" duration:1]

@interface ATProgressHUD : UIView

+ (void)at_target:(UIView *)target showInfo:(NSString *)info duration:(NSTimeInterval)duration;


@end
