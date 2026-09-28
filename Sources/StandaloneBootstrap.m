#import "RecoveredInterfaces.h"
#import <QuartzCore/QuartzCore.h>

static const NSInteger YYStandaloneOverlayTag = 0x59595354;

@interface YYStandaloneOverlayView : UIView
@property (nonatomic, strong) UIButton *launcherButton;
@property (nonatomic, strong) UIView *panelView;
@end

@implementation YYStandaloneOverlayView
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    for (UIView *view in self.subviews.reverseObjectEnumerator) {
        if (view.hidden || view.alpha < 0.01 || !view.userInteractionEnabled) continue;
        CGPoint localPoint = [view convertPoint:point fromView:self];
        if ([view pointInside:localPoint withEvent:event]) return YES;
    }
    return NO;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UIEdgeInsets safe = self.safeAreaInsets;
    CGFloat buttonSize = 52.0;
    self.launcherButton.frame = CGRectMake(MAX(12.0, safe.left + 8.0),
                                           MAX(12.0, safe.top + 8.0),
                                           buttonSize,
                                           buttonSize);

    CGFloat availableWidth = MAX(220.0, self.bounds.size.width - safe.left - safe.right - 32.0);
    CGFloat panelWidth = MIN(300.0, availableWidth);
    CGFloat panelHeight = 156.0;
    CGFloat panelX = MAX(safe.left + 16.0,
                         MIN(CGRectGetMaxX(self.launcherButton.frame) + 10.0,
                             self.bounds.size.width - safe.right - panelWidth - 16.0));
    CGFloat panelY = MAX(safe.top + 8.0, CGRectGetMinY(self.launcherButton.frame));
    self.panelView.frame = CGRectMake(panelX, panelY, panelWidth, panelHeight);
}
@end

@interface YYStandaloneBootstrap : NSObject
@property (nonatomic, weak) UIWindow *hostWindow;
@property (nonatomic, strong) YYStandaloneOverlayView *overlayView;
@property (nonatomic, strong) UILabel *statusLabel;
@property (nonatomic, assign) BOOL started;
@property (nonatomic, assign) BOOL didShowHUD;
+ (instancetype)shared;
- (void)start;
- (void)attachIfPossibleWithRetries:(NSInteger)remainingRetries;
- (void)attachToWindow:(UIWindow *)window;
@end

@implementation YYStandaloneBootstrap

+ (instancetype)shared {
    static YYStandaloneBootstrap *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [YYStandaloneBootstrap new];
    });
    return instance;
}

- (UIWindow *)activeApplicationWindow {
    UIApplication *application = UIApplication.sharedApplication;

    if (@available(iOS 13.0, *)) {
        for (UIScene *scene in application.connectedScenes) {
            if (![scene isKindOfClass:UIWindowScene.class] ||
                scene.activationState != UISceneActivationStateForegroundActive) continue;

            NSArray<UIWindow *> *windows = ((UIWindowScene *)scene).windows;
            for (UIWindow *window in windows) {
                if (window.isKeyWindow && !window.hidden && window.alpha > 0.0 && window.rootViewController) {
                    return window;
                }
            }
            for (UIWindow *window in windows) {
                if (!window.hidden && window.alpha > 0.0 && window.rootViewController &&
                    window.windowLevel == UIWindowLevelNormal) return window;
            }
        }
    }

    for (UIWindow *window in application.windows) {
        if (window.isKeyWindow && !window.hidden && window.rootViewController) return window;
    }
    return nil;
}

- (void)start {
    if (self.started) {
        [self attachIfPossibleWithRetries:20];
        return;
    }
    self.started = YES;

    NSNotificationCenter *center = NSNotificationCenter.defaultCenter;
    [center addObserver:self selector:@selector(applicationReady:) name:UIApplicationDidFinishLaunchingNotification object:nil];
    [center addObserver:self selector:@selector(applicationReady:) name:UIApplicationDidBecomeActiveNotification object:nil];
    [center addObserver:self selector:@selector(windowBecameKey:) name:UIWindowDidBecomeKeyNotification object:nil];
    [center addObserver:self selector:@selector(metalTouch:) name:@"YYStandaloneMetalTouch" object:nil];

    NSLog(@"[YYModelStandalone] bootstrap loaded");
    [self attachIfPossibleWithRetries:40];
}

- (void)applicationReady:(NSNotification *)notification {
    (void)notification;
    [self attachIfPossibleWithRetries:20];
}

- (void)windowBecameKey:(NSNotification *)notification {
    UIWindow *window = [notification.object isKindOfClass:UIWindow.class] ? notification.object : nil;
    if (!window || window == self.hostWindow || !window.rootViewController ||
        window.windowLevel != UIWindowLevelNormal) return;
    [self attachToWindow:window];
}

- (void)attachIfPossibleWithRetries:(NSInteger)remainingRetries {
    NSAssert(NSThread.isMainThread, @"YYStandaloneBootstrap must run on the main thread");
    UIWindow *window = [self activeApplicationWindow];
    if (window) {
        [self attachToWindow:window];
        return;
    }
    if (remainingRetries <= 0) {
        NSLog(@"[YYModelStandalone] no application window found");
        return;
    }

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
        [self attachIfPossibleWithRetries:remainingRetries - 1];
    });
}

