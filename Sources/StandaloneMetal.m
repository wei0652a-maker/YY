#import "RecoveredInterfaces.h"
@implementation fMUAsOMbCjhB
- (id)initWithFrame:(CGRect)frame { id<MTLDevice> d=MTLCreateSystemDefaultDevice(); if((self=[super initWithFrame:frame device:d])){ self.delegate=self; self.enableSetNeedsDisplay=NO; self.paused=NO; self.framebufferOnly=YES; self.clearColor=MTLClearColorMake(0,0,0,0); self.opaque=NO; self.backgroundColor=UIColor.clearColor; self.commandQueue=[d newCommandQueue]; self.loader=[[MTKTextureLoader alloc] initWithDevice:d]; self.multipleTouchEnabled=YES; } return self; }
- (void)drawInMTKView:(MTKView *)view { id<CAMetalDrawable> drawable=view.currentDrawable; MTLRenderPassDescriptor *pass=view.currentRenderPassDescriptor; if(!drawable||!pass||!self.commandQueue)return; id<MTLCommandBuffer> cb=[self.commandQueue commandBuffer]; id<MTLRenderCommandEncoder> enc=[cb renderCommandEncoderWithDescriptor:pass]; [enc endEncoding]; [cb presentDrawable:drawable]; [cb commit]; }
- (void)mtkView:(MTKView *)view drawableSizeWillChange:(CGSize)size { [[NSNotificationCenter defaultCenter] postNotificationName:@"YYStandaloneMetalDrawableSizeChanged" object:self userInfo:@{@"width":@(size.width),@"height":@(size.height)}]; }
- (UIView *)hitTest:(CGPoint)p withEvent:(UIEvent *)e { return CGRectContainsPoint(self.bounds,p)?self:nil; }
- (void)sendTouch:(UITouch *)touch phase:(int)phase { CGPoint p=[touch locationInView:self]; [[NSNotificationCenter defaultCenter] postNotificationName:@"YYStandaloneMetalTouch" object:self userInfo:@{@"x":@(p.x),@"y":@(p.y),@"phase":@(phase)}]; }
- (void)touchesBegan:(NSSet *)t withEvent:(UIEvent *)e { for(UITouch *x in t)[self sendTouch:x phase:0]; }
- (void)touchesMoved:(NSSet *)t withEvent:(UIEvent *)e { for(UITouch *x in t)[self sendTouch:x phase:1]; }
- (void)touchesEnded:(NSSet *)t withEvent:(UIEvent *)e { for(UITouch *x in t)[self sendTouch:x phase:2]; }
- (void)touchesCancelled:(NSSet *)t withEvent:(UIEvent *)e { for(UITouch *x in t)[self sendTouch:x phase:3]; }
@end

