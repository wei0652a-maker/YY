#pragma once
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import <MetalKit/MetalKit.h>

// Verified against supplied Mach-O method tables; method bodies are not reconstructed.
// @? is represented as id: metadata proves a block object, not its invoke signature.
// Exact q/Q encodings use long long/unsigned long long rather than guessed typedefs.
@class SSSignedLease, SSTLSTransaction, SSLicenseController, wGCnCOedhjmb, IAFcBSZvzluw, vJGSVdmCkjYr, EScVqMCzGmbq, WpDAoegvehiS, xdtFJuEDLscC, MBProgressHUDRoundedButton, fMUAsOMbCjhB;
@protocol MBProgressHUDDelegate;

@interface SSSignedLease : NSObject
@property (readonly, copy, nonatomic) NSData * payload;
@property (readonly, copy, nonatomic) NSData * signature;
@property (readonly, copy, nonatomic) NSData * requestPrefix;
@property (readonly, nonatomic) unsigned long long receivedNS;
@property (readonly, nonatomic) long long receivedWall;
@property (readonly, nonatomic) double requestElapsed;
// encoding: @56@0:8@16@24Q32q40d48
- (id)initWithWire:(id)arg1 request:(id)arg2 receivedNS:(unsigned long long)arg3 wall:(long long)arg4 elapsed:(double)arg5;
// encoding: @16@0:8
- (id)payload;
// encoding: @16@0:8
- (id)signature;
// encoding: @16@0:8
- (id)requestPrefix;
// encoding: Q16@0:8
- (unsigned long long)receivedNS;
// encoding: q16@0:8
- (long long)receivedWall;
// encoding: d16@0:8
- (double)requestElapsed;
@end

@interface SSTLSTransaction : NSObject
@end

@interface SSLicenseController : NSObject
@property (strong, nonatomic) SSTLSTransaction * task;
@property (nonatomic) unsigned long long requestGeneration;
@property (strong, nonatomic) NSDictionary * pending;
@property (strong, nonatomic) SSSignedLease * pendingReceipt;
@property (strong, nonatomic) NSString * code;
@property (strong, nonatomic) NSString * device;
@property (strong, nonatomic) UIWindow * window;
@property (strong, nonatomic) NSTimer * timer;
@property (nonatomic) BOOL started;
@property (nonatomic) BOOL publishedActive;
@property (nonatomic) unsigned long long retryCount;
@property (nonatomic) unsigned long long requestStart;
@property (nonatomic) unsigned long long nextAttempt;
@property (strong, nonatomic) NSString * lastMessage;
@property (nonatomic) BOOL restartPromptShown;
@property (nonatomic) BOOL restartRequired;
// encoding: @16@0:8
+ (id)shared;
// encoding: v20@0:8B16
- (void)publish:(BOOL)arg1;
// encoding: v16@0:8
- (void)revoke;
// encoding: v24@0:8@16
- (void)message:(id)arg1;
// encoding: v24@0:8@16
- (void)prompt:(id)arg1;
// encoding: v16@0:8
- (void)promptRestart;
// encoding: v16@0:8
- (void)tick;
// encoding: v24@0:8@16
- (void)applicationBecameActive:(id)arg1;
// encoding: v16@0:8
- (void)start;
// encoding: v16@0:8
- (void)scheduleRetry;
// encoding: v16@0:8
- (void)request;
// encoding: v44@0:8@16@24B32Q36
- (void)completeRequest:(id)arg1 startup:(id)arg2 failure:(BOOL)arg3 generation:(unsigned long long)arg4;
// encoding: @16@0:8
- (id)task;
// encoding: v24@0:8@16
- (void)setTask:(id)arg1;
// encoding: Q16@0:8
- (unsigned long long)requestGeneration;
// encoding: v24@0:8Q16
- (void)setRequestGeneration:(unsigned long long)arg1;
// encoding: @16@0:8
- (id)pending;
// encoding: v24@0:8@16
- (void)setPending:(id)arg1;
// encoding: @16@0:8
- (id)pendingReceipt;
// encoding: v24@0:8@16
- (void)setPendingReceipt:(id)arg1;
// encoding: @16@0:8
- (id)code;
// encoding: v24@0:8@16
- (void)setCode:(id)arg1;
// encoding: @16@0:8
- (id)device;
// encoding: v24@0:8@16
- (void)setDevice:(id)arg1;
// encoding: @16@0:8
- (id)window;
// encoding: v24@0:8@16
- (void)setWindow:(id)arg1;
// encoding: @16@0:8
- (id)timer;
// encoding: v24@0:8@16
- (void)setTimer:(id)arg1;
// encoding: B16@0:8
- (BOOL)started;
// encoding: v20@0:8B16
- (void)setStarted:(BOOL)arg1;
// encoding: B16@0:8
- (BOOL)publishedActive;
// encoding: v20@0:8B16
- (void)setPublishedActive:(BOOL)arg1;
// encoding: Q16@0:8
- (unsigned long long)retryCount;
// encoding: v24@0:8Q16
- (void)setRetryCount:(unsigned long long)arg1;
// encoding: Q16@0:8
- (unsigned long long)requestStart;
// encoding: v24@0:8Q16
- (void)setRequestStart:(unsigned long long)arg1;
// encoding: Q16@0:8
- (unsigned long long)nextAttempt;
// encoding: v24@0:8Q16
- (void)setNextAttempt:(unsigned long long)arg1;
// encoding: @16@0:8
- (id)lastMessage;
// encoding: v24@0:8@16
- (void)setLastMessage:(id)arg1;
// encoding: B16@0:8
- (BOOL)restartPromptShown;
// encoding: v20@0:8B16
- (void)setRestartPromptShown:(BOOL)arg1;
// encoding: B16@0:8
- (BOOL)restartRequired;
// encoding: v20@0:8B16
- (void)setRestartRequired:(BOOL)arg1;
@end

