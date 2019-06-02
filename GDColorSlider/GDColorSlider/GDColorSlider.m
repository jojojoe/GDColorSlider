//
//  GDColorSlider.m
//  GDGradPro
//
//  Created by JOJO on 2019/5/10.
//  Copyright © 2019 JOJO. All rights reserved.
//

#import "GDColorSlider.h"
#import "UIImage+color.h"
#import <Masonry.h>



@interface GDColorSlider()

@property (strong, nonatomic) UIImageView *sliderImageView;
@property (strong, nonatomic) UIImageView *indicateImageView_c;
@property (strong, nonatomic) UIImageView *indicateImageView_b;
@property (strong, nonatomic) UIImageView *indicateImageView_r;


@end

@implementation GDColorSlider

#pragma mark - Publick
- (void)setIsShowBottomIndicate:(BOOL)isShowBottomIndicate {
    _isShowBottomIndicate = isShowBottomIndicate;
    [self updateLayout];
}

- (void)setIsShowRightIndicate:(BOOL)isShowRightIndicate {
    _isShowRightIndicate = isShowRightIndicate;
    [self updateLayout];
}

- (void)setIsShowContentIndicate:(BOOL)isShowContentIndicate {
    _isShowContentIndicate = isShowContentIndicate;
    [self updateLayout];
}


- (void)setColorImageName:(NSString *)colorImageName{
    _colorImageName = colorImageName;
    if (![UIImage imageNamed:colorImageName]) {
        _colorImageName = @"colorSliderView";
    }
    self.sliderImageView.image = [UIImage imageNamed:_colorImageName];
}

#pragma mark - Init
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [self setupSliderImageView];
    [self setupContentIndicate];
    [self setupBottomIndicate];
    [self setupRightIndicate];
    
    self.backgroundColor = [UIColor clearColor];
    self.clipsToBounds = NO;
}

- (void)setupSliderImageView {
    self.sliderImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 10)];
    self.sliderImageView.contentMode = UIViewContentModeScaleToFill;
    if (!self.colorImageName) {
        self.colorImageName = @"colorSliderView";
    }
    self.sliderImageView.image = [UIImage imageNamed:self.colorImageName];
    [self addSubview:self.sliderImageView];
    
    [self updateLayout];
}

- (void)updateLayout {
    [self.sliderImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        

        if (self.isShowBottomIndicate) {
            make.bottom.mas_equalTo(-10);
        } else {
            make.bottom.mas_equalTo(0);
        }
        if (self.isShowRightIndicate) {
            make.right.mas_equalTo(-10);
        } else {
            make.right.mas_equalTo(0);
        }
    }];
    if (self.isShowRightIndicate) {
        self.indicateImageView_r.hidden = NO;
    } else {
        self.indicateImageView_r.hidden = YES;
    }
    
    if (self.isShowBottomIndicate) {
        self.indicateImageView_b.hidden = NO;
    } else {
        self.indicateImageView_b.hidden = YES;
    }
    
    if (self.isShowContentIndicate) {
        self.indicateImageView_c.hidden = NO;
    } else {
        self.indicateImageView_c.hidden = YES;
    }
    
    [self setNeedsDisplay];
}

- (void)setupContentIndicate {
    self.indicateImageView_c = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 8, 8)];
    self.indicateImageView_c.backgroundColor = [UIColor clearColor];
    self.indicateImageView_c.layer.cornerRadius = 4;
    self.indicateImageView_c.layer.borderColor = [UIColor whiteColor].CGColor;
    self.indicateImageView_c.layer.borderWidth = 1;
    self.indicateImageView_c.layer.shadowColor = [UIColor blackColor].CGColor;
    self.indicateImageView_c.layer.shadowOffset = CGSizeMake(0, 0);
    self.indicateImageView_c.layer.shadowRadius = 1;
    self.indicateImageView_c.layer.shadowOpacity = 0.5;
    [self addSubview:self.indicateImageView_c];
    
}

