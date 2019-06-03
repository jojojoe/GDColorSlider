//
//  ViewController.m
//  GDColorSlider
//
//  Created by Joe on 2019/6/1.
//  Copyright © 2019 Joe. All rights reserved.
//

#import "ViewController.h"
#import "GDColorSlider.h"

@interface ViewController ()
- (IBAction)colorSliderValueChange:(GDColorSlider *)sender;
@property (weak, nonatomic) IBOutlet UIView *contentPreview;
@property (weak, nonatomic) IBOutlet GDColorSlider *colorRoundSlider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupColorSliderWithCode];
    [self setupColorRoundSlider];
    
}

- (void)setupColorSliderWithCode {
    GDColorSlider *colorSlider = [[GDColorSlider alloc] initWithFrame:CGRectMake(0, 0, 300, 80)];
    colorSlider.center = CGPointMake(UIScreen.mainScreen.bounds.size.width / 2, UIScreen.mainScreen.bounds.size.height - 80);
    [self.view addSubview:colorSlider];
    
    colorSlider.isShowContentIndicate = YES;
    colorSlider.isShowBottomIndicate = YES;
    colorSlider.isShowRightIndicate = YES;
    colorSlider.colorImageName = @"colorpan";
    
    [colorSlider addTarget:self action:@selector(colorValueChange:) forControlEvents:UIControlEventValueChanged];
}

- (void)setupColorRoundSlider {
    self.colorRoundSlider.layer.cornerRadius = 100;
    self.colorRoundSlider.layer.masksToBounds = YES;
    self.colorRoundSlider.clipsToBounds = YES;
}

- (void)colorValueChange:(GDColorSlider *)sender {
    self.contentPreview.backgroundColor = sender.selectedColor;
}

- (IBAction)colorSliderValueChange:(GDColorSlider *)sender {
    self.contentPreview.backgroundColor = sender.selectedColor;
}
@end
