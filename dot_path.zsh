#!/usr/bin/env bash

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Add Brew
export PATH="/usr/local/sbin:$PATH"

# Add JAVA
export PATH="$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/tools/bin:$PATH"

# Add imagemagick
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