- (YYStandaloneOverlayView *)makeOverlayForWindow:(UIWindow *)window {
    YYStandaloneOverlayView *overlay = [[YYStandaloneOverlayView alloc] initWithFrame:window.bounds];
    overlay.tag = YYStandaloneOverlayTag;
    overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    overlay.backgroundColor = UIColor.clearColor;

    UIButton *launcher = [UIButton buttonWithType:UIButtonTypeSystem];
    launcher.backgroundColor = [UIColor colorWithRed:0.08 green:0.10 blue:0.14 alpha:0.94];
    launcher.layer.cornerRadius = 26.0;
    launcher.layer.borderWidth = 1.0;
    launcher.layer.borderColor = [UIColor colorWithRed:0.20 green:0.85 blue:1.0 alpha:1.0].CGColor;
    [launcher setTitle:@"YY" forState:UIControlStateNormal];
    [launcher setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    launcher.titleLabel.font = [UIFont boldSystemFontOfSize:16.0];
    launcher.accessibilityLabel = @"YYModel Standalone";
    [launcher addTarget:self action:@selector(togglePanel:) forControlEvents:UIControlEventTouchUpInside];
    [overlay addSubview:launcher];
    overlay.launcherButton = launcher;

    UIView *panel = [UIView new];
    panel.backgroundColor = [UIColor colorWithRed:0.04 green:0.05 blue:0.08 alpha:0.93];
    panel.layer.cornerRadius = 14.0;
    panel.layer.borderWidth = 1.0;
    panel.layer.borderColor = [UIColor colorWithRed:0.20 green:0.85 blue:1.0 alpha:0.75].CGColor;
    panel.clipsToBounds = YES;
    [overlay addSubview:panel];
    overlay.panelView = panel;

    fMUAsOMbCjhB *metalView = [[fMUAsOMbCjhB alloc] initWithFrame:panel.bounds];
    metalView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [panel addSubview:metalView];

    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(16.0, 12.0, 268.0, 26.0)];
    title.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    title.text = @"YYModel Standalone";
    title.textColor = UIColor.whiteColor;
    title.font = [UIFont boldSystemFontOfSize:17.0];
    title.userInteractionEnabled = NO;
    [panel addSubview:title];

    UILabel *status = [[UILabel alloc] initWithFrame:CGRectMake(16.0, 47.0, 268.0, 82.0)];
    status.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    status.text = @"Loaded\nMetal rendering: active\nTouch bridge: ready";
    status.textColor = [UIColor colorWithWhite:0.88 alpha:1.0];
    status.font = [UIFont monospacedSystemFontOfSize:13.0 weight:UIFontWeightRegular];
    status.numberOfLines = 0;
    status.userInteractionEnabled = NO;
    [panel addSubview:status];
    self.statusLabel = status;

    return overlay;
}

- (void)attachToWindow:(UIWindow *)window {
    if (!window || !window.rootViewController) return;

    UIView *existing = [window viewWithTag:YYStandaloneOverlayTag];
    if (existing && existing != self.overlayView) [existing removeFromSuperview];

    if (!self.overlayView) self.overlayView = [self makeOverlayForWindow:window];
    if (self.overlayView.superview != window) {
        [self.overlayView removeFromSuperview];
        self.overlayView.frame = window.bounds;
        [window addSubview:self.overlayView];
    } else {
        [window bringSubviewToFront:self.overlayView];
    }

    self.hostWindow = window;
    [self.overlayView setNeedsLayout];
    [self.overlayView layoutIfNeeded];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"YYStandaloneBootstrapLoaded"
                                                        object:self
                                                      userInfo:@{@"window": window}];
    NSLog(@"[YYModelStandalone] overlay attached to %@", window);

    if (!self.didShowHUD) {
        self.didShowHUD = YES;
        vJGSVdmCkjYr *hud = [vJGSVdmCkjYr ksvHJIfPAnmo:window animated:YES];
        hud.userInteractionEnabled = NO;
        hud.mode = 4;
        hud.label.text = @"YYModel loaded";
        hud.detailsLabel.text = @"Tap YY to open the status panel";
        hud.removeFromSuperViewOnHide = YES;
        [hud hideAnimated:YES afterDelay:1.5];
    }
}

- (void)togglePanel:(UIButton *)sender {
    (void)sender;
    UIView *panel = self.overlayView.panelView;
    panel.hidden = !panel.hidden;
    if (!panel.hidden) [self.overlayView bringSubviewToFront:panel];
    [self.overlayView bringSubviewToFront:self.overlayView.launcherButton];
}

- (void)metalTouch:(NSNotification *)notification {
    NSDictionary *info = notification.userInfo;
    NSNumber *x = info[@"x"];
    NSNumber *y = info[@"y"];
    NSNumber *phase = info[@"phase"];
    if (!x || !y || !phase) return;
    self.statusLabel.text = [NSString stringWithFormat:@"Loaded\nTouch: %.0f, %.0f\nPhase: %@",
                             x.doubleValue, y.doubleValue, phase];
}

- (void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}
@end

__attribute__((constructor))
static void YYStandaloneEntryPoint(void) {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[YYStandaloneBootstrap shared] start];
    });
}