@interface wGCnCOedhjmb : NSObject
// encoding: v16@0:8
+ (void)startVerification;
@end

@interface IAFcBSZvzluw : NSObject
@end

@interface vJGSVdmCkjYr : UIView
@property (nonatomic) BOOL useAnimation;
@property (nonatomic, getter=hasFinished) BOOL finished;
@property (strong, nonatomic) UIView * indicator;
@property (strong, nonatomic) NSDate * showStarted;
@property (strong, nonatomic) NSArray * paddingConstraints;
@property (strong, nonatomic) NSArray * bezelConstraints;
@property (strong, nonatomic) UIView * topSpacer;
@property (strong, nonatomic) UIView * bottomSpacer;
@property (strong, nonatomic) UIMotionEffectGroup * bezelMotionEffects;
@property (weak, nonatomic) NSTimer * graceTimer;
@property (weak, nonatomic) NSTimer * minShowTimer;
@property (weak, nonatomic) NSTimer * hideDelayTimer;
@property (weak, nonatomic) CADisplayLink * progressObjectDisplayLink;
@property (weak, nonatomic) id<MBProgressHUDDelegate> delegate;
@property (copy) id completionBlock;
@property (nonatomic) double graceTime;
@property (nonatomic) double minShowTime;
@property (nonatomic) BOOL removeFromSuperViewOnHide;
@property (nonatomic) long long mode;
@property (strong, nonatomic) UIColor * contentColor;
@property (nonatomic) long long animationType;
@property (nonatomic) CGPoint offset;
@property (nonatomic) double margin;
@property (nonatomic) CGSize minSize;
@property (nonatomic, getter=isSquare) BOOL square;
@property (nonatomic, getter=areDefaultMotionEffectsEnabled) BOOL defaultMotionEffectsEnabled;
@property (nonatomic) float progress;
@property (strong, nonatomic) NSProgress * progressObject;
@property (readonly, nonatomic) xdtFJuEDLscC * bezelView;
@property (readonly, nonatomic) xdtFJuEDLscC * backgroundView;
@property (strong, nonatomic) UIView * customView;
@property (readonly, nonatomic) UILabel * label;
@property (readonly, nonatomic) UILabel * detailsLabel;
@property (readonly, nonatomic) UIButton * button;
// encoding: @28@0:8@16B24
+ (id)ksvHJIfPAnmo:(id)arg1 animated:(BOOL)arg2;
// encoding: B28@0:8@16B24
+ (BOOL)hideHUDForView:(id)arg1 animated:(BOOL)arg2;
// encoding: @24@0:8@16
+ (id)HUDForView:(id)arg1;
// encoding: v16@0:8
- (void)commonInit;
// encoding: @48@0:8{CGRect={CGPoint=dd}{CGSize=dd}}16
- (id)initWithFrame:(CGRect)arg1;
// encoding: @24@0:8@16
- (id)initWithCoder:(id)arg1;
// encoding: @24@0:8@16
- (id)initWithView:(id)arg1;
// encoding: v20@0:8B16
- (void)showAnimated:(BOOL)arg1;
// encoding: v20@0:8B16
- (void)hideAnimated:(BOOL)arg1;
// encoding: v28@0:8B16d20
- (void)hideAnimated:(BOOL)arg1 afterDelay:(double)arg2;
// encoding: v24@0:8@16
- (void)handleGraceTimer:(id)arg1;
// encoding: v24@0:8@16
- (void)handleMinShowTimer:(id)arg1;
// encoding: v24@0:8@16
- (void)handleHideTimer:(id)arg1;
// encoding: v16@0:8
- (void)didMoveToSuperview;
// encoding: v20@0:8B16
- (void)showUsingAnimation:(BOOL)arg1;
// encoding: v20@0:8B16
- (void)hideUsingAnimation:(BOOL)arg1;
// encoding: v36@0:8B16q20@?28
- (void)animateIn:(BOOL)arg1 withType:(long long)arg2 completion:(id)arg3;
// encoding: v16@0:8
- (void)done;
// encoding: v16@0:8
- (void)setupViews;
// encoding: v16@0:8
- (void)updateIndicators;
// encoding: v24@0:8@16
- (void)updateViewsForColor:(id)arg1;
// encoding: v16@0:8
- (void)updateBezelMotionEffects;
// encoding: v16@0:8
- (void)updateConstraints;
// encoding: v16@0:8
- (void)layoutSubviews;
// encoding: v16@0:8
- (void)updatePaddingConstraints;
// encoding: v28@0:8f16@20
- (void)applyPriority:(float)arg1 toConstraints:(id)arg2;
// encoding: v24@0:8q16
- (void)setMode:(long long)arg1;
// encoding: v24@0:8@16
- (void)setCustomView:(id)arg1;
// encoding: v32@0:8{CGPoint=dd}16
- (void)setOffset:(CGPoint)arg1;
// encoding: v24@0:8d16
- (void)setMargin:(double)arg1;
// encoding: v32@0:8{CGSize=dd}16
- (void)setMinSize:(CGSize)arg1;
// encoding: v20@0:8B16
- (void)setSquare:(BOOL)arg1;
// encoding: v24@0:8@16
- (void)setProgressObjectDisplayLink:(id)arg1;
// encoding: v24@0:8@16
- (void)setProgressObject:(id)arg1;
// encoding: v20@0:8f16
- (void)setProgress:(float)arg1;
// encoding: v24@0:8@16
- (void)setContentColor:(id)arg1;
// encoding: v20@0:8B16
- (void)setDefaultMotionEffectsEnabled:(BOOL)arg1;
// encoding: v20@0:8B16
- (void)setNSProgressDisplayLinkEnabled:(BOOL)arg1;
// encoding: v16@0:8
- (void)updateProgressFromProgressObject;
// encoding: v16@0:8
- (void)registerForNotifications;
// encoding: v16@0:8
- (void)unregisterFromNotifications;
// encoding: v24@0:8@16
- (void)statusBarOrientationDidChange:(id)arg1;
// encoding: v20@0:8B16
- (void)updateForCurrentOrientationAnimated:(BOOL)arg1;
// encoding: @16@0:8
- (id)delegate;
// encoding: v24@0:8@16
- (void)setDelegate:(id)arg1;
// encoding: @?16@0:8
- (id)completionBlock;
// encoding: v24@0:8@?16
- (void)setCompletionBlock:(id)arg1;
// encoding: d16@0:8
- (double)graceTime;
// encoding: v24@0:8d16
- (void)setGraceTime:(double)arg1;
// encoding: d16@0:8
- (double)minShowTime;
// encoding: v24@0:8d16
- (void)setMinShowTime:(double)arg1;
// encoding: B16@0:8
- (BOOL)removeFromSuperViewOnHide;
// encoding: v20@0:8B16
- (void)setRemoveFromSuperViewOnHide:(BOOL)arg1;
// encoding: q16@0:8
- (long long)mode;
// encoding: @16@0:8
- (id)contentColor;
// encoding: q16@0:8
- (long long)animationType;
// encoding: v24@0:8q16
- (void)setAnimationType:(long long)arg1;
// encoding: {CGPoint=dd}16@0:8
- (CGPoint)offset;
// encoding: d16@0:8
- (double)margin;
// encoding: {CGSize=dd}16@0:8
- (CGSize)minSize;
// encoding: B16@0:8
- (BOOL)isSquare;
// encoding: B16@0:8
- (BOOL)areDefaultMotionEffectsEnabled;
// encoding: f16@0:8
- (float)progress;
// encoding: @16@0:8
- (id)progressObject;
// encoding: @16@0:8
- (id)bezelView;
// encoding: @16@0:8
- (id)backgroundView;
// encoding: @16@0:8
- (id)customView;
// encoding: @16@0:8
- (id)label;
// encoding: @16@0:8
- (id)detailsLabel;
// encoding: @16@0:8
- (id)button;
// encoding: B16@0:8
- (BOOL)useAnimation;
// encoding: v20@0:8B16
- (void)setUseAnimation:(BOOL)arg1;
// encoding: B16@0:8
- (BOOL)hasFinished;
// encoding: v20@0:8B16
- (void)setFinished:(BOOL)arg1;
// encoding: @16@0:8
- (id)indicator;
// encoding: v24@0:8@16
- (void)setIndicator:(id)arg1;
// encoding: @16@0:8
- (id)showStarted;
// encoding: v24@0:8@16
- (void)setShowStarted:(id)arg1;
// encoding: @16@0:8
- (id)paddingConstraints;
// encoding: v24@0:8@16
- (void)setPaddingConstraints:(id)arg1;
// encoding: @16@0:8
- (id)bezelConstraints;
// encoding: v24@0:8@16
- (void)setBezelConstraints:(id)arg1;
// encoding: @16@0:8
- (id)topSpacer;
// encoding: v24@0:8@16
- (void)setTopSpacer:(id)arg1;
// encoding: @16@0:8
- (id)bottomSpacer;
// encoding: v24@0:8@16
- (void)setBottomSpacer:(id)arg1;
// encoding: @16@0:8
- (id)bezelMotionEffects;
// encoding: v24@0:8@16
- (void)setBezelMotionEffects:(id)arg1;
// encoding: @16@0:8
- (id)graceTimer;
// encoding: v24@0:8@16
- (void)setGraceTimer:(id)arg1;
// encoding: @16@0:8
- (id)minShowTimer;
// encoding: v24@0:8@16
- (void)setMinShowTimer:(id)arg1;
// encoding: @16@0:8
- (id)hideDelayTimer;
// encoding: v24@0:8@16
- (void)setHideDelayTimer:(id)arg1;
// encoding: @16@0:8
- (id)progressObjectDisplayLink;
@end

