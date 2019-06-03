# GDColorSlider
* GDColorSlider is a Color select bar
* 这是一个选择颜色的滑动条
* これは色の選択スライダー

## A Quick Peek

<img src="https://github.com/jojojoe/GDColorSlider/blob/master/r_demo_2.png"  height="448" width="207">
<!--![screenshot](https://github.com/jojojoe/GDColorSlider/blob/master/r_demo_2.png)-->

<!--<iframe height=400 width=300 src="https://github.com/jojojoe/GDColorSlider/blob/master/r_demo_1.gif">-->

## Usage

* 1、通过storyboard 直接拖拽UIView控件，修改类为GDColorSlider即可。可修改属性

<img src="https://github.com/jojojoe/GDColorSlider/blob/master/r_demo_3.png"  height="119" width="261">


* 2、通过代码添加

**导入头文件 #import "GDColorSlider.h"**

```obj-c
    GDColorSlider *colorSlider = [[GDColorSlider alloc] initWithFrame:CGRectMake(0, 0, 300, 80)];
    colorSlider.center = CGPointMake(UIScreen.mainScreen.bounds.size.width / 2, UIScreen.mainScreen.bounds.size.height - 80);
    [self.view addSubview:colorSlider];
    
    colorSlider.isShowContentIndicate = YES;
    colorSlider.isShowBottomIndicate = YES;
    colorSlider.isShowRightIndicate = YES;
    colorSlider.colorImageName = @"colorpan";
    
    [colorSlider addTarget:self action:@selector(colorValueChange:) forControlEvents:UIControlEventValueChanged];
```

```obj-c
	- (void)colorValueChange:(GDColorSlider *)sender {
	    self.contentPreview.backgroundColor = sender.selectedColor;
	}
```


**只需要传进来颜色图片名即可（默认是一张颜色条图）** 
**isShowContentIndicate 、 isShowBottomIndicate 、 isShowRightIndicate 分别控制颜色区域的指针、底部指针、右侧指针的显示与否**

## Installation
GDColorSlider is available on CocoaPods. Add the follwing to your Podfile:

`pod 'GDColorSlider'`

Alternatively, you can manually drag the GDColorSlider folder into your Xcode project


