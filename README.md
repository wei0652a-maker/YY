# YYModel Standalone Reconstruction v6

Functional reconstruction based on the supplied original arm64 Mach-O and recovered Objective-C metadata.

## v6.1 automatic startup fix
- Added `StandaloneBootstrap.m` with a Mach-O constructor, so the library now starts after it is loaded instead of only registering passive Objective-C classes.
- Automatically locates the active application window on iOS 13 or newer.
- Adds a small `YY` launcher and a status panel backed by the recovered Metal view. The rest of the application remains touchable.
- Shows a short non-blocking HUD on first successful attachment and records touch-bridge coordinates in the panel.
- Emits `[YYModelStandalone]` console messages and `YYStandaloneBootstrapLoaded` after window attachment for runtime diagnosis.
- The Xcode build now applies and verifies an ad-hoc code signature. The containing IPA still needs to be re-signed after injection.

## Scope
- Authorization/server/signature verification is intentionally excluded from the functional recovery target and is not part of the build path.
- `fMUAsOMbCjhB` is retained as the verified MTKView/MTKViewDelegate input/render bridge. No invented menu items are included.
- `WKWebView(EVlBSxhCcmnd)` retains the verified `hr_loadRequest:` request wrapper.
- HUD classes are reconstructed from the verified class/method/ivar metadata and MBProgressHUD-compatible semantics.

## v6 fixes
- Fixed grace-time handling: grace expiration now reveals the existing HUD instead of recursively scheduling another grace timer.
- `hideAnimated:afterDelay:` now uses the recovered `hideDelayTimer` lifecycle, so a new show can cancel an old delayed hide.
- Timer references are cleared on fire/completion and cancelled in `done`.
- Preserved verified Metal touch phases and drawable-size notification bridge.

## Remaining uncertainty
Exact original ARM64 business logic inside obfuscated methods cannot be reproduced solely from Objective-C metadata. This project prefers behavior supported by binary evidence over guessed UI/business behavior.


## v6 binary cross-check

The supplied arm64 Mach-O Objective-C metadata was decoded down to concrete IMP addresses. Confirmed non-license classes/method counts:

- `fMUAsOMbCjhB`: 14 instance methods. `initWithFrame:` 0x587c44, `drawInMTKView:` 0x58aad4, `mtkView:drawableSizeWillChange:` 0x59831c, `hitTest:withEvent:` 0x5985a8, `sendTouch:phase:` 0x5a4588, touch forwarding methods 0x5b09bc..0x5b1974.
- `vJGSVdmCkjYr`: 94 instance methods (HUD lifecycle/layout/progress/motion/timers).
- `EScVqMCzGmbq`: 13 methods; `WpDAoegvehiS`: 13 methods; `xdtFJuEDLscC`: 13 methods; `MBProgressHUDRoundedButton`: 5 methods.
- `WKWebView` category evidence remains limited to `hr_loadRequest:`; no unsupported JS-injection protocol has been invented.

### Build correction
`StandaloneSupport.m` is now included in `YYModelStandalone_FILES`. v5 accidentally omitted it, so its compatibility/support implementations would not have been linked into the library.

### Scope
The reconstruction implements generic UI/HUD/WebView/Metal input-render bridge behavior only. License/network verification remains non-functional/fail-closed, and application/game-specific manipulation behavior is not reconstructed.

## GitHub Actions one-click iOS build
This package can be built without Theos. Push the repository to GitHub, open **Actions → Build iOS dylib → Run workflow**. The workflow uses Apple's iPhoneOS SDK on a macOS runner and uploads `YYModelStandalone.dylib` as the `YYModelStandalone-arm64` artifact.

For a local Mac with Xcode installed, run `./build.sh`. Output: `build/YYModelStandalone.dylib`.