@interface EScVqMCzGmbq : UIView
@property (nonatomic) float progress;
@property (strong, nonatomic) UIColor * progressTintColor;
@property (strong, nonatomic) UIColor * backgroundTintColor;
@property (nonatomic, getter=isAnnular) BOOL annular;
// encoding: @16@0:8
- (id)init;
// encoding: @48@0:8{CGRect={CGPoint=dd}{CGSize=dd}}16
- (id)initWithFrame:(CGRect)arg1;
// encoding: {CGSize=dd}16@0:8
- (CGSize)intrinsicContentSize;
// encoding: v20@0:8f16
- (void)setProgress:(float)arg1;
// encoding: v24@0:8@16
- (void)setProgressTintColor:(id)arg1;
// encoding: v24@0:8@16
- (void)setBackgroundTintColor:(id)arg1;
// encoding: v48@0:8{CGRect={CGPoint=dd}{CGSize=dd}}16
- (void)drawRect:(CGRect)arg1;
// encoding: f16@0:8
- (float)progress;
// encoding: @16@0:8
- (id)progressTintColor;
// encoding: @16@0:8
- (id)backgroundTintColor;
// encoding: B16@0:8
- (BOOL)isAnnular;
// encoding: v20@0:8B16
- (void)setAnnular:(BOOL)arg1;
@end

