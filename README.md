# KBDrawingView
A Simple Drawing view in objC using tutsplus tutorial [Smooth Freehand Drawing on iOS](http://code.tutsplus.com/tutorials/smooth-freehand-drawing-on-ios--mobile-13164).

## Installation

### Manual

Drag and drop KBDrawingView.h and KBDrawingView.m files to your project

### CocoaPods

Add this line to your pod file
```bash
pod 'KBDrawingView'
```

## Usage

* Creating drawing view
``` objective-c
    self.drawingView = [KBDrawingView alloc] init];
    self.drawingView.delegate = self;
```
* Configuration

``` objective-c
   self.drawingView.lineColor = [UIColor grayColor];
   self.drawingView.lineWidth = @4;
   self.drawingView.minimumDrawLength = @10;
```
* Getting output image 

``` objective-c
   UIImage *rendredImage = [self.drawingView renderImage];
```
