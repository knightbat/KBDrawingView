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
* Getting output image 

``` objective-c
   UIImage *rendredImage = [self.drawingView renderImage];
```