@interface WpDAoegvehiS : UIView
@property (nonatomic) float progress;
@property (strong, nonatomic) UIColor * lineColor;
@property (strong, nonatomic) UIColor * progressRemainingColor;
@property (strong, nonatomic) UIColor * progressColor;
// encoding: @16@0:8
- (id)init;
// encoding: @48@0:8{CGRect={CGPoint=dd}{CGSize=dd}}16
- (id)initWithFrame:(CGRect)arg1;
// encoding: {CGSize=dd}16@0:8
- (CGSize)intrinsicContentSize;
// encoding: v20@0:8f16
- (void)setProgress:(float)arg1;
// encoding: v24@0:8@16
- (void)setProgressColor:(id)arg1;
// encoding: v24@0:8@16
- (void)setProgressRemainingColor:(id)arg1;
// encoding: v48@0:8{CGRect={CGPoint=dd}{CGSize=dd}}16
- (void)drawRect:(CGRect)arg1;
// encoding: f16@0:8
- (float)progress;
// encoding: @16@0:8
- (id)lineColor;
// encoding: v24@0:8@16
- (void)setLineColor:(id)arg1;
// encoding: @16@0:8
- (id)progressRemainingColor;
// encoding: @16@0:8
- (id)progressColor;
@end

@interface xdtFJuEDLscC : UIView
@property (strong) UIVisualEffectView * effectView;
@property (nonatomic) long long style;
@property (nonatomic) long long blurEffectStyle;
@property (strong, nonatomic) UIColor * color;
// encoding: @48@0:8{CGRect={CGPoint=dd}{CGSize=dd}}16
- (id)initWithFrame:(CGRect)arg1;
// encoding: {CGSize=dd}16@0:8
- (CGSize)intrinsicContentSize;
// encoding: v24@0:8q16
- (void)setStyle:(long long)arg1;
// encoding: v24@0:8@16
- (void)setColor:(id)arg1;
// encoding: v24@0:8q16
- (void)setBlurEffectStyle:(long long)arg1;
// encoding: v16@0:8
- (void)updateForBackgroundStyle;
// encoding: v24@0:8@16
- (void)updateViewsForColor:(id)arg1;
// encoding: q16@0:8
- (long long)style;
// encoding: q16@0:8
- (long long)blurEffectStyle;
// encoding: @16@0:8
- (id)color;
// encoding: @16@0:8
- (id)effectView;
// encoding: v24@0:8@16
- (void)setEffectView:(id)arg1;
@end

