#import "RecoveredInterfaces.h"
#import <objc/runtime.h>

@implementation UIColor (Hex)
+ (id)eLjjLCMRmcWr:(id)value { return [self eLjjLCMRmcWr:value alpha:1.0]; }
+ (id)eLjjLCMRmcWr:(id)value alpha:(double)alpha {
    if (![value isKindOfClass:NSString.class]) return UIColor.clearColor;
    NSString *s=[(NSString *)value stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if (s.length==3) s=[NSString stringWithFormat:@"%C%C%C%C%C%C",[s characterAtIndex:0],[s characterAtIndex:0],[s characterAtIndex:1],[s characterAtIndex:1],[s characterAtIndex:2],[s characterAtIndex:2]];
    if (s.length != 6) return UIColor.clearColor;
    NSScanner *scanner=[NSScanner scannerWithString:s]; unsigned v=0;
    if (![scanner scanHexInt:&v] || !scanner.isAtEnd) return UIColor.clearColor;
    alpha=MIN(1.0,MAX(0.0,alpha));
    return [UIColor colorWithRed:((v>>16)&255)/255.0 green:((v>>8)&255)/255.0 blue:(v&255)/255.0 alpha:alpha];
}
@end

@implementation WKWebView (EVlBSxhCcmnd)
- (id)hr_loadRequest:(id)request {
    if (![request isKindOfClass:NSURLRequest.class]) return nil;
    NSURLRequest *r=(NSURLRequest *)request;
    NSURL *u=r.URL; if(!u || !([@[ @"http", @"https", @"file" ] containsObject:u.scheme.lowercaseString])) return nil;
    return [self loadRequest:r];
}
@end

@implementation xdtFJuEDLscC
- (instancetype)initWithFrame:(CGRect)frame { if((self=[super initWithFrame:frame])){ self.blurEffectStyle=UIBlurEffectStyleLight; self.style=0; self.color=[UIColor colorWithWhite:0 alpha:.8]; [self updateForBackgroundStyle]; } return self; }
- (CGSize)intrinsicContentSize { return CGSizeMake(UIViewNoIntrinsicMetric, UIViewNoIntrinsicMetric); }
- (void)setStyle:(long long)v { _style=v; [self updateForBackgroundStyle]; }
- (void)setColor:(UIColor *)v { _color=v; [self updateForBackgroundStyle]; }
- (void)setBlurEffectStyle:(long long)v { _blurEffectStyle=v; [self updateForBackgroundStyle]; }
- (void)updateForBackgroundStyle { if(_style==1){ if(!self.effectView){ self.effectView=[[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:(UIBlurEffectStyle)_blurEffectStyle]]; self.effectView.frame=self.bounds; self.effectView.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight; [self addSubview:self.effectView]; } self.backgroundColor=UIColor.clearColor; } else { [self.effectView removeFromSuperview]; self.effectView=nil; self.backgroundColor=_color ?: [UIColor colorWithWhite:0 alpha:.8]; } }
- (void)updateViewsForColor:(id)c { self.color=c; }
@end

@implementation EScVqMCzGmbq
- (id)init { return [self initWithFrame:CGRectZero]; }
- (id)initWithFrame:(CGRect)f { if((self=[super initWithFrame:f])){ _progressTintColor=UIColor.whiteColor; _backgroundTintColor=[UIColor colorWithWhite:1 alpha:.2]; self.backgroundColor=UIColor.clearColor; } return self; }
- (CGSize)intrinsicContentSize { return CGSizeMake(37,37); }
- (void)setProgress:(float)p { _progress=MIN(1,MAX(0,p)); [self setNeedsDisplay]; }
- (void)setProgressTintColor:(UIColor *)c { _progressTintColor=c; [self setNeedsDisplay]; }
- (void)setBackgroundTintColor:(UIColor *)c { _backgroundTintColor=c; [self setNeedsDisplay]; }
- (void)drawRect:(CGRect)r { CGPoint c=CGPointMake(CGRectGetMidX(r),CGRectGetMidY(r)); CGFloat rad=MIN(r.size.width,r.size.height)/2-2; UIBezierPath *bg=[UIBezierPath bezierPathWithArcCenter:c radius:rad startAngle:-M_PI_2 endAngle:M_PI*1.5 clockwise:YES]; bg.lineWidth=2; [_backgroundTintColor setStroke]; [bg stroke]; UIBezierPath *fg=[UIBezierPath bezierPathWithArcCenter:c radius:rad startAngle:-M_PI_2 endAngle:-M_PI_2+M_PI*2*_progress clockwise:YES]; fg.lineWidth=_annular?4:2; [_progressTintColor setStroke]; [fg stroke]; if(!_annular && _progress>0){ UIBezierPath *sector=[UIBezierPath bezierPath]; [sector moveToPoint:c]; [sector addArcWithCenter:c radius:MAX(0,rad-3) startAngle:-M_PI_2 endAngle:-M_PI_2+M_PI*2*_progress clockwise:YES]; [sector closePath]; [_progressTintColor setFill]; [sector fill]; } }
@end

@implementation WpDAoegvehiS
- (id)init { return [self initWithFrame:CGRectZero]; }
- (id)initWithFrame:(CGRect)f { if((self=[super initWithFrame:f])){ _lineColor=UIColor.whiteColor; _progressColor=UIColor.whiteColor; _progressRemainingColor=[UIColor colorWithWhite:1 alpha:.2]; self.backgroundColor=UIColor.clearColor;} return self; }
- (CGSize)intrinsicContentSize { return CGSizeMake(37,37); }
- (void)setProgress:(float)p { _progress=MIN(1,MAX(0,p)); [self setNeedsDisplay]; }
- (void)setProgressColor:(UIColor *)c {_progressColor=c;[self setNeedsDisplay];} - (void)setProgressRemainingColor:(UIColor *)c {_progressRemainingColor=c;[self setNeedsDisplay];} - (void)setLineColor:(UIColor *)c {_lineColor=c;[self setNeedsDisplay];}
- (void)drawRect:(CGRect)r { CGRect b=CGRectInset(r,2,2); UIBezierPath *ring=[UIBezierPath bezierPathWithOvalInRect:b]; ring.lineWidth=2; [_progressRemainingColor setStroke]; [ring stroke]; CGPoint c=CGPointMake(CGRectGetMidX(r),CGRectGetMidY(r)); CGFloat rad=MIN(b.size.width,b.size.height)/2; UIBezierPath *p=[UIBezierPath bezierPathWithArcCenter:c radius:rad startAngle:-M_PI_2 endAngle:-M_PI_2+2*M_PI*_progress clockwise:YES]; p.lineWidth=2; [_progressColor setStroke]; [p stroke]; }
@end

@implementation MBProgressHUDRoundedButton
- (id)initWithFrame:(CGRect)f { if((self=[super initWithFrame:f])){ self.contentEdgeInsets=UIEdgeInsetsMake(8,12,8,12); self.layer.cornerRadius=6; } return self; }
- (void)layoutSubviews { [super layoutSubviews]; self.layer.cornerRadius=MIN(8,self.bounds.size.height/2); }
- (CGSize)intrinsicContentSize { CGSize s=[super intrinsicContentSize]; return CGSizeMake(s.width+24,s.height+12); }
- (void)setTitleColor:(UIColor *)c forState:(UIControlState)s { [super setTitleColor:c forState:s]; self.layer.borderColor=c.CGColor; self.layer.borderWidth=1; }
- (void)setHighlighted:(BOOL)h { [super setHighlighted:h]; self.alpha=h?.6:1; }
@end

@implementation vJGSVdmCkjYr {
    xdtFJuEDLscC *_bezelView; xdtFJuEDLscC *_backgroundView; UILabel *_label; UILabel *_detailsLabel; MBProgressHUDRoundedButton *_button;
}
+ (id)ksvHJIfPAnmo:(UIView *)view animated:(BOOL)animated { vJGSVdmCkjYr *h=[[self alloc] initWithView:view]; [view addSubview:h]; [h showAnimated:animated]; return h; }
+ (BOOL)hideHUDForView:(UIView *)view animated:(BOOL)animated { vJGSVdmCkjYr *h=[self HUDForView:view]; if(!h)return NO; [h hideAnimated:animated]; return YES; }
+ (id)HUDForView:(UIView *)view { for(UIView *v in view.subviews.reverseObjectEnumerator) if([v isKindOfClass:self]) return v; return nil; }
- (id)initWithFrame:(CGRect)f { if((self=[super initWithFrame:f])) [self commonInit]; return self; }
- (id)initWithCoder:(NSCoder *)c { if((self=[super initWithCoder:c])) [self commonInit]; return self; }
- (id)initWithView:(UIView *)v { return [self initWithFrame:v.bounds]; }
- (void)commonInit { self.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight; self.backgroundColor=UIColor.clearColor; _margin=20; _contentColor=UIColor.whiteColor; _removeFromSuperViewOnHide=NO; _defaultMotionEffectsEnabled=YES; [self setupViews]; [self updateIndicators]; [self updateBezelMotionEffects]; }
- (void)setupViews { _backgroundView=[[xdtFJuEDLscC alloc] initWithFrame:self.bounds]; _backgroundView.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight; _backgroundView.color=UIColor.clearColor; [self addSubview:_backgroundView]; _bezelView=[[xdtFJuEDLscC alloc] initWithFrame:CGRectZero]; _bezelView.layer.cornerRadius=10; _bezelView.clipsToBounds=YES; [self addSubview:_bezelView]; _label=[UILabel new]; _label.textColor=_contentColor; _label.textAlignment=NSTextAlignmentCenter; _detailsLabel=[UILabel new]; _detailsLabel.textColor=_contentColor; _detailsLabel.textAlignment=NSTextAlignmentCenter; _detailsLabel.numberOfLines=0; _button=[MBProgressHUDRoundedButton buttonWithType:UIButtonTypeSystem]; [_bezelView addSubview:_label]; [_bezelView addSubview:_detailsLabel]; [_bezelView addSubview:_button]; }
- (void)layoutSubviews { [super layoutSubviews]; CGFloat w=MIN(MAX(_minSize.width,180),self.bounds.size.width-40); CGFloat h=MAX(_minSize.height,100); _bezelView.frame=CGRectMake((self.bounds.size.width-w)/2+_offset.x,(self.bounds.size.height-h)/2+_offset.y,w,h); CGFloat iy=12; if(_indicator){ _indicator.frame=CGRectMake((w-37)/2,iy,37,37); iy+=43; } _label.frame=CGRectMake(_margin,iy,w-2*_margin,24); _detailsLabel.frame=CGRectMake(_margin,iy+25,w-2*_margin,35); _button.frame=CGRectMake(_margin,h-40,w-2*_margin,32); }
- (void)showAnimated:(BOOL)a { [_hideDelayTimer invalidate]; self.hideDelayTimer=nil; self.useAnimation=a; self.finished=NO; self.showStarted=[NSDate date]; if(self.graceTime>0){ self.hidden=YES; [_graceTimer invalidate]; self.graceTimer=[NSTimer scheduledTimerWithTimeInterval:self.graceTime target:self selector:@selector(handleGraceTimer:) userInfo:nil repeats:NO]; } else { self.hidden=NO; [self showUsingAnimation:a]; } }
- (void)hideAnimated:(BOOL)a { [_graceTimer invalidate]; if(self.minShowTime>0 && self.showStarted){ NSTimeInterval shown=-[self.showStarted timeIntervalSinceNow]; if(shown<self.minShowTime){ [_minShowTimer invalidate]; NSTimer *t=[NSTimer scheduledTimerWithTimeInterval:self.minShowTime-shown target:self selector:@selector(handleMinShowTimer:) userInfo:nil repeats:NO]; self.minShowTimer=t; self.useAnimation=a; return; } } [self hideUsingAnimation:a]; }
- (void)hideAnimated:(BOOL)a afterDelay:(double)d { [_hideDelayTimer invalidate]; self.useAnimation=a; self.hideDelayTimer=[NSTimer scheduledTimerWithTimeInterval:MAX(0,d) target:self selector:@selector(handleHideTimer:) userInfo:nil repeats:NO]; }
- (void)showUsingAnimation:(BOOL)a { self.alpha=0; [UIView animateWithDuration:a?.2:0 animations:^{self.alpha=1;}]; }
- (void)hideUsingAnimation:(BOOL)a { [UIView animateWithDuration:a?.2:0 animations:^{self.alpha=0;} completion:^(BOOL f){[self done];}]; }
- (void)animateIn:(BOOL)in withType:(long long)t completion:(id)b { [UIView animateWithDuration:.2 animations:^{self.alpha=in?1:0;} completion:b]; }
- (void)done { [_graceTimer invalidate]; [_minShowTimer invalidate]; [_hideDelayTimer invalidate]; self.graceTimer=nil; self.minShowTimer=nil; self.hideDelayTimer=nil; self.finished=YES; self.hidden=YES; [self setNSProgressDisplayLinkEnabled:NO]; id delegate = (id)self.delegate; if (delegate && [delegate respondsToSelector:@selector(hudWasHidden:)]) [delegate performSelector:@selector(hudWasHidden:) withObject:self]; if(self.removeFromSuperViewOnHide)[self removeFromSuperview]; if(self.completionBlock)((void(^)(void))self.completionBlock)(); }
- (void)handleGraceTimer:(id)x { self.graceTimer=nil; if(self.finished)return; self.hidden=NO; self.showStarted=[NSDate date]; [self showUsingAnimation:self.useAnimation]; } - (void)handleMinShowTimer:(id)x { self.minShowTimer=nil; [self hideUsingAnimation:self.useAnimation]; } - (void)handleHideTimer:(id)x { self.hideDelayTimer=nil; [self hideAnimated:self.useAnimation]; }
- (void)didMoveToSuperview { [super didMoveToSuperview]; if(self.superview)[self registerForNotifications]; else [self unregisterFromNotifications]; [self setNeedsLayout]; }
- (void)updateIndicators { [_indicator removeFromSuperview]; _indicator=nil; if(_mode==3 && _customView) _indicator=_customView; else if(_mode==2) _indicator=[WpDAoegvehiS new]; else if(_mode==4) _indicator=nil; else if(_mode==5) _indicator=nil; else { EScVqMCzGmbq *p=[EScVqMCzGmbq new]; p.annular=(_mode==1); _indicator=p; } if(_indicator){ [_bezelView addSubview:_indicator]; if ([_indicator isKindOfClass:[EScVqMCzGmbq class]]) [(EScVqMCzGmbq *)_indicator setProgress:_progress]; } [self setNeedsLayout]; }
- (void)updateViewsForColor:(UIColor *)c { self.contentColor=c; if([_indicator respondsToSelector:@selector(setProgressTintColor:)])[(id)_indicator setProgressTintColor:c]; if([_indicator respondsToSelector:@selector(setProgressColor:)])[(id)_indicator setProgressColor:c]; }
- (void)updateBezelMotionEffects { [_bezelView removeMotionEffect:_bezelMotionEffects]; _bezelMotionEffects=nil; if(!_defaultMotionEffectsEnabled)return; UIInterpolatingMotionEffect *x=[[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis]; x.minimumRelativeValue=@(-10); x.maximumRelativeValue=@(10); UIInterpolatingMotionEffect *y=[[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis]; y.minimumRelativeValue=@(-10); y.maximumRelativeValue=@(10); _bezelMotionEffects=[UIMotionEffectGroup new]; _bezelMotionEffects.motionEffects=@[x,y]; [_bezelView addMotionEffect:_bezelMotionEffects]; }
- (void)updatePaddingConstraints { [self setNeedsLayout]; }
- (void)applyPriority:(float)p toConstraints:(id)c { for(NSLayoutConstraint *x in (NSArray *)c) if([x isKindOfClass:NSLayoutConstraint.class]) x.priority=p; }
- (void)setNSProgressDisplayLinkEnabled:(BOOL)e { if(e){ if(!_progressObjectDisplayLink){ CADisplayLink *l=[CADisplayLink displayLinkWithTarget:self selector:@selector(updateProgressFromProgressObject)]; [l addToRunLoop:NSRunLoop.mainRunLoop forMode:NSRunLoopCommonModes]; self.progressObjectDisplayLink=l; } } else { [_progressObjectDisplayLink invalidate]; self.progressObjectDisplayLink=nil; } }
- (void)updateProgressFromProgressObject { self.progress=(float)self.progressObject.fractionCompleted; }
- (void)registerForNotifications { [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidChangeStatusBarOrientationNotification object:nil]; [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(statusBarOrientationDidChange:) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil]; }
- (void)unregisterFromNotifications { [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidChangeStatusBarOrientationNotification object:nil]; }
- (void)statusBarOrientationDidChange:(id)n { [self updateForCurrentOrientationAnimated:YES]; }
- (void)updateForCurrentOrientationAnimated:(BOOL)a { if(a)[UIView animateWithDuration:.2 animations:^{[self layoutIfNeeded];}]; else [self setNeedsLayout]; }
- (void)setMode:(long long)m {_mode=m;[self updateIndicators];} - (void)setCustomView:(UIView *)v {[_customView removeFromSuperview];_customView=v;if(v)[_bezelView addSubview:v];} - (void)setOffset:(CGPoint)v {_offset=v;[self setNeedsLayout];} - (void)setMargin:(double)v {_margin=v;[self setNeedsLayout];} - (void)setMinSize:(CGSize)v {_minSize=v;[self setNeedsLayout];} - (void)setSquare:(BOOL)v {_square=v;[self setNeedsLayout];} - (void)setProgressObjectDisplayLink:(CADisplayLink *)v {_progressObjectDisplayLink=v;} - (void)setProgressObject:(NSProgress *)v {_progressObject=v;[self updateProgressFromProgressObject];[self setNSProgressDisplayLinkEnabled:(v!=nil)];} - (void)setProgress:(float)v {_progress=v;if ([_indicator isKindOfClass:[EScVqMCzGmbq class]]) [(EScVqMCzGmbq *)_indicator setProgress:v];} - (void)setContentColor:(UIColor *)v {_contentColor=v;_label.textColor=v;_detailsLabel.textColor=v;[_button setTitleColor:v forState:UIControlStateNormal];} - (void)setDefaultMotionEffectsEnabled:(BOOL)v {_defaultMotionEffectsEnabled=v;[self updateBezelMotionEffects];}
- (void)dealloc { [self unregisterFromNotifications]; [_graceTimer invalidate]; [_minShowTimer invalidate]; [_hideDelayTimer invalidate]; [_progressObjectDisplayLink invalidate]; }
- (xdtFJuEDLscC *)bezelView{return _bezelView;} - (xdtFJuEDLscC *)backgroundView{return _backgroundView;} - (UILabel *)label{return _label;} - (UILabel *)detailsLabel{return _detailsLabel;} - (UIButton *)button{return _button;}
@end
