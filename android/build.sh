#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_DIR="${ROOT_DIR}/build-android"
ANDROID_ABI="${ANDROID_ABI:-arm64-v8a}"
ANDROID_PLATFORM="${ANDROID_PLATFORM:-android-24}"

if [[ -z "${ANDROID_NDK_HOME:-}" && -z "${ANDROID_NDK:-}" ]]; then
  echo "Set ANDROID_NDK_HOME or ANDROID_NDK to your Android NDK installation directory." >&2
  exit 1
fi

ANDROID_NDK_PATH="${ANDROID_NDK_HOME:-${ANDROID_NDK}}"

cmake -S "${ROOT_DIR}" -B "${BUILD_DIR}" \
  -G Ninja \
  -DPLATFORM=android \
  -DAUDIO_BACKEND=miniaudio \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_TOOLCHAIN_FILE="${ANDROID_NDK_PATH}/build/cmake/android.toolchain.cmake" \
  -DANDROID_ABI="${ANDROID_ABI}" \
  -DANDROID_PLATFORM="${ANDROID_PLATFORM}"

cmake --build "${BUILD_DIR}" --config Release