@interface MBProgressHUDRoundedButton : UIButton
// encoding: @48@0:8{CGRect={CGPoint=dd}{CGSize=dd}}16
- (id)initWithFrame:(CGRect)arg1;
// encoding: v16@0:8
- (void)layoutSubviews;
// encoding: {CGSize=dd}16@0:8
- (CGSize)intrinsicContentSize;
// encoding: v32@0:8@16Q24
- (void)setTitleColor:(id)arg1 forState:(unsigned long long)arg2;
// encoding: v20@0:8B16
- (void)setHighlighted:(BOOL)arg1;
@end

@interface fMUAsOMbCjhB : MTKView <MTKViewDelegate>
@property (strong, nonatomic) id<MTLCommandQueue> commandQueue;
@property (strong, nonatomic) MTKTextureLoader * loader;
@property (readonly) unsigned long long hash;
@property (readonly) Class superclass;
@property (readonly, copy) NSString * description;
@property (readonly, copy) NSString * debugDescription;
// encoding: @48@0:8{CGRect={CGPoint=dd}{CGSize=dd}}16
- (id)initWithFrame:(CGRect)arg1;
// encoding: v24@0:8@16
- (void)drawInMTKView:(id)arg1;
// encoding: v40@0:8@16{CGSize=dd}24
- (void)mtkView:(id)arg1 drawableSizeWillChange:(CGSize)arg2;
// encoding: @40@0:8{CGPoint=dd}16@32
- (id)hitTest:(CGPoint)arg1 withEvent:(id)arg2;
// encoding: v28@0:8@16i24
- (void)sendTouch:(id)arg1 phase:(int)arg2;
// encoding: v32@0:8@16@24
- (void)touchesBegan:(id)arg1 withEvent:(id)arg2;
// encoding: v32@0:8@16@24
- (void)touchesMoved:(id)arg1 withEvent:(id)arg2;
// encoding: v32@0:8@16@24
- (void)touchesEnded:(id)arg1 withEvent:(id)arg2;
// encoding: v32@0:8@16@24
- (void)touchesCancelled:(id)arg1 withEvent:(id)arg2;
// encoding: @16@0:8
- (id)commandQueue;
// encoding: v24@0:8@16
- (void)setCommandQueue:(id)arg1;
// encoding: @16@0:8
- (id)loader;
// encoding: v24@0:8@16
- (void)setLoader:(id)arg1;
@end

@interface WKWebView (EVlBSxhCcmnd)
// encoding: @24@0:8@16
- (id)hr_loadRequest:(id)arg1;
@end

@interface UIColor (Hex)
// encoding: @32@0:8@16d24
+ (id)eLjjLCMRmcWr:(id)arg1 alpha:(double)arg2;
// encoding: @24@0:8@16
+ (id)eLjjLCMRmcWr:(id)arg1;
@end
