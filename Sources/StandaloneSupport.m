#import "RecoveredInterfaces.h"
#import <QuartzCore/QuartzCore.h>
#import <mach/mach_time.h>
#import <math.h>

@implementation SSSignedLease
- (id)initWithWire:(id)wire request:(id)request receivedNS:(unsigned long long)ns wall:(long long)wall elapsed:(double)elapsed {
    if ((self=[super init])) {
        NSData *payload=nil,*signature=nil,*prefix=nil;
        if ([wire isKindOfClass:NSDictionary.class]) {
            id p=wire[@"payload"], s=wire[@"signature"], r=wire[@"requestPrefix"];
            payload=[p isKindOfClass:NSData.class]?p:([p isKindOfClass:NSString.class]?[[NSData alloc] initWithBase64EncodedString:p options:0]:nil);
            signature=[s isKindOfClass:NSData.class]?s:([s isKindOfClass:NSString.class]?[[NSData alloc] initWithBase64EncodedString:s options:0]:nil);
            prefix=[r isKindOfClass:NSData.class]?r:([r isKindOfClass:NSString.class]?[r dataUsingEncoding:NSUTF8StringEncoding]:nil);
        } else if ([wire isKindOfClass:NSData.class]) payload=wire;
        if (!prefix && [request isKindOfClass:NSURLRequest.class]) NSString *urlString=((NSURLRequest *)request).URL.absoluteString ?: @""; prefix=[[urlString dataUsingEncoding:NSUTF8StringEncoding] copy];
        _payload=[payload copy] ?: [NSData data]; _signature=[signature copy] ?: [NSData data]; _requestPrefix=[prefix copy] ?: [NSData data];
        _receivedNS=ns; _receivedWall=wall; _requestElapsed=elapsed;
    } return self;
}
@end

@implementation SSTLSTransaction
@end

@implementation SSLicenseController
+ (id)shared { static SSLicenseController *x; static dispatch_once_t once; dispatch_once(&once,^{ x=[self new]; }); return x; }
- (id)init { if((self=[super init])){ _device=UIDevice.currentDevice.identifierForVendor.UUIDString ?: @"unknown"; _lastMessage=@"Verification implementation unavailable"; } return self; }
- (void)publish:(BOOL)active { self.publishedActive=active; [[NSNotificationCenter defaultCenter] postNotificationName:@"YYStandaloneLicenseStateChanged" object:self userInfo:@{@"active":@(active)}]; }
- (void)revoke { [self publish:NO]; self.pending=nil; self.pendingReceipt=nil; }
- (void)message:(id)m { self.lastMessage=[m description] ?: @""; [[NSNotificationCenter defaultCenter] postNotificationName:@"YYStandaloneLicenseMessage" object:self userInfo:@{@"message":self.lastMessage}]; }
- (void)prompt:(id)m { [self message:m]; dispatch_async(dispatch_get_main_queue(), ^{ UIViewController *vc=self.window.rootViewController; while(vc.presentedViewController) vc=vc.presentedViewController; if(!vc)return; UIAlertController *a=[UIAlertController alertControllerWithTitle:@"YYModel" message:self.lastMessage preferredStyle:UIAlertControllerStyleAlert]; [a addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]]; [vc presentViewController:a animated:YES completion:nil]; }); }
- (void)promptRestart { if(self.restartPromptShown)return; self.restartPromptShown=YES; self.restartRequired=YES; [self prompt:@"A restart is required to apply this change."]; }
- (void)tick { if(!self.started)return; unsigned long long now=(unsigned long long)(NSDate.date.timeIntervalSince1970*1000.0); if(self.nextAttempt && now>=self.nextAttempt)[self request]; }
- (void)applicationBecameActive:(id)n { [self tick]; }
- (void)start { if(self.started)return; self.started=YES; [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationBecameActive:) name:UIApplicationDidBecomeActiveNotification object:nil]; self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tick) userInfo:nil repeats:YES]; [self request]; }
- (void)scheduleRetry { self.retryCount+=1; double delay=MIN(60.0,pow(2.0,MIN((double)self.retryCount,5.0))); self.nextAttempt=(unsigned long long)((NSDate.date.timeIntervalSince1970+delay)*1000.0); }
- (void)request { self.requestGeneration+=1; self.requestStart=(unsigned long long)(NSDate.date.timeIntervalSince1970*1000.0); /* Fail closed: original endpoint/protocol is absent. */ [self completeRequest:nil startup:nil failure:YES generation:self.requestGeneration]; }
- (void)completeRequest:(id)result startup:(id)startup failure:(BOOL)failure generation:(unsigned long long)generation { if(generation!=self.requestGeneration)return; if(failure){ [self publish:NO]; [self message:@"Original verification protocol is not present in the recovered material."]; [self scheduleRetry]; } else { self.retryCount=0; self.nextAttempt=0; [self publish:YES]; } }
- (void)dealloc { [[NSNotificationCenter defaultCenter] removeObserver:self]; [_timer invalidate]; }
@end

@implementation wGCnCOedhjmb
+ (void)startVerification { [[SSLicenseController shared] start]; }
@end
@implementation IAFcBSZvzluw @end
