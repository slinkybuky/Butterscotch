# iOS build notes

This repository does not yet ship a complete Xcode project, but the native code already has the pieces needed for a mobile port.

## Prerequisites
- Xcode 15+ with iOS SDK
- CMake 3.21+
- Ninja

## Suggested configure step

```bash
cmake -S . -B build-ios \
  -G Ninja \
  -DPLATFORM=ios \
  -DAUDIO_BACKEND=miniaudio \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_SYSTEM_NAME=iOS \
  -DCMAKE_OSX_ARCHITECTURES=arm64
```

## Notes
- The repository currently builds the mobile target as a static library, which is the right shape for wrapping in an Xcode app target.
- A full app bundle, UIApplication entry point, and asset packaging still need to be added in a separate iOS app project.
- For an actual app store build, create an Xcode project that links this library and provides the native window/input lifecycle.
