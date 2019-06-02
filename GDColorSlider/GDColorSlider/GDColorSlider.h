//
//  GDColorSlider.h
//  GDGradPro
//
//  Created by JOJO on 2019/5/10.
//  Copyright © 2019 JOJO. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GDColorSlider;
@protocol GDColorSliderDelegate <NSObject>

//- (void)colorSlider:(GDColorSlider *)colorSlider selectColor:(UIColor *)color;

@end

@interface GDColorSlider : UIControl

@property (nonatomic, assign) IBInspectable BOOL isShowContentIndicate;
@property (nonatomic, assign) IBInspectable BOOL isShowBottomIndicate;
@property (nonatomic, assign) IBInspectable BOOL isShowRightIndicate;
@property (nonatomic, strong) IBInspectable NSString *colorImageName;
//@property (nonatomic, weak) id<GDColorSliderDelegate> delegate;

@property (strong, nonatomic, readonly) UIColor *selectedColor;

@end

NS_ASSUME_NONNULL_END
