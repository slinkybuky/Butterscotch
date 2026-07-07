# Mobile build guide

## Android

1. Install the Android SDK and NDK.
2. Export one of the following:
   - ANDROID_NDK_HOME=/path/to/ndk
   - ANDROID_NDK=/path/to/ndk
3. Run:

```bash
chmod +x android/build.sh
./android/build.sh
```

This configures a native Android shared library target for the repository.

## iOS

1. Install Xcode and the iOS SDK.
2. Run:

```bash
chmod +x ios/build.sh
./ios/build.sh
```

This configures an iOS static library build for use from an Xcode app target.

## Notes

- The repository already contains Android-native entry points in [src/android/main.c](src/android/main.c).
- The current work adds the missing CMake platform wiring and scripts to make the mobile build paths much easier to reproduce.
- A full app bundle and UI shell are still separate from the native engine library and will need to be added in a host app project.
