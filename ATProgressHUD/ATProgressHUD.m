//
//  ATProgressHUD.m
//  ATKit
//
//  Created by Aesir Titan on 2016-09-12.
//  Copyright © 2016 Titan Studio. All rights reserved.
//

#import "ATProgressHUD.h"

static UIColor *tintColor;

// screen marco
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define kScreenCenterX (0.5 * kScreenW)
#define kScreenCenterY (0.5 * kScreenH)

static inline CGFloat HeightWithTextFontWidth(NSString *text,UIFont *font,CGFloat width){
    NSDictionary *dict = @{NSFontAttributeName:font};
    return [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dict context:nil].size.height;
}

static UIView *sPopView;

static UIView *sMaskView;

// label
static UILabel *sLabel;

static BOOL isShowing = NO;

@implementation ATProgressHUD

+ (void)load{
    [super load];
    tintColor = [UIColor colorWithRed:0.4 green:0.8 blue:1 alpha:1];
}

+ (void)at_target:(UIView *)target showInfo:(NSString *)info duration:(NSTimeInterval)duration {
    if (!isShowing) {
        sPopView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.6*kScreenW, 30)];
        [self _initMaskView];
        [self setupLabelWithContent:info];
        [self pushTo:target duration:duration];
    }
}


// setup label
+ (void)setupLabelWithContent:(NSString *)content{
    // lanel
    sLabel = [[UILabel alloc] init];
    [sPopView addSubview:sLabel];
    sLabel.numberOfLines = 0;
    sLabel.text = content;
    sLabel.font = [UIFont systemFontOfSize:13];
    sLabel.textColor = tintColor;
    CGRect frameLabel = sPopView.frame;
    frameLabel.size.width = sPopView.frame.size.width - 32;
    frameLabel.origin.x = 0.5 * (sPopView.frame.size.width - frameLabel.size.width);
    frameLabel.size.height = HeightWithTextFontWidth(content, [UIFont systemFontOfSize:13], frameLabel.size.width);
    frameLabel.origin.y = 0.5 * (sPopView.frame.size.height - frameLabel.size.height);
    sLabel.frame = frameLabel;
    // view
    sPopView.backgroundColor = [UIColor whiteColor];
    sPopView.layer.cornerRadius = 2;
    sPopView.layer.shadowOpacity = 0.4;
    sPopView.layer.shadowRadius = 3;
    sPopView.layer.shadowOffset = CGSizeMake(0, 2.8);
    
    CGRect framePopView = sPopView.frame;
    framePopView.size.height = frameLabel.size.height + 16;
    framePopView.origin.x = 0.5 * (kScreenW - framePopView.size.width);
    framePopView.origin.y = 0.5 * (kScreenH - framePopView.size.height);
    sPopView.frame = framePopView;
    
}


+ (void)pushTo:(UIView *)view duration:(NSTimeInterval)duration{
    [self _hideTips];
    
    [view addSubview:sPopView];
    if (!isShowing) {
        isShowing = YES;
        [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [self _showTips];
        } completion:^(BOOL finished) {
            [self performSelector:@selector(_dismissAnimation) withObject:nil afterDelay:duration];
        }];
    }
}

+ (void)_dismissAnimation{
    if (isShowing) {
        [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [self _hideTips];
        } completion:^(BOOL finished) {
            isShowing = NO;
            [sPopView removeFromSuperview];
        }];
    }
}

+ (void)_hideTips{
    sPopView.alpha = 0;
    sPopView.backgroundColor = [UIColor lightGrayColor];
    sPopView.transform = CGAffineTransformMakeScale(0.8, 0.8);
    sMaskView.transform = CGAffineTransformIdentity;
}

+ (void)_showTips{
    sPopView.alpha = 1;
    sPopView.backgroundColor = [UIColor whiteColor];
    sPopView.transform = CGAffineTransformIdentity;
    sMaskView.transform = CGAffineTransformMakeScale(40, 40);
}

+ (void)_initMaskView{
    sMaskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 8)];
    sMaskView.backgroundColor = [UIColor whiteColor];
    sMaskView.clipsToBounds = YES;
    sMaskView.layer.cornerRadius = 0.5 * sMaskView.frame.size.width;
    CGRect frame = sMaskView.frame;
    frame.origin.x = 0.5 * (sPopView.frame.size.width - frame.size.width);
    frame.origin.y = 0.5 * (sPopView.frame.size.height - frame.size.height);
    sMaskView.frame = frame;
    sPopView.maskView = sMaskView;
}


@end
