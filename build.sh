#!/bin/bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
OUT="$ROOT/build"
mkdir -p "$OUT"
SDK="$(xcrun --sdk iphoneos --show-sdk-path)"
CLANG="$(xcrun --sdk iphoneos --find clang)"
"$CLANG" \
  -target arm64-apple-ios13.0 \
  -isysroot "$SDK" \
  -fobjc-arc -fblocks \
  -dynamiclib \
  -install_name '@rpath/YYModelStandalone.dylib' \
  -I"$ROOT/Sources" \
  "$ROOT/Sources/StandaloneUI.m" \
  "$ROOT/Sources/StandaloneMetal.m" \
  "$ROOT/Sources/StandaloneSupport.m" \
  -framework Foundation \
  -framework UIKit \
  -framework WebKit \
  -framework Metal \
  -framework MetalKit \
  -framework QuartzCore \
  -framework CoreGraphics \
  -o "$OUT/YYModelStandalone.dylib"
file "$OUT/YYModelStandalone.dylib"
xcrun vtool -show-build "$OUT/YYModelStandalone.dylib" || true
