#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_DIR="${ROOT_DIR}/build-ios"

cmake -S "${ROOT_DIR}" -B "${BUILD_DIR}" \
  -G Ninja \
  -DPLATFORM=ios \
  -DAUDIO_BACKEND=miniaudio \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_SYSTEM_NAME=iOS \
  -DCMAKE_OSX_ARCHITECTURES=arm64

cmake --build "${BUILD_DIR}" --config Release