- (void)setupBottomIndicate {
    self.indicateImageView_b = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 10, 16, 10)];
    self.indicateImageView_b.backgroundColor = [UIColor clearColor];
    self.indicateImageView_b.contentMode = UIViewContentModeScaleAspectFit;
    self.indicateImageView_b.image = [[UIImage imageNamed:@"indicate_b"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.indicateImageView_b.tintColor = [UIColor blackColor];
    [self addSubview:self.indicateImageView_b];
}

- (void)setupRightIndicate {
    self.indicateImageView_r = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width - 10, 0, 10, 16)];
    self.indicateImageView_r.backgroundColor = [UIColor clearColor];
    self.indicateImageView_r.contentMode = UIViewContentModeScaleAspectFit;
    self.indicateImageView_r.image = [[UIImage imageNamed:@"indicate_r"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.indicateImageView_r.tintColor = [UIColor blackColor];
    [self addSubview:self.indicateImageView_r];
}


- (UIColor *)selectedColorWithlocationViewPoint:(CGPoint)locationPoint {
    
    CGFloat x_P = locationPoint.x > CGRectGetMaxX(self.sliderImageView.frame)?CGRectGetMaxX(self.sliderImageView.frame): locationPoint.x;
    CGFloat y_P = locationPoint.y > CGRectGetMaxY(self.sliderImageView.frame)?CGRectGetMaxY(self.sliderImageView.frame): locationPoint.y;
    
    CGPoint cPoint = CGPointMake(x_P, y_P);
    CGFloat scalex = self.sliderImageView.frame.size.width  / self.sliderImageView.image.size.width;
    CGFloat scaley = self.sliderImageView.frame.size.height  / self.sliderImageView.image.size.height;
    CGPoint rPoint = CGPointMake(cPoint.x / scalex, cPoint.y / scaley);
    UIColor *color = [[self.sliderImageView.image colorAtPixel:rPoint] colorWithAlphaComponent:1.0f];
    return color;
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [super beginTrackingWithTouch:touch withEvent:event];
    CGPoint point = [touch locationInView:self];
    _selectedColor = [self selectedColorWithlocationViewPoint:point];
    if (_selectedColor) {
        
    }
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    [self updateIndicateViewFrameWithPoint:point];
    return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [super continueTrackingWithTouch:touch withEvent:event];
    CGPoint point = [touch locationInView:self];
    CGPoint cPoint = CGPointMake(point.x, point.y);
    if (!CGRectContainsPoint(self.sliderImageView.frame, cPoint)) {
        
        NSLog(@"边界外 -- self.sliderImageView.frame.x=%f.y=%f.width=%f.height=%f",self.sliderImageView.frame.origin.x,self.sliderImageView.frame.origin.y,self.sliderImageView.frame.size.width,self.sliderImageView.frame.size.height);
        return NO;
    } else {
        NSLog(@"边界内 -- self.sliderImageView.frame.x=%f.y=%f.width=%f.height=%f",self.sliderImageView.frame.origin.x,self.sliderImageView.frame.origin.y,self.sliderImageView.frame.size.width,self.sliderImageView.frame.size.height);
    }
    _selectedColor = [self selectedColorWithlocationViewPoint:point];
    if (_selectedColor) {
        
    }
    
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    [self updateIndicateViewFrameWithPoint:point];
    return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [super endTrackingWithTouch:touch withEvent:event];
}


- (void)updateIndicateViewFrameWithPoint:(CGPoint)point {
    [UIView animateWithDuration:0.3 animations:^{
        self.indicateImageView_b.frame = CGRectMake(point.x - self.indicateImageView_b.bounds.size.width / 2, CGRectGetMaxY(self.sliderImageView.frame), self.indicateImageView_b.frame.size.width, self.indicateImageView_b.frame.size.height);
        
        self.indicateImageView_r.frame = CGRectMake(CGRectGetMaxX(self.sliderImageView.frame),point.y - self.indicateImageView_r.bounds.size.height / 2, self.indicateImageView_r.frame.size.width, self.indicateImageView_r.frame.size.height);
        
        self.indicateImageView_c.center = point;
    }];
    
}




@end
